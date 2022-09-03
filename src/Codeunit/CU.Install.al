codeunit 59100 Install
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        MyTable: Record MyTable;
    begin
        GenerateData();
    end;

    internal procedure GenerateData()
    var
        I: Integer;
        MyTable: Record MyTable;
    begin
        MyTable.DeleteAll();

        for I := 1 to 80000 do begin
            QuickAddEntry(I);
        end;
    end;

    local procedure QuickAddEntry(I: integer)
    var
        MyTable: Record MyTable;
    begin
        MyTable.Validate(PK, I);
        MyTable.Validate("Field 1", Random(100));
        MyTable.Validate("Field 2", Random(200));
        MyTable.Validate("Field 3", Random(300));
        MyTable.Validate("Field 4", Random(400));
        MyTable.Validate("Field 5", RandomChar());
        MyTable.Validate("Field 6", RandomChar());
        MyTable.Validate("Field 7", RandomChar());
        MyTable.Validate("Field 8", RandomChar());
        MyTable.Validate("Field 9", RandomChar());
        MyTable.Validate("Field 10", RandomChar());
        MyTable.Validate(Quantity, Random(10000));
        if MyTable.Insert(true) then;
    end;


    local procedure RandomChar(): Code[20]
    var
        validChar: Array[200] of Char;
        CodeString: Code[20];
    begin
        validChar[1] := '0';
        validChar[2] := '1';
        validChar[3] := '3';
        validChar[4] := '4';
        validChar[5] := '5';
        validChar[6] := '6';
        validChar[7] := '7';
        validChar[8] := '8';
        validChar[9] := '9';

        validChar[10] := '-';
        validChar[11] := '!';
        validChar[12] := '@';
        validChar[13] := '#';
        validChar[14] := '$';
        validChar[16] := '%';
        validChar[16] := '&';
        validChar[17] := '*';
        validChar[18] := '>';
        validChar[19] := '<';
        validChar[20] := '?';

        Clear(CodeString);
        while StrLen(CodeString) < 20 do begin
            CodeString := CodeString + Format(validChar[Random(20)]);
        end;

        exit(CodeString);
    end;
}
