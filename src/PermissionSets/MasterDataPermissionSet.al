namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Project.Planning;
using Microsoft.Projects.Resources.Resource;
using Microsoft.Projects.TimeSheet;

permissionset 59100 RFMasterDataPermSet
{
    Assignable = true;
    Caption = 'ResourceFlow Master Data';

    Permissions =
        table Job = X,
        tabledata Job = RIMD,
        table "Job Task" = X,
        tabledata "Job Task" = RIMD,
        table "Job Planning Line" = X,
        tabledata "Job Planning Line" = RIMD,
        table "Time Sheet Header" = X,
        tabledata "Time Sheet Header" = R,
        table "Time Sheet Line" = X,
        tabledata "Time Sheet Line" = RIMD,
        tabledata Resource = RIMD;
}
