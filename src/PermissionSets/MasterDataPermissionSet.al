namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Resources.Resource;

permissionset 59100 RFMasterDataPermSet
{
    Assignable = true;
    Caption = 'ResourceFlow Master Data';

    Permissions =
        table "Job Task" = X,
        tabledata "Job Task" = RIMD,
        tabledata Resource = RIMD;
}
