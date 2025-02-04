page 60100 "Class Partisipants"
{
    ApplicationArea = All;
    Caption = 'Class Partisipants';
    PageType = List;
    SourceTable = "Class Partisipant";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Class Code"; Rec."Class Code")
                {
                    ToolTip = 'Specifies the value of the Class Code field.', Comment = '%';
                }
                field("Partisipant Code"; Rec."Partisipant Code")
                {
                    ToolTip = 'Specifies the value of the Partisipant Code field.', Comment = '%';
                }
                field("Partisipant Name"; Rec."Partisipant Name")
                {
                    ToolTip = 'Specifies the value of the Partisipant Name field.', Comment = '%';
                }
            }
        }
    }
}
