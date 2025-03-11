report 60100 "YH Customer Payment"
{
    ApplicationArea = All;
    Caption = 'YH Customer Payment';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "YEHON RDLC";

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
                DataItemLink = "Customer No." = field("No.");

                column(PostingDate; "Posting Date")
                {
                }
                column(DocumentType; "Document Type")
                {
                }
                column(DocumentNo; "Document No.")
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
        layout("YEHON RDLC")
        {
            Type = RDLC;
            LayoutFile = './src/report/layout/YH Customer Payment.rdlc';
        }
        layout("YEHON WORD")
        {
            Type = Word;
            LayoutFile = './src/report/layout/YH Customer Payment.docx';
        }
    }
}
