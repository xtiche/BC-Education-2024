table 70101 Course
{
    Caption = 'Course';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Course Type"; Enum "ABS Blob Access Tier")
        {
            Caption = 'Course Type';
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource;
        }
        field(5; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where(Name = field("Instructor Code")));
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }
}

