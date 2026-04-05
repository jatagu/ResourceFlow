namespace ITB2204.ResourceFlow;

enum 59102 WorkforceRoleEnum
{
    Extensible = true;
    Caption = 'Resource Role';

    value(0; Undefined)
    {
        Caption = 'Select role';
    }

    value(1; Developer)
    {
        Caption = 'Developer';
    }

    value(2; Manager)
    {
        Caption = 'Manager';
    }

    value(3; Analyst)
    {
        Caption = 'Analyst';
    }
}