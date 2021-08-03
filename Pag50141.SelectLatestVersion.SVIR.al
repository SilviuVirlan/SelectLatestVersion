page 50141 "Test Table"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    DelayedInsert = true;
    SourceTable = "Test Table";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(refresh)
            {
                ApplicationArea = All;
                Image = Refresh;
                trigger OnAction()
                var
                    DisplayMsg: Label 'We had previously %1 rows. Now we have %2 rows. It took %3 milli-seconds to update %4 recs';
                    _duration: Integer;
                    _start, _end : DateTime;
                    _oldCounter, _newCounter : integer;
                begin
                    _start := CurrentDateTime();
                    _oldCounter := Rec.Count();
                    SelectLatestVersion();
                    _newCounter := Rec.Count();
                    CurrPage.Update(false);
                    _end := CurrentDateTime();

                    _duration := _end - _start;
                    Message(StrSubstNo(DisplayMsg, _oldCounter, _newCounter,
                                                  format(_duration), _newCounter));
                end;
            }
            action(refreshNoSelectLatestVersionn)
            {
                ApplicationArea = All;
                Image = Refresh;
                Caption = 'Refresh-SelectLatestVer';
                trigger OnAction()
                var
                    DisplayMsg: Label 'Found %1 rows. It took %2 milli-seconds to update %3 recs';
                    _duration: Integer;
                    _start, _end : DateTime;
                    _oldCounter, _newCounter : integer;
                begin
                    _start := CurrentDateTime();
                    _newCounter := Rec.Count();
                    //SelectLatestVersion();
                    //_newCounter := Rec.Count();
                    CurrPage.Update(false);
                    _end := CurrentDateTime();

                    _duration := _end - _start;
                    Message(StrSubstNo(DisplayMsg, _newCounter,
                                                  format(_duration), _newCounter));
                end;
            }
        }
    }
}