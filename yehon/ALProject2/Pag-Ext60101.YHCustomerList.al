pageextension 60101 "YH Customer List" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action("Task 1")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    YHEducation: Codeunit "YH Education";
                begin
                    YHEducation.Run();
                end;
            }
        }
    }
}
