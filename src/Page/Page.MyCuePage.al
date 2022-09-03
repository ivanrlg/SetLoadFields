page 59101 MyCuePage
{
    PageType = CardPart;
    SourceTable = MyTable;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            cuegroup(Normal)
            {
                Caption = 'Normal';
                Visible = true;
                CuegroupLayout = Wide;
                field(Count1; Count1)
                {
                    Caption = 'Count1 (Normal)';
                    ApplicationArea = All;
                }
                field(Mean1; Mean1)
                {
                    Caption = 'Mean1 (Normal)';
                    ToolTip = 'Normal average calculation';
                    ApplicationArea = All;
                }
            }
            cuegroup(SetLoadFields)
            {
                Caption = 'SetLoadFields';
                Visible = true;
                CuegroupLayout = Wide;
                field(Count2; Count2)
                {
                    Caption = 'Count2 (SetLoadFields)';
                    ApplicationArea = All;
                }
                field(Mean2; Mean2)
                {
                    Caption = 'Mean2 (SetLoadFields)';
                    ToolTip = 'Average calculation using SetLoadFields';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(TotalsAction1)
            {
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Compute Average';
                ToolTip = 'This method will run normally';

                trigger OnAction()
                var
                    StartTime: DateTime;
                    EndTime: DateTime;
                    Mean: decimal;
                    Duration: Duration;
                begin
                    StartTime := CurrentDateTime();

                    Mean := ComputeArithmeticMean1();

                    EndTime := CurrentDateTime();
                    Duration := EndTime - StartTime;

                    TotalDuration1 += Duration;
                    Count1 += 1;

                    Message(Label, Format(Duration), Format(Mean));
                end;
            }
            action(TotalsAction2)
            {
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Compute Average (SetLoadFields)';
                ToolTip = 'This method will use the SetLoadFields function';

                trigger OnAction()
                var
                    StartTime: DateTime;
                    EndTime: DateTime;
                    Mean: decimal;
                    Duration: Duration;
                begin
                    StartTime := CurrentDateTime();

                    Mean := ComputeArithmeticMean2();

                    EndTime := CurrentDateTime();
                    Duration := EndTime - StartTime;

                    Count2 += 1;
                    TotalDuration2 += Duration;

                    Message(Label, Format(Duration), Format(Mean));
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    var
    begin
        if Count1 <> 0 then
            Mean1 := TotalDuration1 / Count1;
        if Count2 <> 0 then
            Mean2 := TotalDuration2 / Count2;
    end;

    procedure ComputeArithmeticMean1(): Decimal;
    var
        MyTable: Record MyTable;
        SumTotal: Decimal;
        Counter: Integer;
    begin
        if MyTable.FindSet() then begin
            repeat
                SumTotal += MyTable.Quantity;
                Counter += 1;
            until MyTable.Next() = 0;
            exit(SumTotal / Counter);
        end;
    end;

    procedure ComputeArithmeticMean2(): Decimal;
    var
        MyTable: Record MyTable;
        SumTotal: Decimal;
        Counter: Integer;
    begin
        MyTable.SetLoadFields(MyTable.Quantity);
        if MyTable.FindSet() then begin
            repeat
                SumTotal += MyTable.Quantity;
                Counter += 1;
            until MyTable.Next() = 0;
            exit(SumTotal / Counter);
        end;
    end;

    var
        Label: Label 'Total time in the calculation %1\ The average of the numbers is %2:';

    var
        Mean1: Decimal;
        Mean2: Decimal;
        TotalDuration1: Decimal;
        TotalDuration2: Decimal;
        Count1: Integer;
        Count2: Integer;
}