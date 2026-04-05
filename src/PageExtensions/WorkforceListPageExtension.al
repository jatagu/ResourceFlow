namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Resources.Resource;

pageextension 59101 WorkforceListPageExt extends "Resource List"
{
    layout
    {
        addlast(Content)
        {
            field("Resource Role"; Rec."Resource Role")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the role used for resource assignment and analysis.';
            }

            field("Default Capacity"; Rec."Default Capacity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the default work capacity for this resource.';
            }

            field("Active in Project Planning"; Rec."Active in Project Planning")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether this resource can be used in new project planning.';
            }

            field("Cost per Hour"; Rec."Cost per Hour")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the hourly cost used for project cost calculation.';
            }
        }
    }
}
