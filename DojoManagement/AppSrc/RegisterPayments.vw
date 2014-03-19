// D:\DojoManagement\AppSrc\RegisterPayments.vw
// RegisterPayments
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbCJGrid.pkg
Use cDbCJGridColumn.pkg
Use cDojosDataDictionary.dd
Use cShibuDataDictionary.dd
Use cMembersDataDictionary.dd
Use cPaymentsHeaderDataDictionary.dd
Use cPaymentsDataDictionary.dd

Activate_View Activate_oRegisterFees for oRegisterFees
Object oRegisterFees is a dbView
    Object oDojos_DD is a cDojosDataDictionary
    End_Object

    Object oShibu_DD is a cShibuDataDictionary
        Set DDO_Server to oDojos_DD
    End_Object

    Object oMembers_DD is a cMembersDataDictionary
        Set DDO_Server to oShibu_DD
        Set DDO_Server to oDojos_DD
    End_Object

    Object oPaymentsHeader_DD is a cPaymentsHeaderDataDictionary
        Set DDO_Server to oMembers_DD
    End_Object

    Object oPayments_DD is a cPaymentsDataDictionary
        Set DDO_Server to oPaymentsHeader_DD
        Set Constrain_File to PaymentsHeader.File_Number
    End_Object

    Set Main_DD to oPaymentsHeader_DD
    Set Server to oPaymentsHeader_DD

    Set Location to 5 5
    Set Size to 129 444
    Set Label to "Register Fees"
    Set Border_Style to Border_Thick

    Object oMembersID is a dbForm
        Entry_Item Members.ID
        Set Size to 13 34
        Set Location to 5 51
        Set Label to "Member:"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 46
        Set Label_row_Offset to 0
    End_Object // oMembersID

    Object oMembersFULL_NAME is a dbForm
        Entry_Item Members.FULL_NAME
        Set Size to 13 246
        Set Location to 5 112
        Set Label to "Name:"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 22
        Set Label_row_Offset to 0
    End_Object // oMembersFULL_NAME

    Object oPaymentsHeaderPAYMENT_DATE is a dbForm
        Entry_Item PaymentsHeader.PAYMENT_DATE
        Set Size to 13 66
        Set Location to 20 51
        Set Label to "Payment Date:"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 46
        Set Label_row_Offset to 0
    End_Object // oPaymentsHeaderPAYMENT_DATE

    Object oPaymentsHeaderTOTAL is a dbForm
        Entry_Item PaymentsHeader.TOTAL
        Set Size to 13 73
        Set Location to 20 141
        Set Label to "Total:"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 19
        Set Label_row_Offset to 0
    End_Object // oPaymentsHeaderTOTAL

    Object oPaymentsHeaderINFO is a dbForm
        Entry_Item PaymentsHeader.INFO
        Set Size to 13 126
        Set Location to 35 51
        Set Label to "Info:"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 46
        Set Label_row_Offset to 0
    End_Object // oPaymentsHeaderINFO

    Object oDetailGrid is a cDbCJGrid
        Set Size to 66 434
        Set Location to 58 5
        Set Server to oPayments_DD
        Set Ordering to 1
        Set peAnchors to anAll
        Set psLayoutSection to "oRegisterFees_oDetailGrid"
        Set pbAllowInsertRow to False
        Set pbHeaderPrompts to True
        Set pbUseAlternateRowBackgroundColor to True
        Set pbAutoColumnSizing to False

        Object oPayments_ID is a cDbCJGridColumn
            Entry_Item Payments.ID
            Set piWidth to 37
            Set psCaption to "ID"
        End_Object // oPayments_ID

        Object oPayments_TYPE is a cDbCJGridColumn
            Entry_Item Payments.TYPE
            Set piWidth to 132
            Set psCaption to "Payment Type"
            Set pbComboButton to True
            Set pbComboEntryState to False
        End_Object // oPayments_TYPE

        Object oPayments_TOTAL_PAYMENT is a cDbCJGridColumn
            Entry_Item Payments.TOTAL_PAYMENT
            Set piWidth to 82
            Set psCaption to "Total"
        End_Object // oPayments_TOTAL_PAYMENT

        Object oPayments_JAPAN_PART is a cDbCJGridColumn
            Entry_Item Payments.JAPAN_PART
            Set piWidth to 82
            Set psCaption to "Japan"
        End_Object // oPayments_JAPAN_PART

        Object oPayments_DOJOCHO_PART is a cDbCJGridColumn
            Entry_Item Payments.DOJOCHO_PART
            Set piWidth to 82
            Set psCaption to "Dojo-cho"
        End_Object // oPayments_DOJOCHO_PART

        Object oPayments_PAID is a cDbCJGridColumn
            Entry_Item Payments.PAID
            Set piWidth to 45
            Set psCaption to "Paid"
            Set pbCheckbox to True
        End_Object // oPayments_PAID

        Object oPayments_INFO is a cDbCJGridColumn
            Entry_Item Payments.INFO
            Set piWidth to 299
            Set psCaption to "Info"
        End_Object // oPayments_INFO

    End_Object // oDetailGrid

    //-----------------------------------------------------------------------
    // Create custom confirmation messages for save and delete
    // We must create the new functions and assign verify messages
    // to them.
    //-----------------------------------------------------------------------

    Function ConfirmDeleteHeader Returns Boolean
        Boolean bFail
        Get Confirm "Delete Entire Header and all detail?" to bFail
        Function_Return bFail
    End_Function // ConfirmDeleteHeader

    // Only confirm on the saving of new records
    Function ConfirmSaveHeader Returns Boolean
        Boolean bNoSave bHasRecord
        Handle  hoSrvr
        Get Server to hoSrvr
        Get HasRecord of hoSrvr to bHasRecord
        If not bHasRecord Begin
            Get Confirm "Save this NEW header?" to bNoSave
        End
        Function_Return bNoSave
    End_Function // ConfirmSaveHeader

    // Define alternate confirmation Messages
    Set Verify_Save_MSG       to (RefFunc(ConfirmSaveHeader))
    Set Verify_Delete_MSG     to (RefFunc(ConfirmDeleteHeader))
    // Saves in header should not clear the view
    Set Auto_Clear_Deo_State to False


End_Object // oRegisterFees
