// D:\DojoManagement\AppSrc\Dojo.vw
// Dojo
//

Use DFClient.pkg
Use DFEntry.pkg

Use cDojosDataDictionary.dd
Use cDbCJGrid.pkg

ACTIVATE_VIEW Activate_oDojo FOR oDojo
Object oDojo is a dbView
    Set Location to 5 5
    Set Size to 111 257
    Set Label To "Dojo"
    Set Border_Style to Border_Thick


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Set Main_DD To oDojos_DD
    Set Server  To oDojos_DD

    Object oDbCJGrid1 is a cDbCJGrid
        Set Size to 111 257
        Set Location to 0 0
        Set peAnchors to anAll

        Object oDojos_NAME is a cDbCJGridColumn
            Entry_Item Dojos.NAME
            Set piWidth to 449
            Set psCaption to "Dojo Name"
        End_Object
    End_Object


End_Object // oDojo
