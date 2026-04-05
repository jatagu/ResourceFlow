namespace ITB2204.ResourceFlow;

enum 59100 ResourceTaskStatusEnum
{
    Extensible = true;
    Caption = 'Task Status';

    value(0; Open)
    {
        Caption = 'Open';
    }

    value(1; "In Progress")
    {
        Caption = 'In Progress';
    }

    value(2; Completed)
    {
        Caption = 'Completed';
    }

    value(3; Blocked)
    {
        Caption = 'Blocked';
    }
}
