table 60102 "Class Partisipant"
{
    Caption = 'Class Partisipant';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Class Code"; Code[10])
        {
            Caption = 'Class Code';
        }
        field(2; "Partisipant Code"; Code[10])
        {
            Caption = 'Partisipant Code';
        }
        field(10; "Partisipant Name"; Text[100])
        {
            Caption = 'Partisipant Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Paritisipant.Name where(Code = field("Partisipant Code")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Class Code", "Partisipant Code")
        {
            Clustered = true;
        }
    }
}
