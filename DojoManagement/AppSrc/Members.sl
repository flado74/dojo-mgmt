// Members.sl
// Members Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd
Use cMembersDataDictionary.dd

CD_Popup_Object Members_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 350
    Set Label to "Members"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server To oDojos_DD
    End_Object // oShibu_DD

    Object oMembers_DD is a cMembersDataDictionary
        Set DDO_Server To oDojos_DD
        Set DDO_Server To oShibu_DD
    End_Object // oMembers_DD

    Set Main_DD To oMembers_DD
    Set Server  To oMembers_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 340
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "Members_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oMembers_FIRST_NAME is a cDbCJGridColumn
            Entry_Item Members.FIRST_NAME
            Set piWidth to 105
            Set psCaption to "First Name"
        End_Object // oMembers_FIRST_NAME

        Object oMembers_LAST_NAME is a cDbCJGridColumn
            Entry_Item Members.LAST_NAME
            Set piWidth to 210
            Set psCaption to "Last Name"
        End_Object // oMembers_LAST_NAME

        Object oMembers_EMAIL is a cDbCJGridColumn
            Entry_Item Members.EMAIL
            Set piWidth to 262
            Set psCaption to "E-mail"
        End_Object // oMembers_EMAIL


    End_Object // oSelList

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 187
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object // oOk_bn

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 241
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object // oCancel_bn

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 295
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object // oSearch_bn

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // Members_sl
