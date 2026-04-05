namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Planning;

pageextension 59103 JobPlanningLinesPageExt extends "Job Planning Lines"
{
    layout
    {
        modify("Job No.")
        {
            ApplicationArea = All;
            ToolTip = 'Specifies the project number for the planning line.';
        }

        modify("Job Task No.")
        {
            ApplicationArea = All;
            ToolTip = 'Specifies the task number linked to the planning line.';
        }

        modify(Type)
        {
            ApplicationArea = All;
            ToolTip = 'Specifies the planning line type. For work planning use Resource.';
        }

        modify("No.")
        {
            ApplicationArea = All;
            Caption = 'Resource';
            ToolTip = 'Specifies the resource number when Type is Resource.';
        }

        modify(Quantity)
        {
            ApplicationArea = All;
            ToolTip = 'Specifies the planned work quantity.';
        }

        modify("Unit Cost (LCY)")
        {
            ApplicationArea = All;
            ToolTip = 'Specifies the unit cost used for planned cost calculations.';
        }

        modify("Total Cost (LCY)")
        {
            ApplicationArea = All;
            ToolTip = 'Shows the total planned cost for the line.';
        }
    }
}
