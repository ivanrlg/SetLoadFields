table 59100 MyTable
{
    Caption = 'Blog Example';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(2; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(3; "Field 1"; Decimal)
        {
            Caption = 'Field 1';
            DataClassification = ToBeClassified;
        }
        field(4; "Field 2"; Decimal)
        {
            Caption = 'Field 2';
            DataClassification = ToBeClassified;
        }
        field(5; "Field 3"; Decimal)
        {
            Caption = 'Field 3';
            DataClassification = ToBeClassified;
        }
        field(6; "Field 4"; Decimal)
        {
            Caption = 'Field 4';
            DataClassification = ToBeClassified;
        }
        field(7; "Field 5"; Code[20])
        {
            Caption = 'Field 5';
            DataClassification = ToBeClassified;
        }
        field(8; "Field 6"; Code[20])
        {
            Caption = 'Field 6';
            DataClassification = ToBeClassified;
        }
        field(9; "Field 7"; Code[20])
        {
            Caption = 'Field 7';
            DataClassification = ToBeClassified;
        }
        field(10; "Field 8"; Code[20])
        {
            Caption = 'Field 8';
            DataClassification = ToBeClassified;
        }
        field(11; "Field 9"; Code[20])
        {
            Caption = 'Field 9';
            DataClassification = ToBeClassified;
        }
        field(12; "Field 10"; Code[20])
        {
            Caption = 'Field 10';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

}
