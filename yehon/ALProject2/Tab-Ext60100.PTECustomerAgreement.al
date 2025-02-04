tableextension 60100 "PTE Customer Agreement" extends "SMA Customer Agreement"
{
    fields
    {
        field(50100; "PTE My Description"; Text[100])
        {
            Caption = 'My Description';
            DataClassification = CustomerContent;
        }
    }
}
