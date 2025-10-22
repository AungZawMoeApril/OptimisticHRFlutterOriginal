import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
    await _safeInitAsync(() async {
      _companyID = await secureStorage.getInt('ff_companyID') ?? _companyID;
    });
    await _safeInitAsync(() async {
      _employeeID = await secureStorage.getInt('ff_employeeID') ?? _employeeID;
    });
    await _safeInitAsync(() async {
      _userID = await secureStorage.getInt('ff_userID') ?? _userID;
    });
    await _safeInitAsync(() async {
      _approve = await secureStorage.getBool('ff_approve') ?? _approve;
    });
    await _safeInitAsync(() async {
      _reportID = await secureStorage.getInt('ff_reportID') ?? _reportID;
    });
    await _safeInitAsync(() async {
      _firstName = await secureStorage.getString('ff_firstName') ?? _firstName;
    });
    await _safeInitAsync(() async {
      _lastName = await secureStorage.getString('ff_lastName') ?? _lastName;
    });
    await _safeInitAsync(() async {
      _positionName =
          await secureStorage.getString('ff_positionName') ?? _positionName;
    });
    await _safeInitAsync(() async {
      _imagesFile =
          await secureStorage.getString('ff_imagesFile') ?? _imagesFile;
    });
    await _safeInitAsync(() async {
      _logoImage = await secureStorage.getString('ff_logoImage') ?? _logoImage;
    });
    await _safeInitAsync(() async {
      _colorCode = await secureStorage.getString('ff_colorCode') ?? _colorCode;
    });
    await _safeInitAsync(() async {
      _clockID = await secureStorage.getInt('ff_clockID') ?? _clockID;
    });
    await _safeInitAsync(() async {
      _shiftStartTIme =
          await secureStorage.getString('ff_shiftStartTIme') ?? _shiftStartTIme;
    });
    await _safeInitAsync(() async {
      _clockInTime =
          await secureStorage.getString('ff_clockInTime') ?? _clockInTime;
    });
    await _safeInitAsync(() async {
      _clockInLocation = await secureStorage.getString('ff_clockInLocation') ??
          _clockInLocation;
    });
    await _safeInitAsync(() async {
      _clockInLattitude =
          await secureStorage.getString('ff_clockInLattitude') ??
              _clockInLattitude;
    });
    await _safeInitAsync(() async {
      _clockInLongitude =
          await secureStorage.getString('ff_clockInLongitude') ??
              _clockInLongitude;
    });
    await _safeInitAsync(() async {
      _clockOutTime =
          await secureStorage.getString('ff_clockOutTime') ?? _clockOutTime;
    });
    await _safeInitAsync(() async {
      _timezoneOffset =
          await secureStorage.getInt('ff_timezoneOffset') ?? _timezoneOffset;
    });
    await _safeInitAsync(() async {
      _languageStatus =
          await secureStorage.getString('ff_languageStatus') ?? _languageStatus;
    });
    await _safeInitAsync(() async {
      _mainPinCode =
          await secureStorage.getString('ff_mainPinCode') ?? _mainPinCode;
    });
    await _safeInitAsync(() async {
      _prefix = await secureStorage.getString('ff_prefix') ?? _prefix;
    });
    await _safeInitAsync(() async {
      _nickName = await secureStorage.getString('ff_nickName') ?? _nickName;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _phone = await secureStorage.getString('ff_phone') ?? _phone;
    });
    await _safeInitAsync(() async {
      _departmentName =
          await secureStorage.getString('ff_departmentName') ?? _departmentName;
    });
    await _safeInitAsync(() async {
      _dateOfEmployment =
          await secureStorage.getString('ff_dateOfEmployment') ??
              _dateOfEmployment;
    });
    await _safeInitAsync(() async {
      _hiredDate = await secureStorage.getString('ff_hiredDate') ?? _hiredDate;
    });
    await _safeInitAsync(() async {
      _isGeneralFirstTime =
          await secureStorage.getBool('ff_isGeneralFirstTime') ??
              _isGeneralFirstTime;
    });
    await _safeInitAsync(() async {
      _biometricFlag =
          await secureStorage.getBool('ff_biometricFlag') ?? _biometricFlag;
    });
    await _safeInitAsync(() async {
      _password = await secureStorage.getString('ff_password') ?? _password;
    });
    await _safeInitAsync(() async {
      _otClockInTime =
          await secureStorage.getString('ff_otClockInTime') ?? _otClockInTime;
    });
    await _safeInitAsync(() async {
      _otClockOutTime =
          await secureStorage.getString('ff_otClockOutTime') ?? _otClockOutTime;
    });
    await _safeInitAsync(() async {
      _otClockInLocation =
          await secureStorage.getString('ff_otClockInLocation') ??
              _otClockInLocation;
    });
    await _safeInitAsync(() async {
      _otClockInLattitude =
          await secureStorage.getString('ff_otClockInLattitude') ??
              _otClockInLattitude;
    });
    await _safeInitAsync(() async {
      _otClockInLongitude =
          await secureStorage.getString('ff_otClockInLongitude') ??
              _otClockInLongitude;
    });
    await _safeInitAsync(() async {
      _otClockOutLongitude =
          await secureStorage.getString('ff_otClockOutLongitude') ??
              _otClockOutLongitude;
    });
    await _safeInitAsync(() async {
      _otClockOutLocation =
          await secureStorage.getString('ff_otClockOutLocation') ??
              _otClockOutLocation;
    });
    await _safeInitAsync(() async {
      _otClockOutLattitude =
          await secureStorage.getString('ff_otClockOutLattitude') ??
              _otClockOutLattitude;
    });
    await _safeInitAsync(() async {
      _CalendarList =
          (await secureStorage.getStringList('ff_CalendarList'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _CalendarList;
    });
    await _safeInitAsync(() async {
      _selectedDate =
          await secureStorage.getString('ff_selectedDate') ?? _selectedDate;
    });
    await _safeInitAsync(() async {
      _date = await secureStorage.getString('ff_date') ?? _date;
    });
    await _safeInitAsync(() async {
      _selectedEventsJSon =
          (await secureStorage.getStringList('ff_selectedEventsJSon'))
                  ?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _selectedEventsJSon;
    });
    await _safeInitAsync(() async {
      _checkInStatusOnSite =
          await secureStorage.getInt('ff_checkInStatusOnSite') ??
              _checkInStatusOnSite;
    });
    await _safeInitAsync(() async {
      _OTRequestID =
          await secureStorage.getInt('ff_OTRequestID') ?? _OTRequestID;
    });
    await _safeInitAsync(() async {
      _otAttachment = (await secureStorage.getStringList('ff_otAttachment'))
              ?.map((x) {
                try {
                  return AttachmentFileModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _otAttachment;
    });
    await _safeInitAsync(() async {
      _timeZoneOffsetSeconds =
          await secureStorage.getInt('ff_timeZoneOffsetSeconds') ??
              _timeZoneOffsetSeconds;
    });
    await _safeInitAsync(() async {
      _approverID2 =
          await secureStorage.getInt('ff_approverID2') ?? _approverID2;
    });
    await _safeInitAsync(() async {
      _approverID3 =
          await secureStorage.getInt('ff_approverID3') ?? _approverID3;
    });
    await _safeInitAsync(() async {
      _approverID4 =
          await secureStorage.getInt('ff_approverID4') ?? _approverID4;
    });
    await _safeInitAsync(() async {
      _approverID5 =
          await secureStorage.getInt('ff_approverID5') ?? _approverID5;
    });
    await _safeInitAsync(() async {
      _approverOrder =
          await secureStorage.getInt('ff_approverOrder') ?? _approverOrder;
    });
    await _safeInitAsync(() async {
      _OnsiteClockInTime =
          await secureStorage.getString('ff_OnsiteClockInTime') ??
              _OnsiteClockInTime;
    });
    await _safeInitAsync(() async {
      _onSiteClockOutTime =
          await secureStorage.getString('ff_onSiteClockOutTime') ??
              _onSiteClockOutTime;
    });
    await _safeInitAsync(() async {
      _NotificationCount = await secureStorage.getInt('ff_NotificationCount') ??
          _NotificationCount;
    });
    await _safeInitAsync(() async {
      _AnnouncementwebviewLink =
          await secureStorage.getString('ff_AnnouncementwebviewLink') ??
              _AnnouncementwebviewLink;
    });
    await _safeInitAsync(() async {
      _checkInOutStatus =
          await secureStorage.getString('ff_checkInOutStatus') ??
              _checkInOutStatus;
    });
    await _safeInitAsync(() async {
      _checkInOutshowStatus =
          await secureStorage.getBool('ff_checkInOutshowStatus') ??
              _checkInOutshowStatus;
    });
    await _safeInitAsync(() async {
      _onsiteStatus =
          await secureStorage.getBool('ff_onsiteStatus') ?? _onsiteStatus;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    secureStorage.setString('ff_token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  int _companyID = 0;
  int get companyID => _companyID;
  set companyID(int value) {
    _companyID = value;
    secureStorage.setInt('ff_companyID', value);
  }

  void deleteCompanyID() {
    secureStorage.delete(key: 'ff_companyID');
  }

  int _employeeID = 0;
  int get employeeID => _employeeID;
  set employeeID(int value) {
    _employeeID = value;
    secureStorage.setInt('ff_employeeID', value);
  }

  void deleteEmployeeID() {
    secureStorage.delete(key: 'ff_employeeID');
  }

  int _userID = 0;
  int get userID => _userID;
  set userID(int value) {
    _userID = value;
    secureStorage.setInt('ff_userID', value);
  }

  void deleteUserID() {
    secureStorage.delete(key: 'ff_userID');
  }

  int _timeID = 0;
  int get timeID => _timeID;
  set timeID(int value) {
    _timeID = value;
  }

  String _timeType = '';
  String get timeType => _timeType;
  set timeType(String value) {
    _timeType = value;
  }

  bool _approve = false;
  bool get approve => _approve;
  set approve(bool value) {
    _approve = value;
    secureStorage.setBool('ff_approve', value);
  }

  void deleteApprove() {
    secureStorage.delete(key: 'ff_approve');
  }

  int _reportID = 0;
  int get reportID => _reportID;
  set reportID(int value) {
    _reportID = value;
    secureStorage.setInt('ff_reportID', value);
  }

  void deleteReportID() {
    secureStorage.delete(key: 'ff_reportID');
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    secureStorage.setString('ff_firstName', value);
  }

  void deleteFirstName() {
    secureStorage.delete(key: 'ff_firstName');
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    secureStorage.setString('ff_lastName', value);
  }

  void deleteLastName() {
    secureStorage.delete(key: 'ff_lastName');
  }

  String _employeeCode = '';
  String get employeeCode => _employeeCode;
  set employeeCode(String value) {
    _employeeCode = value;
  }

  int _positionID = 0;
  int get positionID => _positionID;
  set positionID(int value) {
    _positionID = value;
  }

  String _positionName = '';
  String get positionName => _positionName;
  set positionName(String value) {
    _positionName = value;
    secureStorage.setString('ff_positionName', value);
  }

  void deletePositionName() {
    secureStorage.delete(key: 'ff_positionName');
  }

  String _imagesFile = '';
  String get imagesFile => _imagesFile;
  set imagesFile(String value) {
    _imagesFile = value;
    secureStorage.setString('ff_imagesFile', value);
  }

  void deleteImagesFile() {
    secureStorage.delete(key: 'ff_imagesFile');
  }

  String _roleName = '';
  String get roleName => _roleName;
  set roleName(String value) {
    _roleName = value;
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  int _consentID = 0;
  int get consentID => _consentID;
  set consentID(int value) {
    _consentID = value;
  }

  int _firstUserID = 0;
  int get firstUserID => _firstUserID;
  set firstUserID(int value) {
    _firstUserID = value;
  }

  int _employeeStatus = 0;
  int get employeeStatus => _employeeStatus;
  set employeeStatus(int value) {
    _employeeStatus = value;
  }

  String _logoImage = '';
  String get logoImage => _logoImage;
  set logoImage(String value) {
    _logoImage = value;
    secureStorage.setString('ff_logoImage', value);
  }

  void deleteLogoImage() {
    secureStorage.delete(key: 'ff_logoImage');
  }

  String _colorCode = '';
  String get colorCode => _colorCode;
  set colorCode(String value) {
    _colorCode = value;
    secureStorage.setString('ff_colorCode', value);
  }

  void deleteColorCode() {
    secureStorage.delete(key: 'ff_colorCode');
  }

  bool _showPopUpImage = false;
  bool get showPopUpImage => _showPopUpImage;
  set showPopUpImage(bool value) {
    _showPopUpImage = value;
  }

  int _timeoffID = 0;
  int get timeoffID => _timeoffID;
  set timeoffID(int value) {
    _timeoffID = value;
  }

  int _clockID = 0;
  int get clockID => _clockID;
  set clockID(int value) {
    _clockID = value;
    secureStorage.setInt('ff_clockID', value);
  }

  void deleteClockID() {
    secureStorage.delete(key: 'ff_clockID');
  }

  String _shiftStartTIme = '';
  String get shiftStartTIme => _shiftStartTIme;
  set shiftStartTIme(String value) {
    _shiftStartTIme = value;
    secureStorage.setString('ff_shiftStartTIme', value);
  }

  void deleteShiftStartTIme() {
    secureStorage.delete(key: 'ff_shiftStartTIme');
  }

  String _shiftEndTime = '';
  String get shiftEndTime => _shiftEndTime;
  set shiftEndTime(String value) {
    _shiftEndTime = value;
  }

  String _clockInTime = '-';
  String get clockInTime => _clockInTime;
  set clockInTime(String value) {
    _clockInTime = value;
    secureStorage.setString('ff_clockInTime', value);
  }

  void deleteClockInTime() {
    secureStorage.delete(key: 'ff_clockInTime');
  }

  String _clockInLocation = '';
  String get clockInLocation => _clockInLocation;
  set clockInLocation(String value) {
    _clockInLocation = value;
    secureStorage.setString('ff_clockInLocation', value);
  }

  void deleteClockInLocation() {
    secureStorage.delete(key: 'ff_clockInLocation');
  }

  String _clockInLattitude = '';
  String get clockInLattitude => _clockInLattitude;
  set clockInLattitude(String value) {
    _clockInLattitude = value;
    secureStorage.setString('ff_clockInLattitude', value);
  }

  void deleteClockInLattitude() {
    secureStorage.delete(key: 'ff_clockInLattitude');
  }

  String _clockInLongitude = '';
  String get clockInLongitude => _clockInLongitude;
  set clockInLongitude(String value) {
    _clockInLongitude = value;
    secureStorage.setString('ff_clockInLongitude', value);
  }

  void deleteClockInLongitude() {
    secureStorage.delete(key: 'ff_clockInLongitude');
  }

  String _clockOutTime = '-';
  String get clockOutTime => _clockOutTime;
  set clockOutTime(String value) {
    _clockOutTime = value;
    secureStorage.setString('ff_clockOutTime', value);
  }

  void deleteClockOutTime() {
    secureStorage.delete(key: 'ff_clockOutTime');
  }

  String _clockOutLocation = '';
  String get clockOutLocation => _clockOutLocation;
  set clockOutLocation(String value) {
    _clockOutLocation = value;
  }

  String _clockOutLattitude = '';
  String get clockOutLattitude => _clockOutLattitude;
  set clockOutLattitude(String value) {
    _clockOutLattitude = value;
  }

  String _clockOutLongitude = '';
  String get clockOutLongitude => _clockOutLongitude;
  set clockOutLongitude(String value) {
    _clockOutLongitude = value;
  }

  int _timezoneOffset = 0;
  int get timezoneOffset => _timezoneOffset;
  set timezoneOffset(int value) {
    _timezoneOffset = value;
    secureStorage.setInt('ff_timezoneOffset', value);
  }

  void deleteTimezoneOffset() {
    secureStorage.delete(key: 'ff_timezoneOffset');
  }

  String _languageStatus = 'English';
  String get languageStatus => _languageStatus;
  set languageStatus(String value) {
    _languageStatus = value;
    secureStorage.setString('ff_languageStatus', value);
  }

  void deleteLanguageStatus() {
    secureStorage.delete(key: 'ff_languageStatus');
  }

  String _mainPinCode = '';
  String get mainPinCode => _mainPinCode;
  set mainPinCode(String value) {
    _mainPinCode = value;
    secureStorage.setString('ff_mainPinCode', value);
  }

  void deleteMainPinCode() {
    secureStorage.delete(key: 'ff_mainPinCode');
  }

  String _prefix = '';
  String get prefix => _prefix;
  set prefix(String value) {
    _prefix = value;
    secureStorage.setString('ff_prefix', value);
  }

  void deletePrefix() {
    secureStorage.delete(key: 'ff_prefix');
  }

  String _nickName = '';
  String get nickName => _nickName;
  set nickName(String value) {
    _nickName = value;
    secureStorage.setString('ff_nickName', value);
  }

  void deleteNickName() {
    secureStorage.delete(key: 'ff_nickName');
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    secureStorage.setString('ff_phone', value);
  }

  void deletePhone() {
    secureStorage.delete(key: 'ff_phone');
  }

  String _departmentName = '';
  String get departmentName => _departmentName;
  set departmentName(String value) {
    _departmentName = value;
    secureStorage.setString('ff_departmentName', value);
  }

  void deleteDepartmentName() {
    secureStorage.delete(key: 'ff_departmentName');
  }

  String _dateOfEmployment = '';
  String get dateOfEmployment => _dateOfEmployment;
  set dateOfEmployment(String value) {
    _dateOfEmployment = value;
    secureStorage.setString('ff_dateOfEmployment', value);
  }

  void deleteDateOfEmployment() {
    secureStorage.delete(key: 'ff_dateOfEmployment');
  }

  String _hiredDate = '';
  String get hiredDate => _hiredDate;
  set hiredDate(String value) {
    _hiredDate = value;
    secureStorage.setString('ff_hiredDate', value);
  }

  void deleteHiredDate() {
    secureStorage.delete(key: 'ff_hiredDate');
  }

  bool _isPinCodeFlag = false;
  bool get isPinCodeFlag => _isPinCodeFlag;
  set isPinCodeFlag(bool value) {
    _isPinCodeFlag = value;
  }

  bool _isGeneralFirstTime = false;
  bool get isGeneralFirstTime => _isGeneralFirstTime;
  set isGeneralFirstTime(bool value) {
    _isGeneralFirstTime = value;
    secureStorage.setBool('ff_isGeneralFirstTime', value);
  }

  void deleteIsGeneralFirstTime() {
    secureStorage.delete(key: 'ff_isGeneralFirstTime');
  }

  bool _isChangePinCodeFlag = false;
  bool get isChangePinCodeFlag => _isChangePinCodeFlag;
  set isChangePinCodeFlag(bool value) {
    _isChangePinCodeFlag = value;
  }

  bool _biometricFlag = false;
  bool get biometricFlag => _biometricFlag;
  set biometricFlag(bool value) {
    _biometricFlag = value;
    secureStorage.setBool('ff_biometricFlag', value);
  }

  void deleteBiometricFlag() {
    secureStorage.delete(key: 'ff_biometricFlag');
  }

  bool _resetPinCodeFlag = false;
  bool get resetPinCodeFlag => _resetPinCodeFlag;
  set resetPinCodeFlag(bool value) {
    _resetPinCodeFlag = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    secureStorage.setString('ff_password', value);
  }

  void deletePassword() {
    secureStorage.delete(key: 'ff_password');
  }

  List<RejectPendingApprovalStruct> _onloadGetOTandTimeOff = [];
  List<RejectPendingApprovalStruct> get onloadGetOTandTimeOff =>
      _onloadGetOTandTimeOff;
  set onloadGetOTandTimeOff(List<RejectPendingApprovalStruct> value) {
    _onloadGetOTandTimeOff = value;
  }

  void addToOnloadGetOTandTimeOff(RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOff.add(value);
  }

  void removeFromOnloadGetOTandTimeOff(RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOff.remove(value);
  }

  void removeAtIndexFromOnloadGetOTandTimeOff(int index) {
    onloadGetOTandTimeOff.removeAt(index);
  }

  void updateOnloadGetOTandTimeOffAtIndex(
    int index,
    RejectPendingApprovalStruct Function(RejectPendingApprovalStruct) updateFn,
  ) {
    onloadGetOTandTimeOff[index] = updateFn(_onloadGetOTandTimeOff[index]);
  }

  void insertAtIndexInOnloadGetOTandTimeOff(
      int index, RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOff.insert(index, value);
  }

  List<RejectPendingApprovalStruct> _onloadGetOTandTimeOffHistory = [];
  List<RejectPendingApprovalStruct> get onloadGetOTandTimeOffHistory =>
      _onloadGetOTandTimeOffHistory;
  set onloadGetOTandTimeOffHistory(List<RejectPendingApprovalStruct> value) {
    _onloadGetOTandTimeOffHistory = value;
  }

  void addToOnloadGetOTandTimeOffHistory(RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOffHistory.add(value);
  }

  void removeFromOnloadGetOTandTimeOffHistory(
      RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOffHistory.remove(value);
  }

  void removeAtIndexFromOnloadGetOTandTimeOffHistory(int index) {
    onloadGetOTandTimeOffHistory.removeAt(index);
  }

  void updateOnloadGetOTandTimeOffHistoryAtIndex(
    int index,
    RejectPendingApprovalStruct Function(RejectPendingApprovalStruct) updateFn,
  ) {
    onloadGetOTandTimeOffHistory[index] =
        updateFn(_onloadGetOTandTimeOffHistory[index]);
  }

  void insertAtIndexInOnloadGetOTandTimeOffHistory(
      int index, RejectPendingApprovalStruct value) {
    onloadGetOTandTimeOffHistory.insert(index, value);
  }

  bool _isHistoryCancel = false;
  bool get isHistoryCancel => _isHistoryCancel;
  set isHistoryCancel(bool value) {
    _isHistoryCancel = value;
  }

  String _taskType = 'Time Off';
  String get taskType => _taskType;
  set taskType(String value) {
    _taskType = value;
  }

  String _otClockInTime = '-';
  String get otClockInTime => _otClockInTime;
  set otClockInTime(String value) {
    _otClockInTime = value;
    secureStorage.setString('ff_otClockInTime', value);
  }

  void deleteOtClockInTime() {
    secureStorage.delete(key: 'ff_otClockInTime');
  }

  String _otClockOutTime = '-';
  String get otClockOutTime => _otClockOutTime;
  set otClockOutTime(String value) {
    _otClockOutTime = value;
    secureStorage.setString('ff_otClockOutTime', value);
  }

  void deleteOtClockOutTime() {
    secureStorage.delete(key: 'ff_otClockOutTime');
  }

  String _otClockInLocation = '';
  String get otClockInLocation => _otClockInLocation;
  set otClockInLocation(String value) {
    _otClockInLocation = value;
    secureStorage.setString('ff_otClockInLocation', value);
  }

  void deleteOtClockInLocation() {
    secureStorage.delete(key: 'ff_otClockInLocation');
  }

  String _otClockInLattitude = '';
  String get otClockInLattitude => _otClockInLattitude;
  set otClockInLattitude(String value) {
    _otClockInLattitude = value;
    secureStorage.setString('ff_otClockInLattitude', value);
  }

  void deleteOtClockInLattitude() {
    secureStorage.delete(key: 'ff_otClockInLattitude');
  }

  String _otClockInLongitude = '';
  String get otClockInLongitude => _otClockInLongitude;
  set otClockInLongitude(String value) {
    _otClockInLongitude = value;
    secureStorage.setString('ff_otClockInLongitude', value);
  }

  void deleteOtClockInLongitude() {
    secureStorage.delete(key: 'ff_otClockInLongitude');
  }

  String _otClockOutLongitude = '';
  String get otClockOutLongitude => _otClockOutLongitude;
  set otClockOutLongitude(String value) {
    _otClockOutLongitude = value;
    secureStorage.setString('ff_otClockOutLongitude', value);
  }

  void deleteOtClockOutLongitude() {
    secureStorage.delete(key: 'ff_otClockOutLongitude');
  }

  String _otClockOutLocation = '';
  String get otClockOutLocation => _otClockOutLocation;
  set otClockOutLocation(String value) {
    _otClockOutLocation = value;
    secureStorage.setString('ff_otClockOutLocation', value);
  }

  void deleteOtClockOutLocation() {
    secureStorage.delete(key: 'ff_otClockOutLocation');
  }

  String _otClockOutLattitude = '';
  String get otClockOutLattitude => _otClockOutLattitude;
  set otClockOutLattitude(String value) {
    _otClockOutLattitude = value;
    secureStorage.setString('ff_otClockOutLattitude', value);
  }

  void deleteOtClockOutLattitude() {
    secureStorage.delete(key: 'ff_otClockOutLattitude');
  }

  List<dynamic> _CalendarList = [];
  List<dynamic> get CalendarList => _CalendarList;
  set CalendarList(List<dynamic> value) {
    _CalendarList = value;
    secureStorage.setStringList(
        'ff_CalendarList', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteCalendarList() {
    secureStorage.delete(key: 'ff_CalendarList');
  }

  void addToCalendarList(dynamic value) {
    CalendarList.add(value);
    secureStorage.setStringList(
        'ff_CalendarList', _CalendarList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCalendarList(dynamic value) {
    CalendarList.remove(value);
    secureStorage.setStringList(
        'ff_CalendarList', _CalendarList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCalendarList(int index) {
    CalendarList.removeAt(index);
    secureStorage.setStringList(
        'ff_CalendarList', _CalendarList.map((x) => jsonEncode(x)).toList());
  }

  void updateCalendarListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    CalendarList[index] = updateFn(_CalendarList[index]);
    secureStorage.setStringList(
        'ff_CalendarList', _CalendarList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCalendarList(int index, dynamic value) {
    CalendarList.insert(index, value);
    secureStorage.setStringList(
        'ff_CalendarList', _CalendarList.map((x) => jsonEncode(x)).toList());
  }

  String _selectedDate = '';
  String get selectedDate => _selectedDate;
  set selectedDate(String value) {
    _selectedDate = value;
    secureStorage.setString('ff_selectedDate', value);
  }

  void deleteSelectedDate() {
    secureStorage.delete(key: 'ff_selectedDate');
  }

  String _date = '2025-02-12T00:00:00';
  String get date => _date;
  set date(String value) {
    _date = value;
    secureStorage.setString('ff_date', value);
  }

  void deleteDate() {
    secureStorage.delete(key: 'ff_date');
  }

  List<dynamic> _selectedEventsJSon = [];
  List<dynamic> get selectedEventsJSon => _selectedEventsJSon;
  set selectedEventsJSon(List<dynamic> value) {
    _selectedEventsJSon = value;
    secureStorage.setStringList(
        'ff_selectedEventsJSon', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteSelectedEventsJSon() {
    secureStorage.delete(key: 'ff_selectedEventsJSon');
  }

  void addToSelectedEventsJSon(dynamic value) {
    selectedEventsJSon.add(value);
    secureStorage.setStringList('ff_selectedEventsJSon',
        _selectedEventsJSon.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSelectedEventsJSon(dynamic value) {
    selectedEventsJSon.remove(value);
    secureStorage.setStringList('ff_selectedEventsJSon',
        _selectedEventsJSon.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSelectedEventsJSon(int index) {
    selectedEventsJSon.removeAt(index);
    secureStorage.setStringList('ff_selectedEventsJSon',
        _selectedEventsJSon.map((x) => jsonEncode(x)).toList());
  }

  void updateSelectedEventsJSonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedEventsJSon[index] = updateFn(_selectedEventsJSon[index]);
    secureStorage.setStringList('ff_selectedEventsJSon',
        _selectedEventsJSon.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSelectedEventsJSon(int index, dynamic value) {
    selectedEventsJSon.insert(index, value);
    secureStorage.setStringList('ff_selectedEventsJSon',
        _selectedEventsJSon.map((x) => jsonEncode(x)).toList());
  }

  int _checkInStatusOnSite = 0;
  int get checkInStatusOnSite => _checkInStatusOnSite;
  set checkInStatusOnSite(int value) {
    _checkInStatusOnSite = value;
    secureStorage.setInt('ff_checkInStatusOnSite', value);
  }

  void deleteCheckInStatusOnSite() {
    secureStorage.delete(key: 'ff_checkInStatusOnSite');
  }

  int _OTRequestID = 0;
  int get OTRequestID => _OTRequestID;
  set OTRequestID(int value) {
    _OTRequestID = value;
    secureStorage.setInt('ff_OTRequestID', value);
  }

  void deleteOTRequestID() {
    secureStorage.delete(key: 'ff_OTRequestID');
  }

  List<AttachmentFileModelStruct> _otAttachment = [];
  List<AttachmentFileModelStruct> get otAttachment => _otAttachment;
  set otAttachment(List<AttachmentFileModelStruct> value) {
    _otAttachment = value;
    secureStorage.setStringList(
        'ff_otAttachment', value.map((x) => x.serialize()).toList());
  }

  void deleteOtAttachment() {
    secureStorage.delete(key: 'ff_otAttachment');
  }

  void addToOtAttachment(AttachmentFileModelStruct value) {
    otAttachment.add(value);
    secureStorage.setStringList(
        'ff_otAttachment', _otAttachment.map((x) => x.serialize()).toList());
  }

  void removeFromOtAttachment(AttachmentFileModelStruct value) {
    otAttachment.remove(value);
    secureStorage.setStringList(
        'ff_otAttachment', _otAttachment.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOtAttachment(int index) {
    otAttachment.removeAt(index);
    secureStorage.setStringList(
        'ff_otAttachment', _otAttachment.map((x) => x.serialize()).toList());
  }

  void updateOtAttachmentAtIndex(
    int index,
    AttachmentFileModelStruct Function(AttachmentFileModelStruct) updateFn,
  ) {
    otAttachment[index] = updateFn(_otAttachment[index]);
    secureStorage.setStringList(
        'ff_otAttachment', _otAttachment.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInOtAttachment(int index, AttachmentFileModelStruct value) {
    otAttachment.insert(index, value);
    secureStorage.setStringList(
        'ff_otAttachment', _otAttachment.map((x) => x.serialize()).toList());
  }

  int _timeZoneOffsetSeconds = 0;
  int get timeZoneOffsetSeconds => _timeZoneOffsetSeconds;
  set timeZoneOffsetSeconds(int value) {
    _timeZoneOffsetSeconds = value;
    secureStorage.setInt('ff_timeZoneOffsetSeconds', value);
  }

  void deleteTimeZoneOffsetSeconds() {
    secureStorage.delete(key: 'ff_timeZoneOffsetSeconds');
  }

  int _approverID2 = 0;
  int get approverID2 => _approverID2;
  set approverID2(int value) {
    _approverID2 = value;
    secureStorage.setInt('ff_approverID2', value);
  }

  void deleteApproverID2() {
    secureStorage.delete(key: 'ff_approverID2');
  }

  int _approverID3 = 0;
  int get approverID3 => _approverID3;
  set approverID3(int value) {
    _approverID3 = value;
    secureStorage.setInt('ff_approverID3', value);
  }

  void deleteApproverID3() {
    secureStorage.delete(key: 'ff_approverID3');
  }

  int _approverID4 = 0;
  int get approverID4 => _approverID4;
  set approverID4(int value) {
    _approverID4 = value;
    secureStorage.setInt('ff_approverID4', value);
  }

  void deleteApproverID4() {
    secureStorage.delete(key: 'ff_approverID4');
  }

  int _approverID5 = 0;
  int get approverID5 => _approverID5;
  set approverID5(int value) {
    _approverID5 = value;
    secureStorage.setInt('ff_approverID5', value);
  }

  void deleteApproverID5() {
    secureStorage.delete(key: 'ff_approverID5');
  }

  int _approverOrder = 0;
  int get approverOrder => _approverOrder;
  set approverOrder(int value) {
    _approverOrder = value;
    secureStorage.setInt('ff_approverOrder', value);
  }

  void deleteApproverOrder() {
    secureStorage.delete(key: 'ff_approverOrder');
  }

  String _OnsiteClockInTime = '';
  String get OnsiteClockInTime => _OnsiteClockInTime;
  set OnsiteClockInTime(String value) {
    _OnsiteClockInTime = value;
    secureStorage.setString('ff_OnsiteClockInTime', value);
  }

  void deleteOnsiteClockInTime() {
    secureStorage.delete(key: 'ff_OnsiteClockInTime');
  }

  String _onSiteClockOutTime = '';
  String get onSiteClockOutTime => _onSiteClockOutTime;
  set onSiteClockOutTime(String value) {
    _onSiteClockOutTime = value;
    secureStorage.setString('ff_onSiteClockOutTime', value);
  }

  void deleteOnSiteClockOutTime() {
    secureStorage.delete(key: 'ff_onSiteClockOutTime');
  }

  int _NotificationCount = 0;
  int get NotificationCount => _NotificationCount;
  set NotificationCount(int value) {
    _NotificationCount = value;
    secureStorage.setInt('ff_NotificationCount', value);
  }

  void deleteNotificationCount() {
    secureStorage.delete(key: 'ff_NotificationCount');
  }

  String _AnnouncementwebviewLink =
      'https://gray-sky-09c66cd00.5.azurestaticapps.net/AnnouncementMobView/';
  String get AnnouncementwebviewLink => _AnnouncementwebviewLink;
  set AnnouncementwebviewLink(String value) {
    _AnnouncementwebviewLink = value;
    secureStorage.setString('ff_AnnouncementwebviewLink', value);
  }

  void deleteAnnouncementwebviewLink() {
    secureStorage.delete(key: 'ff_AnnouncementwebviewLink');
  }

  String _checkInOutStatus = '';
  String get checkInOutStatus => _checkInOutStatus;
  set checkInOutStatus(String value) {
    _checkInOutStatus = value;
    secureStorage.setString('ff_checkInOutStatus', value);
  }

  void deleteCheckInOutStatus() {
    secureStorage.delete(key: 'ff_checkInOutStatus');
  }

  bool _checkInOutshowStatus = false;
  bool get checkInOutshowStatus => _checkInOutshowStatus;
  set checkInOutshowStatus(bool value) {
    _checkInOutshowStatus = value;
    secureStorage.setBool('ff_checkInOutshowStatus', value);
  }

  void deleteCheckInOutshowStatus() {
    secureStorage.delete(key: 'ff_checkInOutshowStatus');
  }

  bool _onsiteStatus = false;
  bool get onsiteStatus => _onsiteStatus;
  set onsiteStatus(bool value) {
    _onsiteStatus = value;
    secureStorage.setBool('ff_onsiteStatus', value);
  }

  void deleteOnsiteStatus() {
    secureStorage.delete(key: 'ff_onsiteStatus');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
