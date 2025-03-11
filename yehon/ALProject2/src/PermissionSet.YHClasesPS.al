permissionset 60100 "YH Clases PS"
{
    Assignable = true;

    Caption = 'YH Clases PS', MaxLength = 30;

    Permissions =
        tabledata "Class Partisipant" = RMID,
        tabledata Class = RMID,
        tabledata Paritisipant = RMID,
        page "Class Partisipants" = X,
        codeunit "YH Education" = X,
        codeunit "YH Eduction" = X;
}
