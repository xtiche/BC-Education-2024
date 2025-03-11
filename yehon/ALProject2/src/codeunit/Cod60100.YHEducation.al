codeunit 60100 "YH Education"
{

    trigger OnRun()
    begin
        ShowHelloWorldMessage();

    end;

    #region Messages

    local procedure ShowHelloWorldMessage()
    begin
        Message('Hello World');
    end;
    #endregion



}
