report 70100 "TM_Customer Payment"
{
    ApplicationArea = All;
    Caption = 'TM_Customer Payment';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = TM_RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field(No.);

                column(Posting_Date; "Posting Date")
                {
                }
                column(Document_Type; "Document Type")
                {
                }
                column(Document_No_; "Document No.")
                {
                }
                column(Amount__LCY_; "Amount (LCY)")
                {
                    DecimalPlaces = 3 : 3;
                }
            }
        }
    }
    rendering
    {
        layout("TM_RDLC")
        {
            Type = RDLC;
            LayoutFile = 'TM_Customer Payment.rdlc';
        }
    }





}    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        NewLabel: Label 'TM_Customer Payment';

}
