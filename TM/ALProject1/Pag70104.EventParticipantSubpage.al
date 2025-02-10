page 70104 "Event Participant Subpage"
{
    Caption = 'Event Participant Subpage';
    PageType = ListPart;
    SourceTable = "TM_Event Participan";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Checked-in"; Rec."Checked-in")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Checked-in field.', Comment = '%';
                }
                field("Event No."; Rec."Event No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Event No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Participant Contact  No."; Rec."Participant Contact  No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Participant Contact  No. field.', Comment = '%';
                }
                field("Participant Email"; Rec."Participant Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Participant Email field.', Comment = '%';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Participant Name field.', Comment = '%';
                }
                field("Participant Phone"; Rec."Participant Phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Participant Phone field.', Comment = '%';
                }
                field("Registration Confirmed"; Rec."Registration Confirmed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Confirmed field.', Comment = '%';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }
}
