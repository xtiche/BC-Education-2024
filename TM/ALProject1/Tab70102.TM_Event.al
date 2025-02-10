table 70102 TM_Event
{
    Caption = 'TM_Event';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(2; "Event Date"; Date)
        {
            Caption = 'Event Date';
        }
        field(3; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            TableRelation = Course;

        }
        field(4; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            FieldClass = FlowField;
        }
        field(5; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource;
        }
        field(6; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where(Name = field("Instructor Code")));
            Editable = false;
        }
        field(7; "No. of Registered Participants"; Integer)
        {
            Caption = 'No. of Registered  Participants';
            FieldClass = FlowField;
            Editable = false;
        }
        field(8; "No. of Actual  Participants"; Integer)
        {
            Caption = 'No. of Actual  Participants';
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Event Date")
      }
