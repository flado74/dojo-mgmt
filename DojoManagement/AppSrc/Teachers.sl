// Teachers.sl
// Teachers Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cDojosDataDictionary.dd
Use cTeachersDataDictionary.dd

CD_Popup_Object Teachers_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 170
    Set Label To "Teachers Lookup List"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Object oTeachers_DD is a cTeachersDataDictionary
        Set DDO_Server To oDojos_DD
    End_Object // oTeachers_DD

    Set Main_DD To oTeachers_DD
    Set Server  To oTeachers_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 160
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "Teachers_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oTeachers_Name is a cDbCJGridColumn
            Entry_Item Teachers.Name
            Set piWidth to 262
            Set psCaption to "Name"
        End_Object // oTeachers_Name


    End_Object // oSelList

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 7
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object // oOk_bn

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 61
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object // oCancel_bn

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 115
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object // oSearch_bn

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // Teachers_sl
