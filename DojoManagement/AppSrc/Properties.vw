// D:\DojoManagement\AppSrc\Properties.vw
// Properties
//

Use DFClient.pkg
Use DFEntry.pkg

Use cSysTableDataDictionary.dd
Use cSecurityDataDictionary.dd
Use dfTabDlg.pkg
Use DFEnChk.pkg
Use dfallent.pkg
Use cDbCJGrid.pkg

ACTIVATE_VIEW Activate_oProperties FOR oProperties
Object oProperties is a dbView
    Set Location to 5 5
    Set Size to 122 329
    Set Label To "Properties"
    Set Border_Style to Border_Thick
    Property tSkinInformation[] pSkins

    Object oSecurity_DD is a cSecurityDataDictionary
    End_Object

    Object oSysTable_DD is a cSysTableDataDictionary
    End_Object // oSysTable_DD

    Set Main_DD To oSysTable_DD
    Set Server  To oSysTable_DD

    Object oDbTabDialog1 is a dbTabDialog
        Set Size to 122 329
        Set Location to 0 0
    
        Set Rotate_Mode to RM_Rotate

        Object oDbTabPage1 is a dbTabPage
            Set Label to "Dojo Info"

            Object oSysTableDOJO is a dbForm
                Entry_Item SysTable.DOJO
                Set Size to 13 172
                Set Location to 5 52
                Set peAnchors to anLeftRight
                Set Label to "Dojo:"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 47
                Set Label_row_Offset to 0
            End_Object // oSysTableDOJO
            Object oSysTableDOJO_WEBSITE is a dbForm
                Entry_Item SysTable.DOJO_WEBSITE
                Set Size to 13 172
                Set Location to 20 52
                Set peAnchors to anLeftRight
                Set Label to "Dojo Web URL:"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 47
                Set Label_row_Offset to 0
            End_Object // oSysTableDOJO_WEBSITE
            Object oSysTableDOJO_EMAIL is a dbForm
                Entry_Item SysTable.DOJO_EMAIL
                Set Size to 13 172
                Set Location to 35 52
                Set peAnchors to anLeftRight
                Set Label to "Dojo E-mail:"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 47
                Set Label_row_Offset to 0
            End_Object // oSysTableDOJO_EMAIL
            Object oSysTableDOJO_DOJOCHO is a dbForm
                Entry_Item SysTable.DOJO_DOJOCHO
                Set Size to 13 172
                Set Location to 50 52
                Set peAnchors to anLeftRight
                Set Label to "Dojo Dojo-cho:"
                Set Label_Justification_mode to jMode_Left
                Set Label_Col_Offset to 47
                Set Label_row_Offset to 0
            End_Object // oSysTableDOJO_DOJOCHO
        End_Object

        Object oDbTabPage2 is a dbTabPage
            Set Label to "Layout"

            Object oDbGroup1 is a dbGroup
                Set Size to 100 111
                Set Location to 4 3
                Set Label to "Menus and Toolbars"

                Object oSysTable_RIBBON_MENU is a dbCheckBox
                    Entry_Item SysTable.RIBBON_MENU
                    Set Location to 11 6
                    Set Size to 10 60
                    Set Label to "Ribbon Menu"
                End_Object

                Object oSysTable_SHOW_TABS is a dbCheckBox
                    Entry_Item SysTable.SHOW_TABS
                    Set Location to 24 6
                    Set Size to 10 60
                    Set Label to "Show tab for each view"
                End_Object

                Object oSysTable_MAXIMIZE_VIEWS is a dbCheckBox
                    Entry_Item SysTable.MAXIMIZE_VIEWS
                    Set Location to 37 6
                    Set Size to 10 60
                    Set Label to "Maximize all views"
                End_Object
            End_Object

            Object oDbGroup2 is a dbGroup
                Set Size to 100 199
                Set Location to 4 121
                Set Label to "Skins and Themes"

                Object oSkinsList is a List
                    Set Size to 78 190
                    Set Location to 20 5
            
                    Property Boolean pbNoChange False

                    Set peAnchors to anAll
            
                    Procedure OnChange
                        Integer iCurrent
                        tSkinInformation[] Skins
            
                        Get pSkins to Skins
                        If (focus(Self) and item_count(Self) and not(pbNoChange(Self))) Begin
                            Send ApplyCurrentSkin
                        End
            
                    End_Procedure
            
            
                    Procedure Mouse_Down Integer iWindowNumber Integer iPosition
                        Set pbNoChange to True
                        Forward Send Mouse_Down iWindowNumber iPosition
                        Set pbNoChange to False
                    End_Procedure
            
                    Procedure Mouse_Up Integer iWindowNumber Integer iPosition
                        Forward Send Mouse_up iWindowNumber iPosition
                        Send ApplyCurrentSkin
                    End_Procedure
            
            
                    Procedure AddSkinsToList tSkinInformation[] Skins
                        Integer iSkinsCount iArrayItem
                        Move (SizeOfArray(Skins)) to iSkinsCount
                        Set Dynamic_Update_State to False
                        Send Delete_Data
                        Send Add_Item msg_None "None"
                        For iArrayItem from 0 to (iSkinsCount-1)
                            Send Add_Item msg_None (Skins[iArrayItem].sName * "-" * Skins[iArrayItem].sSkinIni)
                        Loop
            
                        If (Item_count(Self)) Begin
                            Set Current_item to 0
                        End
            
                        Set Dynamic_Update_State to True
                    End_Procedure
            
            
                End_Object

                Object oCurrentSkinTB is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 187
                    Set Location to 8 6
                    Set Label to "Current Skin:"
                End_Object
            End_Object

            Procedure ApplyCurrentSkin
                Integer iCurrent
                tSkinInformation[] Skins
        
                If ghoSkinFramework Begin
        
                    Set psSkinFile of ghoSkinFramework to ""
                    Set psSkinIni of ghoSkinFramework to ""
                    Get Current_Item of oSkinsList to iCurrent
                    If (iCurrent>0) Begin
                        Get pSkins to Skins
                        Set psSkinFile of ghoSkinFramework to Skins[iCurrent-1].sSkinfile
                        Set psSkinIni of ghoSkinFramework to Skins[iCurrent-1].sSkinIni
                        Set Field_Changed_Value of oSysTable_DD Field SysTable.SKIN_FILE to Skins[iCurrent-1].sSkinfile
                        Set Field_Changed_Value of oSysTable_DD Field SysTable.SKIN_INI to Skins[iCurrent-1].sSkinIni
                    End
                    Send ApplySkin of ghoSkinFramework
                End
                Send ShowCurrentSkin
            End_Procedure
        
            // Load all skins. We will only look for skins in expected
            // directory which is SkinPath.
        
            Procedure LoadSkins
                Integer iSkinsCount iArrayItem
                tSkinInformation[] Skins
        
                If ghoSkinFramework Begin
        
                    Get EnumerateSkins of ghoSkinFramework "" True to Skins
                    Set pSkins to Skins
                    Send AddSkinsToList of oSkinsList Skins
                End
        
            End_Procedure
        
            // Show the current Skin in the textbox at the top
            Procedure ShowCurrentSkin
                String sFile sIni
        
                If ghoSkinFramework Begin
        
                    Get psSkinFile of ghoSkinFramework to sFile
                    Get psSkinIni of ghoSkinFramework to sIni
                    If (sFile="") Begin
                        Move "None" to sFile
                    End
                    Else If (sIni<>"") Begin
                        Move (sFile * "-" * sIni) to sFile
                    End
                End
                Else Begin
                    Move "Error - no skinning object" to sFile
                End
                Set Value of oCurrentSkinTB to ("Current Skin:" * sFile)
        
            End_Procedure
        
            // When this view is activated, refresh the list of skins
            Procedure Activating
                Forward Send Activating
                Send LoadSkins
                Send ShowCurrentSkin
            End_Procedure
        End_Object

        Object oDbTabPage3 is a dbTabPage
            Set Label to "Users"

            Object oSecurity_UserID is a dbForm
                Set Server to oSecurity_DD
                Entry_Item Security.UserID
                Set Location to 10 71
                Set Size to 13 96
                Set Label to "UserID:"
            End_Object

            Object oSecurity_Password is a dbForm
                Set Server to oSecurity_DD
                Entry_Item Security.Password
                Set Location to 25 71
                Set Size to 13 96
                Set Label to "Password:"
                Set Password_State to True
            End_Object
        End_Object
    
    End_Object


End_Object // oProperties
