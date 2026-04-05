namespace ITB2204.ResourceFlow;

using Microsoft.Projects.Resources.Resource;

tableextension 59101 WorkforceTblExt extends Resource
{
    fields
    {
        field(50000; "Resource Role"; Enum WorkforceRoleEnum)
        {
            Caption = 'Resource Role';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Resource Role" = "Resource Role"::Undefined then
                    Error('Resource Role must be specified.');
            end;
        }

        field(50001; "Default Capacity"; Decimal)
        {
            Caption = 'Default Capacity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Default Capacity" <= 0 then
                    Error('Default Capacity must be greater than 0.');
            end;
        }

        field(50002; "Active in Project Planning"; Boolean)
        {
            Caption = 'Active in Project Planning';
            DataClassification = CustomerContent;
        }

        field(50003; "Cost per Hour"; Decimal)
        {
            Caption = 'Cost per Hour';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Cost per Hour" < 0 then
                    Error('Cost per Hour cannot be negative.');
            end;
        }
    }
}