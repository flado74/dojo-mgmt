// D:\DojoManagement\AppSrc\Shibu.vw
// Shibu
//

Use DFClient.pkg
Use DFEntry.pkg

Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd
Use cDbCJGrid.pkg

ACTIVATE_VIEW Activate_oShibu FOR oShibu
Object oShibu is a dbView
    Set Location to 5 5
    Set Size to 122 349
    Set Label To "Shibu"
    Set Border_Style to Border_Thick


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server To oDojos_DD
    End_Object // oShibu_DD

    Set Main_DD To oShibu_DD
    Set Server  To oShibu_DD

    Object oDbCJGrid1 is a cDbCJGrid
        Set Size to 122 349
        Set Location to 0 0
        Set peAnchors to anAll

        Object oShibu_NAME is a cDbCJGridColumn
            Entry_Item Shibu.NAME
            Set piWidth to 223
            Set psCaption to "Shibu Name"
        End_Object

        Object oDojos_NAME is a cDbCJGridColumn
            Entry_Item Dojos.NAME
            Set piWidth to 217
            Set psCaption to "Dojo"
        End_Object

        Object oShibu_SHIBU_CHO is a cDbCJGridColumn
            Entry_Item Shibu.SHIBU_CHO
            Set piWidth to 170
            Set psCaption to "SHIBU CHO"
        End_Object
    End_Object


End_Object // oShibu
