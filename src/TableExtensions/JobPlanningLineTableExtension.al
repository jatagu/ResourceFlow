namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Project.Planning;
using Microsoft.Projects.Resources.Resource;

tableextension 59102 JobPlanningLineTblExt extends "Job Planning Line"
{
    fields
    {
        modify("Job No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateJobNoExists();
            end;
        }

        modify("Job Task No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateJobTaskBelongsToJob();
            end;
        }

        modify(Type)
        {
            trigger OnAfterValidate()
            begin
                ValidateLineTypeForWorkPlanning();
            end;
        }

        modify("No.")
        {
            Caption = 'Resource';

            trigger OnAfterValidate()
            begin
                ValidateResourceNo();
                EnsureUnitCostFromResource();
            end;
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                ValidateQuantityForWorkPlanning();
            end;
        }

        modify("Unit Cost (LCY)")
        {
            trigger OnAfterValidate()
            begin
                EnsureUnitCostFromResource();
            end;
        }
    }

    local procedure ValidateJobNoExists()
    var
        JobRec: Record Job;
    begin
        if "Job No." = '' then
            Error('Job No. must be specified.');

        if not JobRec.Get("Job No.") then
            Error('Job No. %1 does not exist.', "Job No.");
    end;

    local procedure ValidateJobTaskBelongsToJob()
    var
        JobTaskRec: Record "Job Task";
    begin
        if "Job Task No." = '' then
            exit;

        if "Job No." = '' then
            Error('Job No. must be specified before Job Task No.');

        if not JobTaskRec.Get("Job No.", "Job Task No.") then
            Error('Job Task No. %1 does not belong to Job No. %2.', "Job Task No.", "Job No.");
    end;

    local procedure ValidateLineTypeForWorkPlanning()
    begin
        if Type <> Type::Resource then
            Error('Line Type must be Resource for work planning lines.');
    end;

    local procedure ValidateResourceNo()
    var
        ResourceRec: Record Resource;
    begin
        if Type <> Type::Resource then
            exit;

        if "No." = '' then
            exit;

        if not ResourceRec.Get("No.") then
            Error('Resource No. %1 does not exist.', "No.");

        if not ResourceRec."Active in Project Planning" then
            Error('Resource %1 is inactive and cannot be used in planning lines.', "No.");
    end;

    local procedure ValidateQuantityForWorkPlanning()
    begin
        if Type <> Type::Resource then
            exit;

        if Quantity < 0 then
            Error('Quantity cannot be negative for resource planning lines.');

        if Quantity = 0 then
            exit;

        if "Job No." = '' then
            Error('Job No. must be specified before entering resource quantity.');

        if "Job Task No." = '' then
            Error('Job Task No. must be specified before entering resource quantity.');

        if "No." = '' then
            Error('Resource must be specified before entering resource quantity.');

        ValidateJobNoExists();
        ValidateJobTaskBelongsToJob();
        ValidateResourceNo();
    end;

    local procedure EnsureUnitCostFromResource()
    var
        ResourceRec: Record Resource;
    begin
        if Type <> Type::Resource then
            exit;

        if "No." = '' then
            exit;

        if not ResourceRec.Get("No.") then
            exit;

        if "Unit Cost (LCY)" > 0 then
            exit;

        if ResourceRec."Unit Cost" <= 0 then
            Error('Unit Cost must be specified on the planning line or derivable from Resource %1.', "No.");

        "Unit Cost (LCY)" := ResourceRec."Unit Cost";

        if ResourceRec."Direct Unit Cost" > 0 then
            "Direct Unit Cost (LCY)" := ResourceRec."Direct Unit Cost";
    end;
}
