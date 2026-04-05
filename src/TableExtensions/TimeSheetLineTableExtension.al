namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Resources.Resource;
using Microsoft.Projects.TimeSheet;

tableextension 59103 TimeSheetLineTblExt extends "Time Sheet Line"
{
    fields
    {
        modify("Job No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateTimeSheetJobRelations();
            end;
        }

        modify("Job Task No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateTimeSheetJobRelations();
            end;
        }

        modify(Type)
        {
            trigger OnAfterValidate()
            begin
                ValidateTimeSheetJobRelations();
            end;
        }

        modify("Total Quantity")
        {
            trigger OnAfterValidate()
            begin
                ValidateTimeSheetCompletenessForAnalysis();
            end;
        }
    }

    local procedure ValidateTimeSheetJobRelations()
    var
        JobRec: Record Job;
        JobTaskRec: Record "Job Task";
    begin
        if Type <> Type::Job then
            exit;

        if "Job No." = '' then
            exit;

        if not JobRec.Get("Job No.") then
            Error('Job No. %1 does not exist.', "Job No.");

        if Format(JobRec.Blocked) <> '' then
            Error('Job %1 is not active for time entry.', "Job No.");

        if "Job Task No." = '' then
            exit;

        if not JobTaskRec.Get("Job No.", "Job Task No.") then
            Error('Job Task No. %1 does not belong to Job No. %2.', "Job Task No.", "Job No.");
    end;

    local procedure ValidateTimeSheetCompletenessForAnalysis()
    var
        TimeSheetHeader: Record "Time Sheet Header";
        ResourceRec: Record Resource;
    begin
        if "Total Quantity" <= 0 then
            exit;

        if Type <> Type::Job then
            exit;

        if "Job No." = '' then
            Error('Job No. must be specified when time quantity is entered.');

        if "Job Task No." = '' then
            Error('Job Task No. must be specified when time quantity is entered.');

        ValidateTimeSheetJobRelations();

        if "Time Sheet No." = '' then
            Error('Time Sheet No. must be specified when time quantity is entered.');

        if not TimeSheetHeader.Get("Time Sheet No.") then
            Error('Time Sheet Header %1 does not exist.', "Time Sheet No.");

        if TimeSheetHeader."Resource No." = '' then
            Error('Time Sheet Header %1 must have Resource No. specified.', "Time Sheet No.");

        if not ResourceRec.Get(TimeSheetHeader."Resource No.") then
            Error('Resource No. %1 from Time Sheet Header %2 does not exist.', TimeSheetHeader."Resource No.", "Time Sheet No.");

        if not ResourceRec."Active in Project Planning" then
            Error('Resource %1 is inactive and cannot be used for time entry.', ResourceRec."No.");
    end;
}
