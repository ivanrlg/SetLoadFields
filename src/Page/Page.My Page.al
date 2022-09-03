page 59100 "My Page"
{
    ApplicationArea = All;
    Caption = 'Test SetLoadFields';
    PageType = List;
    SourceTable = MyTable;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PK; Rec.PK)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Field 1"; Rec."Field 1")
                {
                    ApplicationArea = All;
                }
                field("Field 2"; Rec."Field 2")
                {
                    ApplicationArea = All;
                }
                field("Field 3"; Rec."Field 3")
                {
                    ApplicationArea = All;
                }
                field("Field 4"; Rec."Field 4")
                {
                    ApplicationArea = All;
                }
                field("Field 5"; Rec."Field 5")
                {
                    ApplicationArea = All;
                }
                field("Field 6"; Rec."Field 6")
                {
                    ApplicationArea = All;
                }
                field("Field 7"; Rec."Field 7")
                {
                    ApplicationArea = All;
                }
                field("Field 8"; Rec."Field 8")
                {
                    ApplicationArea = All;
                }
                field("Field 9"; Rec."Field 9")
                {
                    ApplicationArea = All;
                }
                field("Field 10"; Rec."Field 10")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(factboxes)
        {

            part(TelemetryCuePage; MyCuePage)
            {
                Caption = 'Statistics Box';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RegenerateLines)
            {
                ApplicationArea = All;
                Image = CalculateLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Regenerate';
                ToolTip = 'This will rescramble all the Process Check Values';

                trigger OnAction()
                var
                    Install: Codeunit Install;
                begin
                    Install.GenerateData();
                end;
            }
        }
    }


}
