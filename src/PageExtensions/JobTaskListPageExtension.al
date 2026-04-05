namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;

pageextension 59102 JobTaskListPageExt extends "Job Task List"
{
    layout
    {
        addlast(Content)
        {
            field("Assigned Resource No."; Rec."Assigned Resource No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the resource assigned to this job task.';
            }

            field("Task Status"; Rec."Task Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the current status of the job task.';
            }

            field(Priority; Rec.Priority)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the priority used for planning this job task.';
            }

            field("Planned Start Date"; Rec."Planned Start Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies when work on this job task is planned to start.';
            }

            field("Planned End Date"; Rec."Planned End Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies when work on this job task is planned to end.';
            }
        }
    }
}