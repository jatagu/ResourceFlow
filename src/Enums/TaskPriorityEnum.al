namespace ITB2204.ResourceFlow;

enum 59101 ResourceTaskPriorityEnum
{
    Extensible = true;
    Caption = 'Task Priority';

    value(0; Low)
    {
        Caption = 'Low';
    }

    value(1; Normal)
    {
        Caption = 'Normal';
    }

    value(2; High)
    {
        Caption = 'High';
    }

    value(3; Critical)
    {
        Caption = 'Critical';
    }
}
