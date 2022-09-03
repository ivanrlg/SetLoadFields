permissionset 59100 "My permissionset"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         codeunit Install = X,
         page "My Page" = X,
         table MyTable = X,
         tabledata MyTable = RIMD;
}