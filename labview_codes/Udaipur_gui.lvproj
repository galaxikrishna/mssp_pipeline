<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="USO_GUI.vi" Type="VI" URL="../USO_GUI.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="AddBufferEX.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/AddBufferEX.vi"/>
				<Item Name="AllocateBuffer.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/AllocateBuffer.vi"/>
				<Item Name="ArmCamera.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/ArmCamera.vi"/>
				<Item Name="CancelImages.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/CancelImages.vi"/>
				<Item Name="ClearRAMSegment.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Storage.llb/ClearRAMSegment.vi"/>
				<Item Name="ctl_OperatingMode.ctl" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/ctl_OperatingMode.ctl"/>
				<Item Name="ErrorManager.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/GeneralControlStatus.llb/ErrorManager.vi"/>
				<Item Name="ForceTrigger.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/TimingControl.llb/ForceTrigger.vi"/>
				<Item Name="FormatHWDESC.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/GeneralControlStatus.llb/FormatHWDESC.vi"/>
				<Item Name="FormatSoftwareDesc.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/GeneralControlStatus.llb/FormatSoftwareDesc.vi"/>
				<Item Name="GetBusyStatus.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/TimingControl.llb/GetBusyStatus.vi"/>
				<Item Name="GetCameraType.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/GeneralControlStatus.llb/GetCameraType.vi"/>
				<Item Name="GetDescription.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/GetDescription.vi"/>
				<Item Name="GetImageBuffer.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/GetImageBuffer.vi"/>
				<Item Name="GetRecordingState.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/GetRecordingState.vi"/>
				<Item Name="InitLibrary.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/InitLibrary.vi"/>
				<Item Name="Meadowlark USB COM.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/Meadowlark USB COM.vi"/>
				<Item Name="Meadowlark USB Easy Close.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/Meadowlark USB Easy Close.vi"/>
				<Item Name="Meadowlark USB Easy Open.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/Meadowlark USB Easy Open.vi"/>
				<Item Name="Meadowlark USB Set Voltage.VI" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/Meadowlark USB Set Voltage.VI"/>
				<Item Name="Motion, Relative.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/Motion, Relative.vi"/>
				<Item Name="Motor OFF.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/Motor OFF.vi"/>
				<Item Name="Motor ON.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/Motor ON.vi"/>
				<Item Name="NP_Logging.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/NP_Logging.vi"/>
				<Item Name="OpenCameraEx.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/OpenCameraEx.vi"/>
				<Item Name="pcolabview.dll" Type="Document" URL="/&lt;userlib&gt;/_express/pco.camera/pcolabview.dll"/>
				<Item Name="Read Controller Status.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/Read Controller Status.vi"/>
				<Item Name="Read Position.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/Read Position.vi"/>
				<Item Name="read temp.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/read temp.vi"/>
				<Item Name="SC2_Cam.dll" Type="Document" URL="/&lt;userlib&gt;/_express/pco.camera/SC2_Cam.dll"/>
				<Item Name="Set temp.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/Set temp.vi"/>
				<Item Name="SetAcquireMode.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/SetAcquireMode.vi"/>
				<Item Name="SetADCOperation.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/SetADCOperation.vi"/>
				<Item Name="SetBitAlignment.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/BufferData.llb/SetBitAlignment.vi"/>
				<Item Name="SetCoolingSetpointTemperature.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/SetCoolingSetpointTemperature.vi"/>
				<Item Name="SetDelayExposureTime.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/TimingControl.llb/SetDelayExposureTime.vi"/>
				<Item Name="SetPixelRate.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/SetPixelRate.vi"/>
				<Item Name="SetRecorderSubmode.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/SetRecorderSubmode.vi"/>
				<Item Name="SetRecordingState.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/SetRecordingState.vi"/>
				<Item Name="SetROI.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/SetROI.vi"/>
				<Item Name="SetSensorFormat.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/Sensor.llb/SetSensorFormat.vi"/>
				<Item Name="SetStorageMode.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/RecordingControl.llb/SetStorageMode.vi"/>
				<Item Name="SetTrigger.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/TimingControl.llb/SetTrigger.vi"/>
				<Item Name="StripCamType.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/GeneralControlStatus.llb/StripCamType.vi"/>
				<Item Name="usbdrvd.dll" Type="Document" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/usbdrvd.dll"/>
				<Item Name="version.vi" Type="VI" URL="/&lt;userlib&gt;/_express/Medowlark lcvr/Meadowlark USB.llb/version.vi"/>
				<Item Name="VisaCommWrapper.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pizo motor/NSC200.llb/VisaCommWrapper.vi"/>
				<Item Name="WaitForBuffer.vi" Type="VI" URL="/&lt;userlib&gt;/_express/pco.camera/APIManagement.llb/WaitForBuffer.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="comparison.ctl" Type="VI" URL="/&lt;vilib&gt;/express/express shared/comparison.ctl"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="compatWriteText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatWriteText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="DWDT Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Error Code.vi"/>
				<Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="ex_Modify Signal Name.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signal Name.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_Gmath.lvlib" Type="Library" URL="/&lt;vilib&gt;/gmath/NI_Gmath.lvlib"/>
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="Read Characters From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Characters From File.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subComparison.vi" Type="VI" URL="/&lt;vilib&gt;/express/express arith-compare/ComparisonBlock.llb/subComparison.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
				<Item Name="Waveform Scalar Limit Comparison.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/Waveform Scalar Limit Comparison.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write Characters To File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Characters To File.vi"/>
				<Item Name="Write File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write File+ (string).vi"/>
			</Item>
			<Item Name="color_front_pannel.vi" Type="VI" URL="../helper vis/color_front_pannel.vi"/>
			<Item Name="get current and reset position.vi" Type="VI" URL="../scan motor/get current and reset position.vi"/>
			<Item Name="gfitsio.lvlib" Type="Library" URL="../gfitsio/gfitsio.lvlib"/>
			<Item Name="go home.vi" Type="VI" URL="../scan motor/go home.vi"/>
			<Item Name="grab image_2.vi" Type="VI" URL="../cam library/grab image_2.vi"/>
			<Item Name="helper_move_motor.vi" Type="VI" URL="../helper vis/helper_move_motor.vi"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="motor initialize.vi" Type="VI" URL="../scan motor/motor initialize.vi"/>
			<Item Name="motor motion and reset.vi" Type="VI" URL="../scan motor/motor motion and reset.vi"/>
			<Item Name="User32.dll" Type="Document" URL="User32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="volt vs retardance.vi" Type="VI" URL="../helper vis/volt vs retardance.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="My Application" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{D0167373-135A-4DCE-A334-94DEAF77183F}</Property>
				<Property Name="App_INI_GUID" Type="Str">{CE02D7FE-92C1-4460-AFFF-979496D4F6B9}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_winsec.description" Type="Str">http://www.mk.com</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{29B1B839-0D8F-4570-9FBC-1999F5358331}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">My Application</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/My Application</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{C1D1885C-7EFC-40AC-9F33-E7BDC87B9055}</Property>
				<Property Name="Bld_version.build" Type="Int">1</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Application.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/My Application/Application.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/My Application/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{3408EEEB-6A08-4D56-9A94-7F64E2149818}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/USO_GUI.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">mk</Property>
				<Property Name="TgtF_fileDescription" Type="Str">My Application</Property>
				<Property Name="TgtF_internalName" Type="Str">My Application</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2015 mk</Property>
				<Property Name="TgtF_productName" Type="Str">My Application</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{1867CCE9-EA8C-485F-A29D-1017D29C67D1}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Application.exe</Property>
			</Item>
			<Item Name="My Installer" Type="Installer">
				<Property Name="Destination[0].name" Type="Str">Udaipur_gui</Property>
				<Property Name="Destination[0].parent" Type="Str">{3912416A-D2E5-411B-AFEE-B63654D690C0}</Property>
				<Property Name="Destination[0].tag" Type="Str">{B3F4496F-875F-4427-9816-B4D052DD7ABD}</Property>
				<Property Name="Destination[0].type" Type="Str">userFolder</Property>
				<Property Name="DestinationCount" Type="Int">1</Property>
				<Property Name="DistPart[0].flavorID" Type="Str">DefaultFull</Property>
				<Property Name="DistPart[0].productID" Type="Str">{3FF6680C-29B9-48D6-ADC6-08ACA8B99946}</Property>
				<Property Name="DistPart[0].productName" Type="Str">NI LabVIEW Run-Time Engine 2014</Property>
				<Property Name="DistPart[0].SoftDep[0].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[0].productName" Type="Str">NI LabVIEW Run-Time Engine 2014 Non-English Support.</Property>
				<Property Name="DistPart[0].SoftDep[0].upgradeCode" Type="Str">{CAC8FA79-6D3D-4263-BB7B-1A706EF87C08}</Property>
				<Property Name="DistPart[0].SoftDep[1].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[1].productName" Type="Str">NI ActiveX Container</Property>
				<Property Name="DistPart[0].SoftDep[1].upgradeCode" Type="Str">{1038A887-23E1-4289-B0BD-0C4B83C6BA21}</Property>
				<Property Name="DistPart[0].SoftDep[10].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[10].productName" Type="Str">NI mDNS Responder 14.0</Property>
				<Property Name="DistPart[0].SoftDep[10].upgradeCode" Type="Str">{9607874B-4BB3-42CB-B450-A2F5EF60BA3B}</Property>
				<Property Name="DistPart[0].SoftDep[11].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[11].productName" Type="Str">NI Deployment Framework 2014</Property>
				<Property Name="DistPart[0].SoftDep[11].upgradeCode" Type="Str">{838942E4-B73C-492E-81A3-AA1E291FD0DC}</Property>
				<Property Name="DistPart[0].SoftDep[12].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[12].productName" Type="Str">NI Error Reporting 2014</Property>
				<Property Name="DistPart[0].SoftDep[12].upgradeCode" Type="Str">{42E818C6-2B08-4DE7-BD91-B0FD704C119A}</Property>
				<Property Name="DistPart[0].SoftDep[2].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[2].productName" Type="Str">NI Service Locator 14.0</Property>
				<Property Name="DistPart[0].SoftDep[2].upgradeCode" Type="Str">{B235B862-6A92-4A04-A8B2-6D71F777DE67}</Property>
				<Property Name="DistPart[0].SoftDep[3].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[3].productName" Type="Str">Math Kernel Libraries</Property>
				<Property Name="DistPart[0].SoftDep[3].upgradeCode" Type="Str">{3BDD0408-2F90-4B42-9777-5ED1D4BE67A8}</Property>
				<Property Name="DistPart[0].SoftDep[4].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[4].productName" Type="Str">NI Logos 14.0</Property>
				<Property Name="DistPart[0].SoftDep[4].upgradeCode" Type="Str">{5E4A4CE3-4D06-11D4-8B22-006008C16337}</Property>
				<Property Name="DistPart[0].SoftDep[5].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[5].productName" Type="Str">NI TDM Streaming 14.0</Property>
				<Property Name="DistPart[0].SoftDep[5].upgradeCode" Type="Str">{4CD11BE6-6BB7-4082-8A27-C13771BC309B}</Property>
				<Property Name="DistPart[0].SoftDep[6].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[6].productName" Type="Str">NI LabVIEW Web Server 2014</Property>
				<Property Name="DistPart[0].SoftDep[6].upgradeCode" Type="Str">{4A8BDBBB-DA1C-45C9-8563-74C034FBD357}</Property>
				<Property Name="DistPart[0].SoftDep[7].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[7].productName" Type="Str">NI LabVIEW Real-Time NBFifo 2014</Property>
				<Property Name="DistPart[0].SoftDep[7].upgradeCode" Type="Str">{4372F3E3-5935-4012-93AB-B6710CE24920}</Property>
				<Property Name="DistPart[0].SoftDep[8].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[8].productName" Type="Str">NI VC2008MSMs</Property>
				<Property Name="DistPart[0].SoftDep[8].upgradeCode" Type="Str">{FDA3F8BB-BAA9-45D7-8DC7-22E1F5C76315}</Property>
				<Property Name="DistPart[0].SoftDep[9].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[9].productName" Type="Str">NI VC2010MSMs</Property>
				<Property Name="DistPart[0].SoftDep[9].upgradeCode" Type="Str">{EFBA6F9E-F934-4BD7-AC51-60CCA480489C}</Property>
				<Property Name="DistPart[0].SoftDepCount" Type="Int">13</Property>
				<Property Name="DistPart[0].upgradeCode" Type="Str">{4722F14B-8434-468D-840D-2B0CD8CBD5EA}</Property>
				<Property Name="DistPartCount" Type="Int">1</Property>
				<Property Name="INST_author" Type="Str">mk</Property>
				<Property Name="INST_autoIncrement" Type="Bool">true</Property>
				<Property Name="INST_buildLocation" Type="Path">../builds/Udaipur_gui/My Installer</Property>
				<Property Name="INST_buildLocation.type" Type="Str">relativeToCommon</Property>
				<Property Name="INST_buildSpecName" Type="Str">My Installer</Property>
				<Property Name="INST_defaultDir" Type="Str">{B3F4496F-875F-4427-9816-B4D052DD7ABD}</Property>
				<Property Name="INST_productName" Type="Str">Udaipur_gui</Property>
				<Property Name="INST_productVersion" Type="Str">1.0.1</Property>
				<Property Name="InstSpecBitness" Type="Str">32-bit</Property>
				<Property Name="InstSpecVersion" Type="Str">14008034</Property>
				<Property Name="MSI_arpCompany" Type="Str">mk</Property>
				<Property Name="MSI_arpURL" Type="Str">http://www.mk.com/</Property>
				<Property Name="MSI_autoselectDrivers" Type="Bool">true</Property>
				<Property Name="MSI_distID" Type="Str">{6CAE2572-B515-4CE9-8920-40D66CFBEA5D}</Property>
				<Property Name="MSI_osCheck" Type="Int">0</Property>
				<Property Name="MSI_upgradeCode" Type="Str">{A9C09BB4-3CC3-4A3B-B5A1-D0716B315767}</Property>
				<Property Name="RegDest[0].dirName" Type="Str">Software</Property>
				<Property Name="RegDest[0].dirTag" Type="Str">{DDFAFC8B-E728-4AC8-96DE-B920EBB97A86}</Property>
				<Property Name="RegDest[0].parentTag" Type="Str">2</Property>
				<Property Name="RegDestCount" Type="Int">1</Property>
			</Item>
		</Item>
	</Item>
</Project>
