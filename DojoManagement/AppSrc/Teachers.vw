// D:\DojoManagement\AppSrc\Teachers.vw
// Teachers
//

Use DFClient.pkg
Use DFEntry.pkg
Use dfcentry.pkg

Use cDojosDataDictionary.dd
Use cTeachersDataDictionary.dd
Use cDbCJGrid.pkg

ACTIVATE_VIEW Activate_oTeachers FOR oTeachers
Object oTeachers is a dbView
    Set Location to 1 1
    Set Size to 133 264
    Set Label To "Teachers"
    Set Border_Style to Border_Thick


    Object oDojos_DD is a cDojosDataDictionary
    End_Object // oDojos_DD

    Object oTeachers_DD is a cTeachersDataDictionary
        Set DDO_Server To oDojos_DD
    End_Object // oTeachers_DD

    Set Main_DD To oTeachers_DD
    Set Server  To oTeachers_DD

    Object oDbCJGrid1 is a cDbCJGrid
        Set Size to 133 264
        Set Location to 0 0
        Set pbAllowInsertRow to False
        Set peAnchors to anAll

        Object oTeachers_Name is a cDbCJGridColumn
            Entry_Item Teachers.Name
            Set piWidth to 102
            Set psCaption to "Name"
        End_Object

        Object oTeachers_Type is a cDbCJGridColumn
            Entry_Item Teachers.Type
            Set piWidth to 96
            Set psCaption to "Type"
            Set pbComboButton to True
        End_Object

        Object oTeachers_Rank is a cDbCJGridColumn
            Entry_Item Teachers.Rank
            Set piWidth to 92
            Set psCaption to "Rank"
            Set pbComboButton to True
        End_Object

        Object oDojos_NAME is a cDbCJGridColumn
            Entry_Item Dojos.NAME
            Set piWidth to 172
            Set psCaption to "Dojo"
        End_Object
    End_Object


End_Object // oTeachers
