namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Resources.Resource;

page 59100 WorkforceListPage
{
    ApplicationArea = All;
    Caption = 'Workforce List';
    Editable = true;
    PageType = List;
    SourceTable = Resource;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique number of the resource.';
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the resource.';
                }

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

                field("Capacity Period"; Rec."Capacity Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether default capacity is defined per week or per month.';
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
}
