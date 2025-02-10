table 70103 "TM_Event Participan"
{
    Caption = 'TM_Event Participan';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Event No."; Code[20])
        {
            Caption = 'Event No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
        }
        field(4; "Participant Contact  No."; Code[20])
        {
            Caption = 'Participant Contact  No.';
            TableRelation = Contact where
        }
        field(5; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
        }
        field(6; "Participant Email"; Text[100])
        {
            Caption = 'Participant Email';
        }
        field(7; "Participant Phone"; Text[30])
        {
            Caption = 'Participant Phone';
        }
        field(8; "Registration Confirmed"; Boolean)
        {
            Caption = 'Registration Confirmed';
        }
        field(9; "Checked-in"; Boolean)
        {
            Caption = 'Checked-in';
        }
    }
    keys
    {
        key(Key1; "Event No.")
        {
            Clustered = true;
        }
        key(Key2; "Line No.")
    }
    }
