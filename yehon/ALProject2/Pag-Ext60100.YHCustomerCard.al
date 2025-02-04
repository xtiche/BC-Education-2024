pageextension 60100 "YH Customer Agreement" extends "SMA Customer Agreement Card"
{
    layout
    {
        modify(Description)
        {
            Visible = false;
        }

        modify("Agreement Amount")
        {
            Caption = 'Agreement Balance';
        }

        addlast(General)
        {
            field("PTE My Description"; Rec."PTE My Description")
            {
                ApplicationArea = All;
                ToolTip = 'Enter the PTE My Description';
            }
        }
    }

    actions
    {
        modify("Blanket Orders")
        {
            Visible = false;
        }

        addlast(Agreement)
        {
            action("Customer Ledger Entries")
            {
                Caption = 'Customer Ledger Entries';
                ApplicationArea = All;
                ToolTip = 'View the Customer Ledger Entries';
                RunObject = Page "Customer Ledger Entries";
                RunPageLink = "Customer No." = field("Customer No.");
            }
        }
    }
}
