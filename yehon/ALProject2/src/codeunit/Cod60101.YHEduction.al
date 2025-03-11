codeunit 60101 "YH Eduction"
{
    InherentPermissions = X;
    Permissions =
        tabledata "FA Ledger Entry" = r,
        tabledata "Vendor Ledger Entry" = rm;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateEvent, Quantity, false, false)]
    local procedure OnBeforeValidateEvent(var Rec: Record "Sales Line")
    var
        VLE: Record "Vendor Ledger Entry";
    begin
        if Rec."Quantity" < 0 then
            Rec.FieldError("Quantity", 'Quantity cannot be negative');
    end;
    //     VLE.Get(1);
    //     VLE."Vendor No." := 'Vend001';
    //     VLE.Modify();
    // end;
}
