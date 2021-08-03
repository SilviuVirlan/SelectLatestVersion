page 50142 "API Test Table"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'SV';
    APIGroup = 'TestTableAPI';

    EntityCaption = 'TestTable';
    EntitySetCaption = 'TestTable';
    EntityName = 'testTable';
    EntitySetName = 'testTable';

    ODataKeyFields = SystemId;
    SourceTable = "Test Table";

    Extensible = false;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(SystemId; Rec.SystemId)
                {
                    Caption = 'System Id';
                }
            }
        }
    }

    actions
    {
    }
}
