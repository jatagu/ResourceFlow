namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Resources.Resource;

tableextension 59100 ResourceJobTaskTblExt extends "Job Task"
{
    fields
    {
        modify("Job No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateJobExists();
                AssignNextJobTaskNoIfNeeded();
            end;
        }

        modify("Job Task No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateJobTaskNo();
            end;
        }

        modify(Description)
        {
            trigger OnAfterValidate()
            begin
                ValidateDescription();
            end;
        }

        field(50000; "Assigned Resource No."; Code[20])
        {
            Caption = 'Assigned Resource No.';
            DataClassification = CustomerContent;
            TableRelation = Resource."No.";

            trigger OnValidate()
            var
                ResourceRec: Record Resource;
            begin
                if "Assigned Resource No." = '' then
                    exit;

                if not ResourceRec.Get("Assigned Resource No.") then
                    Error('Assigned Resource No. %1 does not exist in Resource.', "Assigned Resource No.");

                if not ResourceRec."Active in Project Planning" then
                    Error('Resource %1 is inactive and cannot be assigned to a job task.', "Assigned Resource No.");
            end;
        }

        field(50001; "Task Status"; Enum ResourceTaskStatusEnum)
        {
            Caption = 'Task Status';
            DataClassification = CustomerContent;
        }

        field(50002; Priority; Enum ResourceTaskPriorityEnum)
        {
            Caption = 'Priority';
            DataClassification = CustomerContent;
        }

        field(50003; "Planned Start Date"; Date)
        {
            Caption = 'Planned Start Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidatePlannedDates();
            end;
        }

        field(50004; "Planned End Date"; Date)
        {
            Caption = 'Planned End Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidatePlannedDates();
            end;
        }
    }

    trigger OnBeforeInsert()
    begin
        AssignNextJobTaskNoIfNeeded();
    end;

    local procedure ValidatePlannedDates()
    begin
        if ("Planned Start Date" <> 0D) and ("Planned End Date" <> 0D) and ("Planned End Date" < "Planned Start Date") then
            Error('Planned End Date cannot be earlier than Planned Start Date.');
    end;

    local procedure ValidateJobExists()
    var
        JobRec: Record Job;
    begin
        if "Job No." = '' then
            exit;

        if not JobRec.Get("Job No.") then
            Error('Job No. %1 does not exist.', "Job No.");
    end;

    local procedure ValidateJobTaskNo()
    begin
        if "Job Task No." = '' then
            Error('Job Task No. must be specified.');
    end;

    local procedure ValidateDescription()
    begin
        if DelChr(Description, '<>', ' ') = '' then
            Error('Description must be specified.');
    end;

    local procedure AssignNextJobTaskNoIfNeeded()
    begin
        if "Job No." = '' then
            exit;

        if "Job Task No." <> '' then
            exit;

        "Job Task No." := GetNextJobTaskNo("Job No.");
    end;

    local procedure GetNextJobTaskNo(JobNo: Code[20]): Code[20]
    var
        JobTaskRec: Record "Job Task";
        CandidateTaskNo: Code[20];
    begin
        JobTaskRec.SetRange("Job No.", JobNo);
        if not JobTaskRec.FindLast() then
            exit('1000');

        CandidateTaskNo := IncStr(JobTaskRec."Job Task No.");
        if CandidateTaskNo = '' then
            CandidateTaskNo := '1000';

        while JobTaskRec.Get(JobNo, CandidateTaskNo) do
            CandidateTaskNo := IncStr(CandidateTaskNo);

        exit(CandidateTaskNo);
    end;

}
