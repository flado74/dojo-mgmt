Use Windows.pkg
Use DFClient.pkg
Use cDbCJGrid.pkg
Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd
Use cMembersDataDictionary.dd
Use cDojoCjReportControl.pkg

Activate_View Activate_oMemberList for oMemberList
Object oMemberList is a dbView
    Object oDojos_DD is a cDojosDataDictionary
    End_Object

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server to oDojos_DD
    End_Object

    Object oMembers_DD is a cMembersDataDictionary
        Set DDO_Server to oShibu_DD
        Set DDO_Server to oDojos_DD
        Procedure OnConstrain
            Constrain Members.ACTIVE_MEMBER eq 1
        End_Procedure
    End_Object

    Set Main_DD to oMembers_DD
    Set Server to oMembers_DD

    Set Border_Style to Border_Thick
    Set Size to 200 443
    Set Location to 2 2
    Set Label to "Members List"
    Set pbAutoActivate to True
    Set Maximize_Icon to True

    Object oSigCJReportControl1 is a cDojoCjReportControl
        Set Size to 200 443
        Set Location to 0 0
        Set peAnchors     to anAll
        Set phoDD         to (Server(Self))
        Set piTable_Index to 1
        Set pbPX_Save_Layout to True
        Set pbRow_Item to True
        Set pbZero_Suppress_Currency to True
        Set pbZero_Suppress_Decimal to True
        Set pbZero_Suppress_Integer to True
        Set pbRowID_Mode to True
        
    //    Set pbPX_Save_Layout to True
    //    Set psPX_Tag to (Label(Self))
    
        Procedure OnAdd_ContextMenu_ReportArea Handle hoContextMenu
            Send Add_MenuItem of hoContextMenu "Process Selected Rows"  "Process_Rows"     True     
        End_Procedure
    
        Procedure OnDefine_Columns
            Send Add_Report_Column "Name"               80 eRC_String  eRC_Standard "Members.Full_name"
            Send Add_Report_Column "Rank"               80 eRC_String  eRC_Standard "(Find_Code_Description((oRank(oMembers_DD(self))), Members.JISSENKOBUDO_RANK))"
            Send Add_Report_Column "E-mail"             80 eRC_String  eRC_Standard "Members.Email"
            Send Add_Report_Column "Membership"         80 eRC_String  eRC_Standard "(Find_Code_Description((oMemberships(oMembers_DD(self))), Members.MEMBERSHIP))"
            Send Add_Report_Column "Member Type"        80 eRC_String  eRC_Standard "(Find_Code_Description((oMemberType(oMembers_DD(self))), Members.MEMBER_TYPE))"
            Send Add_Report_Column "Dojo"               80 eRC_String  eRC_Standard "Dojos.Name"
            Send Add_Report_Column "Shibu"              80 eRC_String  eRC_Standard "Shibu.Name"
        End_Procedure

        Procedure OnDouble_Click_RowID RowID Row_ID
            Boolean bFound
            Move (FindByRowId(Members.File_Number, Row_ID)) to bFound
            If (bFound) Begin
                Send Activate_oMember_View Members.ID
            End
        End_Procedure
    
    //    Procedure OnProcess_Rows_RowID RowID Row_ID
    //        Boolean bFound
    //
    //        Move (FindByRowId(OrderDtl.File_Number, Row_ID)) to bFound
    //    End_Procedure
    
    End_Object

End_Object
