namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Resources.Resource;

tableextension 59100 ResourceJobTaskTblExt extends "Job Task"
{
    fields
    {
        field(50000; "Assigned Resource No."; Code[20])
        {
            Caption = 'Assigned Resource No.';
            TableRelation = Resource."No.";

            trigger OnValidate()
            var
                ResourceRec: Record Resource;
            begin
                if "Assigned Resource No." = '' then
                    exit;

                if not ResourceRec.Get("Assigned Resource No.") then
                    Error('Assigned Resource No. %1 does not exist in Resource.', "Assigned Resource No.");
            end;
        }

        field(50001; "Task Status"; Enum ResourceTaskStatusEnum)
        {
            Caption = 'Task Status';
        }

        field(50002; Priority; Enum ResourceTaskPriorityEnum)
        {
            Caption = 'Priority';
        }

        field(50003; "Planned Start Date"; Date)
        {
            Caption = 'Planned Start Date';

            trigger OnValidate()
            begin
                ValidatePlannedDates();
            end;
        }

        field(50004; "Planned End Date"; Date)
        {
            Caption = 'Planned End Date';

            trigger OnValidate()
            begin
                ValidatePlannedDates();
            end;
        }
    }

    local procedure ValidatePlannedDates()
    begin
        if ("Planned Start Date" <> 0D) and ("Planned End Date" <> 0D) and ("Planned End Date" < "Planned Start Date") then
            Error('Planned End Date cannot be earlier than Planned Start Date.');
    end;
}
