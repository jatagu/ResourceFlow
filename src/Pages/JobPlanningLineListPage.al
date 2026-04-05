namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Planning;

page 59102 JobPlanningLineListPage
{
    ApplicationArea = All;
    Caption = 'Job Planning Line List';
    Editable = true;
    PageType = List;
    SourceTable = "Job Planning Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the project number for the planning line.';
                }

                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the task number linked to the planning line.';
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planning line type. For work planning use Resource.';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Resource';
                    ToolTip = 'Specifies the resource number when Type is Resource.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planned work quantity.';
                }

                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit cost used for planned cost calculations.';
                }

                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the total planned cost for the line.';
                }
            }
        }
    }
}
