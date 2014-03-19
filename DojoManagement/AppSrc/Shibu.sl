// Shibu.sl
// Shibu Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd

CD_Popup_Object Shibu_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 336
    Set Label To "Shibu Lookup List"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server To oDojos_DD
    End_Object // oShibu_DD

    Set Main_DD To oShibu_DD
    Set Server  To oShibu_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 326
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "Shibu_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oShibu_ID is a cDbCJGridColumn
            Entry_Item Shibu.ID
            Set piWidth to 28
            Set psCaption to "ID"
        End_Object // oShibu_ID

        Object oShibu_NAME is a cDbCJGridColumn
            Entry_Item Shibu.NAME
            Set piWidth to 262
            Set psCaption to "Name"
        End_Object // oShibu_NAME

        Object oDojos_NAME is a cDbCJGridColumn
            Entry_Item Dojos.NAME
            Set piWidth to 262
            Set psCaption to "Dojo"
        End_Object // oDojos_NAME


    End_Object // oSelList

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 173
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object // oOk_bn

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 227
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object // oCancel_bn

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 281
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object // oSearch_bn

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // Shibu_sl
