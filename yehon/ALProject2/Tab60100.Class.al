table 60100 Class
{
    Caption = 'Class';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(20; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
