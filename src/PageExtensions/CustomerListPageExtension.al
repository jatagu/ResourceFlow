namespace ITB2204.ResourceFlow;

using Microsoft.Sales.Customer;

pageextension 59100 ResourceCustListPageExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}
