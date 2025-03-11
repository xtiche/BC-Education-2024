codeunit 60102 YH
{
    internal procedure CreateSalesVATInvFromServiceInvoice(ServiceInvHeader: Record "Service Invoice Header"; ShowMessage: Boolean; SendToRSGEAndAssignWaybills: Boolean): Code[20]
    var
        ServiceInvoiceLine: Record "Service Invoice Line";
    <span style="background-color:#82CDA8">ServiceInvoiceLineTEMP: Record "Service Invoice Line" temporary;</span>
       SalesVATInvoiceHeaderGE: Record "SMA GE Sales VAT Inv Header";
        SalesVATInvoiceLineGE: Record "SMA GE Sales VAT Inv Line";
        SalesVATInvoiceSource: Record "SMA GE Sales VAT Inv Source";
        LineNo: Integer;
        Handled: Boolean;
    begin
        RevenueSetup.SetLoadFields("Shipment Waybill Assignment");
        GetRevenueSetup();

        SalesVATInvoiceSource.SetRange("Source Type", SalesVATInvoiceSource."Source Type"::Invoice);
        SalesVATInvoiceSource.SetRange("Source No.", ServiceInvHeader."No.");
        SalesVATInvoiceSource.SetRange("Source Date", ServiceInvHeader."Posting Date");
        if not SalesVATInvoiceSource.IsEmpty() and ShowMessage then
            if not Confirm(SalesVATInvoiceExistsQst, false, ServiceInvHeader.RecordId) then
                exit;

        SalesVATInvoiceHeaderGE.Init();
        SalesVATInvoiceHeaderGE.Insert(true);
        SalesVATInvoiceHeaderGE.CopyFromServiceInvoiceHeader(ServiceInvHeader);
        SalesVATInvoiceHeaderGE.Modify(true);



        if <span style = "background-color:#82CDA8" > ServiceInvoiceLineTEMP </span >.FindSet() then
           repeat
               СreateSalesVATInvoiceLineFromServiceInvoiceLine(SalesVATInvoiceHeaderGE, SalesVATInvoiceLineGE, <span style="background-color:#82CDA8">ServiceInvoiceLineTEMP</span>, LineNo);
        until <span style = "background-color:#82CDA8" > ServiceInvoiceLineTEMP </span >.Next() = 0;

        FillInvoiceSourceFromServiceInvoiceHeader(ServiceInvHeader, SalesVATInvoiceHeaderGE);

        if RevenueSetup."Shipment Waybill Assignment" and SendToRSGEAndAssignWaybills then
            if SendSalesVATInvoiceToRSGE(SalesVATInvoiceHeaderGE) and (SalesVATInvoiceHeaderGE."Invoice ID" <> '') then
                AssignWaybillsToSalesVATInvoice(SalesVATInvoiceHeaderGE."Invoice ID", SalesVATInvoiceHeaderGE."No.");

        if ShowMessage then
            if Confirm(ShowCreatedDocumentQst, true, SalesVATInvoiceHeaderGE."No.") then
                Page.Run(Page::"SMA GE Sales VAT Invoice", SalesVATInvoiceHeaderGE);

        exit(SalesVATInvoiceHeaderGE."No.");
    end;


    local procedure СreateSalesVATInvoiceLineFromServiceInvoiceLine(SalesVATInvoiceHeaderGE: Record "SMA GE Sales VAT Inv Header"; var SalesVATInvoiceLineGE: Record "SMA GE Sales VAT Inv Line"; ServiceInvoiceLine: Record "Service Invoice Line"; var LineNo: Integer)
    var
        GLAccount: Record "G/L Account";
    begin
        if ServiceInvoiceLine.Type = ServiceInvoiceLine.Type::"G/L Account" then begin
            GLAccount.Get(ServiceInvoiceLine."No.");
            if GLAccount."SMA GE Not Create Invoice Line" then
                exit;
        end;
        LineNo += 10000;
        SalesVATInvoiceLineGE.Init();
        SalesVATInvoiceLineGE."Document No." := SalesVATInvoiceHeaderGE."No.";
        SalesVATInvoiceLineGE."Line No." := LineNo;
        SalesVATInvoiceLineGE.CopyFromServiceInvoiceLine(ServiceInvoiceLine);
        SalesVATInvoiceLineGE.Insert(true);
    end;

    internal procedure CopyFromServiceInvoiceLine(ServiceInvoiceLine: Record "Service Invoice Line")
    var
        ServiceInvoiceHeader: Record "Service Invoice Header";
    begin
        case ServiceInvoiceLine.Type of
            ServiceInvoiceLine.Type::Item:
                Validate("Line Type", "Line Type"::Item);
            ServiceInvoiceLine.Type::"G/L Account":
                Validate("Line Type", "Line Type"::"G/L Account");
            ServiceInvoiceLine.Type::Resource:
                Validate("Line Type", "Line Type"::Resource);
            ServiceInvoiceLine.Type::Cost:
                Validate("Line Type", "Line Type"::Cost);
        end;
        Validate("No.", ServiceInvoiceLine."No.");
        Validate(Quantity, ServiceInvoiceLine.Quantity);
        Validate("Unit Of Measure Code", ServiceInvoiceLine."Unit of Measure Code");
        Validate("VAT Bus. Posting Group", ServiceInvoiceLine."VAT Bus. Posting Group");
        Validate("VAT Prod. Posting Group", ServiceInvoiceLine."VAT Prod. Posting Group");

        if ServiceInvoiceHeader."Prices Including VAT" then begin
            SetModifiedFiledNo(FieldNo("Price Incl. VAT & Excise"));
            Validate("Price Incl. VAT & Excise", ServiceInvoiceLine."Unit Price")
        end else
            Validate("Price Excl. VAT & Excise", ServiceInvoiceLine."Unit Price");

        "Sales Invoice No." := ServiceInvoiceLine."Document No.";
        "Sales Invoice Line No." := ServiceInvoiceLine."Line No.";

        OnAfterCopyFromServiceInvoiceLine(Rec, ServiceInvoiceLine);
    end;
}
