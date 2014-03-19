// D:\DojoManagement\AppSrc\Members.vw
// Members
//

Use DFClient.pkg
Use DFEntry.pkg
Use dfcentry.pkg
Use cDbTextEdit.pkg
Use dfEnChk.pkg

Use cMembersDataDictionary.dd
Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd
Use cPaymentsHeaderDataDictionary.dd
Use cPaymentsDataDictionary.dd
Use cRankHistoryDataDictionary.dd
Use cTeachersDataDictionary.dd
Use dfallent.pkg
Use dfTabDlg.pkg
Use cDbCJGrid.pkg
Use Windows.pkg
Use dfLine.pkg

ACTIVATE_VIEW Activate_oMember FOR oMember
Object oMember is a dbView
    Set Location to 5 5
    Set Size to 270 378
    Set Label to "Member Entry"
    Set Border_Style to Border_Thick
    Set Maximize_Icon to True
    Set Auto_Clear_DEO_State to False
    Set Verify_Save_Msg to (RefFunc(No_Confirmation))

    Object oDojos_DD is a cDojosDataDictionary
    End_Object

    Object oDojos2_DD is a cDojosDataDictionary
    End_Object

    Object oTeachers_DD is a cTeachersDataDictionary
        Set DDO_Server to oDojos2_DD
    End_Object

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server to oDojos_DD
        //Set Constrain_File to Dojos.File_Number
    End_Object

    Object oMembers_DD is a cMembersDataDictionary
        Set DDO_Server to oShibu_DD
        Set DDO_Server to oDojos_DD
        Set Ordering to 1
        Set Field_Option Field Members.ID DD_DISPLAYONLY to True
    End_Object // oMembers_DD

    Object oRankHistory_DD is a cRankHistoryDataDictionary
        //Set DDO_Server to oTeachers_DD
        Set DDO_Server to oMembers_DD
        Set Constrain_file to Members.File_number
    End_Object

    Object oPaymentsHeader_DD is a cPaymentsHeaderDataDictionary
        Set Constrain_file to Members.File_number
        Set DDO_Server to oMembers_DD
        Set Field_Option Field PaymentsHeader.ID DD_DISPLAYONLY to True
    End_Object

    Object oPayments_DD is a cPaymentsDataDictionary
        Set Constrain_file to PaymentsHeader.File_number
        Set DDO_Server to oPaymentsHeader_DD
    End_Object

    Set Main_DD To oMembers_DD
    Set Server  To oMembers_DD

    Object oDbGroup1 is a dbGroup
        Set Size to 27 373
        Set Location to 2 0
        Set Label to "Header"

        Object oMembersFIRST_NAME is a dbForm
            Entry_Item Members.FIRST_NAME
            Set Size to 13 66
            Set Location to 10 47
            Set peAnchors to anLeftRight
            Set Label to "First Name:"
            Set Label_Justification_mode to jMode_Left
            Set Label_Col_Offset to 40
            Set Label_row_Offset to 0
        End_Object // oMembersFIRST_NAME

        Object oMembersLAST_NAME is a dbForm
            Entry_Item Members.LAST_NAME
            Set Size to 13 126
            Set Location to 10 164
            Set peAnchors to anLeftRight
            Set Label to "Last Name:"
            Set Label_Justification_mode to jMode_Left
            Set Label_Col_Offset to 45
            Set Label_row_Offset to 0
        End_Object // oMembersLAST_NAME

        Object oMembersID is a dbForm
            Entry_Item Members.ID
            Set Size to 13 34
            Set Location to 10 317
            Set peAnchors to anLeftRight
            Set Label to "ID:"
            Set Label_Justification_mode to jMode_Left
            Set Label_Col_Offset to 20
            Set Label_row_Offset to 0
        End_Object // oMembersID
    End_Object

    Object oDbTabDialog1 is a dbTabDialog
        Set Location to 32 0
        Set Size to 238 378
    
        Set Rotate_Mode to RM_Rotate
        Set peAnchors to anAll

        Object oJinenkanInfoTab is a dbTabPage
            Set Label to "Jinenkan Info"

            Object oDojoMember is a dbGroup
                Set Size to 91 428
                Set Location to 4 4
                Set Label to "Dojo/Memberships"

                Object oDojos_NAME is a dbForm
                    Entry_Item Dojos.NAME
                    Set Location to 10 61
                    Set Size to 13 117
                    Set Label to "Dojo:"
                    Set Label_Col_Offset to 55
                End_Object

                Object oShibu_NAME is a dbForm
                    Entry_Item Shibu.NAME
                    Set Location to 25 61
                    Set Size to 13 117
                    Set Label to "Shibu:"
                    Set Label_Col_Offset to 55
                End_Object

                Object oMembers_MEMBER_TYPE is a dbComboForm
                    Entry_Item Members.MEMBER_TYPE
                    Set Location to 40 61
                    Set Size to 12 117
                    Set Label to "Member Type:"
                    Set Label_Col_Offset to 55
                    Set Combo_Sort_State to False
                    Set Entry_State to False
                End_Object

                Object oMembersMEMBERSHIP is a dbComboForm
                    Entry_Item Members.MEMBERSHIP
                    Set Size to 12 117
                    Set Location to 55 61
                    Set peAnchors to anLeftRight
                    Set Label to "Membership:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 55
                    Set Label_row_Offset to 0
                    Set Combo_Sort_State to False
                    Set Entry_State to False
                End_Object // oMembersMEMBERSHIP

                Object oMembers_MEMBERSHIP_NO is a dbForm
                    Entry_Item Members.MEMBERSHIP_NO
                    Set Location to 70 61
                    Set Size to 13 42
                    Set Label to "Member No:"
                    Set Label_Col_Offset to 55
                End_Object

                Object oMembers_JOIN_DATE is a dbForm
                    Entry_Item Members.JOIN_DATE
                    Set Location to 10 239
                    Set Size to 13 66
                    Set Label to "Join Date:"
                    Set Label_Col_Offset to 50
                End_Object

                Object oMembers_RENEWAL_DATE is a dbForm
                    Entry_Item Members.RENEWAL_DATE
                    Set Location to 25 239
                    Set Size to 13 66
                    Set Label to "Renewal Date:"
                    Set Label_Col_Offset to 50
                End_Object

                Object oMembers_ACTIVE_MEMBER is a dbCheckBox
                    Entry_Item Members.ACTIVE_MEMBER
                    Set Location to 42 239
                    Set Size to 10 60
                    Set Label to "Active Member"
                    Set Skip_State to True
                End_Object
            End_Object
            Object oDbTabDialog2 is a dbTabDialog
                Set Size to 121 428
                Set Location to 97 4
            
                Set Rotate_Mode to RM_Rotate

                Object oDbTabPage2 is a dbTabPage
                    Set Label to "Current Ranks"

                    Object oRankHistory_JISSEN_KOBUDO1 is a dbForm
                        Entry_Item (Find_Code_Description(oRank, Members.JISSENKOBUDO_RANK))
                        Set Location to 7 65
                        Set Size to 12 107
                        Set Label to "Jissen Kobudo:"
                        Set Entry_State to False
                    End_Object

                    Object oRankHistory_BIKEN1 is a dbForm
                        Entry_Item (Find_Code_Description(oBikenRank, Members.BIKEN_RANK))
                        Set Location to 22 65
                        Set Size to 12 107
                        Set Label to "Bikenjutsu:"
                        Set Entry_State to False
                    End_Object

                    Object oRankHistory_JUTTE1 is a dbForm
                        Entry_Item (Find_Code_Description(oJutteRank, Members.JUTTE_RANK))
                        Set Location to 37 65
                        Set Size to 12 107
                        Set Label to "Juttejutsu:"
                        Set Entry_State to False
                    End_Object

                    Object oRankHistory_TANTO1 is a dbForm
                        Entry_Item (Find_Code_Description(oTantoRank, Members.TANTO_RANK))
                        Set Location to 52 65
                        Set Size to 12 107
                        Set Label to "Tantojutsu:"
                        Set Entry_State to False
                    End_Object

                    Object oRankHistory_KUSARI1 is a dbForm
                        Entry_Item (Find_Code_Description(oKusariRank, Members.KUSARI_RANK))
                        Set Location to 67 65
                        Set Size to 12 107
                        Set Label to "Kusarifundojutsu:"
                        Set Entry_State to False
                    End_Object

                    Object oRankHistory_NITO1 is a dbForm
                        Entry_Item (Find_Code_Description(oNitoRank, Members.NITO_RANK))
                        Set Location to 82 65
                        Set Size to 12 107
                        Set Label to "Nitojutsu:"
                        Set Entry_State to False
                    End_Object
                End_Object

                Object oDbTabPage1 is a dbTabPage
                    Set Label to "Rank History"

                    Object oDbCJGrid1 is a cDbCJGrid
                        Set Size to 106 423
                        Set Location to 0 0
                        Set peAnchors to anAll
                        Set Server to oRankHistory_DD
                        Set Ordering to 2
                        Set pbAutoColumnSizing to False
                
                        Object oRankHistory_RANKDATE is a cDbCJGridColumn
                            Entry_Item RankHistory.RANKDATE
                            Set piWidth to 74
                            Set psCaption to "Rank Date"
                        End_Object

                        Object oTeachers_Name is a cDbCJGridColumn
                            Entry_Item Teachers.Name
                            Set piWidth to 151
                            Set psCaption to "Examinator"
                        End_Object
                
                        Object oRankHistory_JISSEN_KOBUDO is a cDbCJGridColumn
                            Entry_Item RankHistory.JISSEN_KOBUDO
                            Set piWidth to 89
                            Set psCaption to "Jissen Kobudo"
                            Set pbComboButton to True
                        End_Object
                
                        Object oRankHistory_BIKEN is a cDbCJGridColumn
                            Entry_Item RankHistory.BIKEN
                            Set piWidth to 89
                            Set psCaption to "Bikenjutsu"
                            Set pbComboButton to True
                        End_Object
                
                        Object oRankHistory_NITO is a cDbCJGridColumn
                            Entry_Item RankHistory.NITO
                            Set piWidth to 90
                            Set psCaption to "Nitojutsu"
                            Set pbComboButton to True
                        End_Object
                
                        Object oRankHistory_JUTTE is a cDbCJGridColumn
                            Entry_Item RankHistory.JUTTE
                            Set piWidth to 90
                            Set psCaption to "Juttejutsu"
                            Set pbComboButton to True
                        End_Object
                
                        Object oRankHistory_TANTO is a cDbCJGridColumn
                            Entry_Item RankHistory.TANTO
                            Set piWidth to 93
                            Set psCaption to "Tantojutsu"
                            Set pbComboButton to True
                        End_Object
                
                        Object oRankHistory_KUSARI is a cDbCJGridColumn
                            Entry_Item RankHistory.KUSARI
                            Set piWidth to 99
                            Set psCaption to "Kusarifundojutsu"
                            Set pbComboButton to True
                        End_Object
                    End_Object
                End_Object
            
            End_Object
        End_Object

        Object oPaymentsTab is a dbTabPage
            Set Label to "Payments"

            Object oDbCJGrid2 is a cDbCJGrid
                Set Server to oPaymentsHeader_DD
                Set Size to 66 373
                Set Location to 0 -1
                Set pbAutoColumnSizing to False
                Set peAnchors to anTopLeftRight
                Set pbShadeSortColumn to True
                Set pbUseAlternateRowBackgroundColor to True
                Set Ordering to 3

                Object oPaymentsHeader_ID is a cDbCJGridColumn
                    Entry_Item PaymentsHeader.ID
                    Set piWidth to 22
                    Set psCaption to "ID"
                End_Object

                Object oPaymentsHeader_PAYMENT_DATE is a cDbCJGridColumn
                    Entry_Item PaymentsHeader.PAYMENT_DATE
                    Set piWidth to 140
                    Set psCaption to "Payment Date"
                End_Object

                Object oPaymentsHeader_INFO is a cDbCJGridColumn
                    Entry_Item PaymentsHeader.INFO
                    Set piWidth to 250
                    Set psCaption to "Info"
                End_Object

                Object oPaymentsHeader_TOTAL is a cDbCJGridColumn
                    Entry_Item PaymentsHeader.TOTAL
                    Set piWidth to 140
                    Set psCaption to "Total"
                End_Object
            End_Object

            Object oDbCJGrid1 is a cDbCJGrid
                Set Server to oPayments_DD
                Set Size to 123 373
                Set Location to 84 -1
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbUseAlternateRowBackgroundColor to True

                Object oPayments_ID is a cDbCJGridColumn
                    Entry_Item Payments.ID
                    Set piWidth to 23
                    Set psCaption to "ID"
                End_Object

                Object oPayments_PAYMENT_DATE is a cDbCJGridColumn
                    Entry_Item Payments.PAYMENT_DATE
                    Set piWidth to 75
                    Set psCaption to "Date"
                End_Object

                Object oPayments_TOTAL_PAYMENT is a cDbCJGridColumn
                    Entry_Item Payments.TOTAL_PAYMENT
                    Set piWidth to 71
                    Set psCaption to "Total"
                End_Object

                Object oPayments_JAPAN_PART is a cDbCJGridColumn
                    Entry_Item Payments.JAPAN_PART
                    Set piWidth to 74
                    Set psCaption to "Japan (¾)"
                End_Object

                Object oPayments_DOJOCHO_PART is a cDbCJGridColumn
                    Entry_Item Payments.DOJOCHO_PART
                    Set piWidth to 80
                    Set psCaption to "Dojo-cho"
                End_Object

                Object oPayments_TYPE is a cDbCJGridColumn
                    Entry_Item Payments.TYPE
                    Set piWidth to 161
                    Set psCaption to "Payment Type"
                    Set pbComboButton to True
                End_Object

                Object oPayments_INFO is a cDbCJGridColumn
                    Entry_Item Payments.INFO
                    Set piWidth to 160
                    Set psCaption to "Payment Info"
                End_Object
            End_Object

            Object oMembers_PAYMENTS_TOTAL is a dbForm
                Entry_Item Members.PAYMENTS_TOTAL
                Set Location to 209 249
                Set Size to 13 54
                Set Label to "Total:"
                Set Label_Col_Offset to 40
                Set peAnchors to anBottomRight
            End_Object

            Object oTextBox1 is a TextBox
                Set Size to 10 50
                Set Location to 71 2
                Set Label to "Payment Details"
            End_Object

            Object oLineControl1 is a LineControl
                Set Size to 2 307
                Set Location to 76 56
                Set peAnchors to anTopLeftRight
            End_Object
        End_Object

        Object oSeminarsTab is a dbTabPage
            Set Label to "Seminars"
        End_Object

        Object oPersonalInfoTab is a dbTabPage
            Set Label to "Personal Info"

            Object oBasicInfo is a dbGroup
                Set Size to 61 181
                Set Location to 3 5
                Set Label to "Address"
        
                Object oMembersADDRESS1 is a dbForm
                    Entry_Item Members.ADDRESS1
                    Set Size to 13 125
                    Set Location to 10 47
                    Set peAnchors to anLeftRight
                    Set Label to "Address 1:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersADDRESS1
                Object oMembersADDRESS2 is a dbForm
                    Entry_Item Members.ADDRESS2
                    Set Size to 13 125
                    Set Location to 25 47
                    Set peAnchors to anLeftRight
                    Set Label to "Address 2:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersADDRESS2
                Object oMembersADDRESS3 is a dbForm
                    Entry_Item Members.ADDRESS3
                    Set Size to 13 125
                    Set Location to 40 47
                    Set peAnchors to anLeftRight
                    Set Label to "Address 3:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersADDRESS3
            End_Object
            Object oContact is a dbGroup
                Set Size to 73 181
                Set Location to 67 5
                Set Label to "Contact Info"
        
                Object oMembersEMAIL is a dbForm
                    Entry_Item Members.EMAIL
                    Set Size to 13 126
                    Set Location to 10 47
                    Set peAnchors to anLeftRight
                    Set Label to "E-mail:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersEMAIL
                Object oMembersHOME_PHONE is a dbForm
                    Entry_Item Members.HOME_PHONE
                    Set Size to 13 126
                    Set Location to 25 47
                    Set peAnchors to anLeftRight
                    Set Label to "Phone:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersHOME_PHONE
                Object oMembersMOBILE_PHONE is a dbForm
                    Entry_Item Members.MOBILE_PHONE
                    Set Size to 13 126
                    Set Location to 40 47
                    Set peAnchors to anLeftRight
                    Set Label to "Mobile:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersMOBILE_PHONE

                Object oMembersMOBILE_PHONE is a dbForm
                    Entry_Item Members.BIRTHDATE
                    Set Size to 13 126
                    Set Location to 55 47
                    Set peAnchors to anLeftRight
                    Set Label to "Birthdate:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 40
                    Set Label_row_Offset to 0
                End_Object // oMembersMOBILE_PHONE
            End_Object

            Object oDbGroup2 is a dbGroup
                Set Size to 61 181
                Set Location to 142 5
                Set Label to "Extra Info"

                Object oMembers_OCCUPATION is a dbForm
                    Entry_Item Members.OCCUPATION
                    Set Location to 10 50
                    Set Size to 13 117
                    Set Label to "Occupation:"
                    Set Label_Col_Offset to 45
                End_Object

                Object oMembersINFO is a cDbTextEdit
                    Entry_Item Members.INFO
                    Set Size to 28 117
                    Set Location to 26 50
                    Set Label to "Info:"
                    Set Label_Justification_mode to jMode_Left
                    Set Label_Col_Offset to 45
                    Set Label_row_Offset to 0
                End_Object // oMembersINFO
            End_Object

            Object oDbGroup3 is a dbGroup
                Set Size to 136 126
                Set Location to 3 193
                Set Label to "Picture"
            End_Object
        End_Object
    
    End_Object

End_Object // oMember

Procedure Activate_oMember_View Integer iId
    Handle hoClient
    Get Client_Id to hoClient
    Send Activate_oMember of hoClient
    Send Clear of (oMembers_DD(oMember(Self)))
    Move iId to Members.ID
    Send Find of (oMembers_DD(oMember(Self))) EQ 1
End_Procedure