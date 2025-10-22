import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? changeRequestedDateFormat(String? apiDate) {
  // if (apiDate == null) {
  //   return null;
  // }
  // DateTime date = DateTime.parse(apiDate);
  // String formatter = DateFormat('dd MMM yyyy, HH:MM').format(date);
  // return formatter;
  if (apiDate == null) {
    return null;
  }

  DateTime date =
      DateTime.parse(apiDate).toLocal(); // Convert to local timezone
  String formatter = DateFormat('dd MMM yyyy, HH:mm')
      .format(date); // 'mm' is for minutes, 'MM' is for month
  return formatter;
}

Color? clockInColorFunction(
  String? clockInTime,
  String? shiftstartTime,
) {
  try {
    final format = DateFormat('HH:mm');

    final clockIn = clockInTime != null ? format.parse(clockInTime) : null;
    final shiftStart =
        shiftstartTime != null ? format.parse(shiftstartTime) : null;

    final isLateClockIn =
        clockIn != null && shiftStart != null && clockIn.isAfter(shiftStart);

    if (isLateClockIn) {
      return Colors.red;
    }

    return Colors.green;
  } catch (e) {
    return Colors.green;
  }
}

String? changeDateFormatYearMonthDay(DateTime currentDate) {
  String formatter = DateFormat('yyyy-MM-dd').format(currentDate);
  return formatter;
}

String? changeDateFormat(String? apiDate) {
  if (apiDate == null) {
    return null;
  }
  DateTime date = DateTime.parse(apiDate);
  String formatter = DateFormat('dd/MM/yyyy').format(date);
  return formatter;
}

Color? leaveStatusTextColor(String? leaveStatus) {
  if (leaveStatus == "Approved") {
    return Color(0xFF00BB06A);
  }
  if (leaveStatus == "Denied") {
    return Color(0xFFFF4B55);
  }
  if (leaveStatus == "Waiting Approval") {
    return Color(0xFFF21A8D6);
  }
  if (leaveStatus == "Canceled") {
    return Color(0xFFFF4B55);
  }
  return Color(0xFFF21A8D6);
}

List<dynamic> filteredYearMyaApprovalFunctionCopy(
  String currentYear,
  List<dynamic>? yearMyApproval,
) {
  // get the list of only current year
  return yearMyApproval!.where((item) {
    if (item is Map<String, dynamic>) {
      DateTime? approvalDate = DateTime.tryParse(item['requested_Date']);
      if (approvalDate != null) {
        return approvalDate.year == int.parse(currentYear);
      }
    }
    return false;
  }).toList();
}

Color? leaveStatusBackgroundColor(String? leaveStatus) {
  if (leaveStatus == "Approved") {
    return Color(
        0xFF07cf2c0); // Use 0xFF for opacity and 0x for hexadecimal color values
  }
  if (leaveStatus == "Denied") {
    return Color(0xFF0FFCCCC);
  }
  if (leaveStatus == "Canceled") {
    return Color(0xFF0FFCCCC);
  }
  return Color(0xFF0DAE3F3);
}

List<GetDataModelOvertimeStruct>? filterCanceledOT(
    List<GetDataModelOvertimeStruct> overtimeStatus) {
  var filteredList =
      overtimeStatus.where((x) => x.status == "Canceled").toList();
  return filteredList;
}

Color? overtimeStatusTextColor(String? overtimeStatus) {
  if (overtimeStatus == "Approved") {
    return Color(0xFF0BB06A);
  }
  if (overtimeStatus == "Denied") {
    return Color(0xFFFF4B55);
  }
  if (overtimeStatus == "Cancelled" || overtimeStatus == "Canceled") {
    return Color(0xFF959595);
  }
  return Colors.transparent;
}

Color? overtimeStatusBackgroundColor(String? overtimeStatus) {
  if (overtimeStatus == "Approved") {
    return Color.fromARGB(255, 184, 239, 216);
  }
  if (overtimeStatus == "Denied") {
    return Color.fromARGB(255, 215, 161, 164);
  }
  if (overtimeStatus == "Canceled") {
    return Color.fromARGB(237, 237, 237, 237);
  }
  return Color.fromARGB(255, 215, 161, 164);
}

String? changeCheckInOutTimeFormatFunction(String? apiDate) {
  if (apiDate == null || apiDate.trim().isEmpty) {
    return null;
  }

  try {
    // Parse the API date. The second argument "true" treats the input as UTC.
    DateTime dateTime =
        DateFormat("yyyy/MM/dd HH:mm").parse(apiDate, true).toLocal();
    // Format the date time to only display hours and minutes.
    return DateFormat.Hm().format(dateTime);
  } catch (e) {
    print("Error parsing date: $e");
    return null;
  }
}

String? changeOTHHmmFormatFunction(String? apiDate) {
  if (apiDate == null) {
    return null;
  }

  try {
    // Parse the date string as UTC
    DateTime utcDateTime = DateFormat('yyyy/MM/dd HH:mm').parseUtc(apiDate);

    // Convert to local time zone
    DateTime localDateTime = utcDateTime.toLocal();

    // Format and return just the time (HH:mm)
    return DateFormat('HH:mm').format(localDateTime);
  } catch (e) {
    return null;
  }
}

List<AttachmentFileModelStruct> leaveAttachmentKHAMethod(List<String> urls) {
  List<AttachmentFileModelStruct> urlList = [];

  for (String url in urls) {
    // Split the URL by '/' to get the filename part
    List<String> parts = url.split('/');

    // Get the last part which contains the filename and extension
    String fullFilename = parts.last;

    // Split the filename and file type by '.'
    List<String> filenameParts = fullFilename.split('.');

    String filetype = filenameParts[1];

    // Push the map object into the urlList array
    urlList.add(AttachmentFileModelStruct(
        attachmentFile: url.toString(),
        filename: fullFilename.toString(),
        filetype: filetype.toString()));
  }

  return urlList;
}

String? leaveDayAmountFunction(
  String? startDateAPI,
  String? endDateAPI,
  String? startTime,
  String? endTime,
) {
  if (startDateAPI == null || endDateAPI == null) {
    return null;
  }

  try {
    // Strip time from ISO 8601 date-time if needed
    final startDateStr = startDateAPI.split('T').first;
    final endDateStr = endDateAPI.split('T').first;

    final dateFormat = DateFormat('yyyy-MM-dd');

    final startDate = dateFormat.parse(startDateStr);
    final endDate = dateFormat.parse(endDateStr);

    // If it's a same-day leave and time is provided, try to parse time duration
    if (startDate.isAtSameMomentAs(endDate) &&
        startTime != null &&
        endTime != null &&
        startTime.contains(':') &&
        endTime.contains(':')) {
      final startDateTimeStr = '$startDateStr $startTime';
      final endDateTimeStr = '$endDateStr $endTime';

      final fullDateTimeFormat = DateFormat('yyyy-MM-dd HH:mm');
      final startDateTime = fullDateTimeFormat.parse(startDateTimeStr);
      final endDateTime = fullDateTimeFormat.parse(endDateTimeStr);

      final hourDifference =
          endDateTime.difference(startDateTime).inMinutes / 60.0;

      if (hourDifference <= 4) {
        return '0.5 day';
      } else {
        return '1 day';
      }
    }

    // For multi-day leave, count inclusive days
    final duration = endDate.difference(startDate).inDays + 1;
    return '$duration days';
  } catch (e) {
    print('Error parsing dates or times: $e');
    return null;
  }
}

String paySlipDateFormatFunction1(String paySlipDate) {
  DateTime date = DateTime.parse(paySlipDate);

  String formattedDate = DateFormat('MM/yyyy').format(date);

  return formattedDate.toString();
}

String? changeLeaveRequestedDateFormat(String? apiDate) {
  // if (apiDate == null) {
  //   return null;
  // }
  // DateTime date = DateTime.parse(apiDate);
  // String formatter = DateFormat('dd MMM yyyy, HH:MM').format(date);
  // return formatter;
  if (apiDate == null) {
    return null;
  }

  DateTime date = DateTime.parse(apiDate);
  String formatter =
      DateFormat('yyyy-MM-dd').format(date); // Changed 'MM' to 'mm' for minutes
  return formatter;
}

List<GetDataModelOvertimeStruct>? filterApprovedOT(
    List<GetDataModelOvertimeStruct> overtimeStatus) {
  var filteredList =
      overtimeStatus.where((x) => x.status == "Approved").toList();
  return filteredList;
}

String? dateFormatToDay() {
  DateTime date = DateTime.now();
  String formatter = DateFormat('dd/MM/yyyy').format(date);
  return formatter;
}

String? checkStatusCheckInOrCheckOut(dynamic jsonData) {
  // if (jsonData["status"] == 0 && jsonData["message"] == "Successfully") {
  //   List<dynamic> data = jsonData["data"];
  //   for (var employee in data) {
  //     List<dynamic> regCinoutData = employee["regCinoutData"];
  //     List<dynamic> irrRegCinoutData = employee["irrRegCinoutData"];
  //     List<dynamic> irrOTCinoutData = employee["irrOTCinoutData"];

  //     // ตรวจสอบเงื่อนไขสำหรับ check in
  //     bool shouldCheckIn = irrRegCinoutData.isEmpty ||
  //         irrOTCinoutData.any((clock) => clock["clock_Out_Time"] != "-");

  //     if (shouldCheckIn) {
  //       // Return check in data
  return "Check in";
  //     } else {
  //       // Return check out data
  //       return "Check out";
  //     }
  //   }
  // } else {
  //   return "Check in";
  // }
}

List<dynamic> leaveAttachment(List<String> urls) {
  List<dynamic> urlList = [];

  // if (urls.length != 0) {
  for (String url in urls) {
    // Split the URL by '/' to get the filename part
    List<String> parts = url.split('/');

    // Get the last part which contains the filename and extension
    String fullFilename = parts.last;

    // Split the filename and file type by '.'
    List<String> filenameParts = fullFilename.split('.');

    // Extract the filename (the part before the dot) and the filetype (the part after the dot)
    // String filename = filenameParts[0];
    String filetype = filenameParts[1];

    // Create a map object to hold filename and filetype
    Map<String, String> fileInfo = {
      '"attachment_file"': '"' + url + '"',
      '"filename"': '"' + fullFilename + '"',
      '"filetype"': '"' + filetype + '"'
    };

    // Push the map object into the urlList array
    urlList.add(fileInfo);
  }
  // }

  return urlList;
}

int balanceDays(
  int timeOffId,
  List<BalanceDaysStruct> getLeaveWithRemainingDays,
) {
  // Use firstWhere to find the item with the matching timeOff_ID
  final leave = getLeaveWithRemainingDays
      .firstWhere((item) => item.timeOffID == timeOffId);

  // Return the availableDays if the leave is found, otherwise return 0
  return leave.availablDays;
}

int getTimezoneOffset(DateTime currentTime) {
  final DateTime currentTime = DateTime.now();
  final DateTime utcTime = DateTime.now().toUtc();

  return utcTime.timeZoneOffset.inMinutes -
      currentTime.timeZoneOffset.inMinutes;
}

String? myInfoNameCombinationCopy(
  String prefix,
  String firstName,
  String lastName,
  String? nickName,
) {
  if (nickName == null || nickName.isEmpty || nickName == "null") {
    return prefix + '. ' + firstName + ' ' + lastName;
  } else {
    return prefix + '. ' + firstName + ' ' + lastName + ' (' + nickName + ')';
  }
}

String checkInOutTimeFormat(String timeWithDate) {
  // final String time = timeWithDate.split('/')[1];

  return timeWithDate.split(' ')[1];
}

String announcementMobileViewURL(
  String baseURL,
  int announcementID,
) {
  final url = baseURL + announcementID.toString();
  return url;
}

String paySlipDateFormatFunction2(String paySlipDate) {
  DateTime date = DateTime.parse(paySlipDate);

  String formattedDate = DateFormat('dd MMMM yyyy').format(date);

  return formattedDate.toString();
}

List<String> paySlipDateFormatFunction3(
    List<PaySlipListJsonStruct> paySlipListJSON) {
  List<String> formattedDates = [];

  for (var paySlip in paySlipListJSON) {
    DateTime date = DateTime.parse(paySlip.periodEndDate);
    String formattedDate = DateFormat('yyyy').format(date);
    formattedDates.add(formattedDate);
  }

  List<String> uniqueFormattedDates = formattedDates.toSet().toList();
  return uniqueFormattedDates;
}

List<PaySlipListJsonStruct> paySlipFilterByYear(
  String selectedYear,
  List<PaySlipListJsonStruct> paySlipAllListJSON,
) {
  var returndata = paySlipAllListJSON
      .where((x) => x.periodEndDate.contains(selectedYear))
      .toList();
  return returndata;
}

List<dynamic>? filterEntriesForDay(List<dynamic>? data) {
  if (data == null) return null;

  DateTime now = DateTime.now();
  String todayString = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
      .format(DateTime(now.year, now.month, now.day));

  // Filter data for today's entries
  List<dynamic> todayEntries = data.where((entry) {
    if (entry is Map<String, dynamic> && entry.containsKey('timeEntry_Date')) {
      return entry['timeEntry_Date'] == todayString;
    }
    return false;
  }).toList();

  return todayEntries;
}

String? pinCodeCombineString(List<String>? pincode) {
  String value = '';
  try {
    if (pincode != null) {
      value = pincode.join('');
    }
  } catch (e) {
    print('Error in combineString ${e.toString()}; ${pincode?.join(',')}');
  }
  return value;
}

String? profileNameCombination(
  String firstName,
  String lastName,
  String? nickName,
) {
  print('Nickname: $nickName');
  if (nickName == null ||
      nickName.trim().isEmpty ||
      nickName.trim().toLowerCase() == 'null') {
    return '$firstName $lastName';
  } else {
    return '$firstName $lastName ($nickName)';
  }
}

String employmentCalculator(String employmentDate) {
  DateTime now = DateTime.now();
  DateTime employment = DateTime.parse(employmentDate);

  int years = now.year - employment.year;
  int months = now.month - employment.month;
  int days = now.day - employment.day;

  if (months < 0 || (months == 0 && days < 0)) {
    years--;
    months += 12;
  }

  return '$years Years $months Months';
}

String? changeLeaveStatusPendingFunction(String? leaveStatus) {
  // If leaveStatus is  Waiting Approval , return Pending
  if (leaveStatus == 'Waiting Approval') {
    return 'Pending';
  } else if (leaveStatus == 'Denied') {
    return 'Rejected';
  }
  return leaveStatus;
}

String? changeLeaveStatusRejectedFunction(String? leaveStatus) {
  if (leaveStatus == 'Denied') {
    return 'Rejected';
  }
  return leaveStatus;
}

List<dynamic>? filterEntriesForThisWeek(List<dynamic>? data) {
  if (data == null) return null;

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String currentDateString = formatter.format(now);

  // Start of the week (e.g., Sunday)
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday));
  // End of the week (e.g., Saturday)
  DateTime endOfWeek = now.add(Duration(days: 7 - now.weekday));

  // Filter data
  List<dynamic> filteredEntries = data.where((entry) {
    if (entry is Map<String, dynamic> && entry.containsKey('timeEntry_Date')) {
      DateTime entryDate = DateTime.parse(entry['timeEntry_Date']);
      return entryDate.isAfter(startOfWeek) && entryDate.isBefore(endOfWeek);
    }
    return false;
  }).toList();

  return filteredEntries;
}

List<dynamic>? filterEntriesForLastWeek(List<dynamic>? data) {
  if (data == null) return null;

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String currentDateString = formatter.format(now);

  // Start of the previous week (e.g., the Sunday before the current week)
  DateTime startOfLastWeek = now.subtract(Duration(days: now.weekday + 7));
  // End of the previous week (e.g., the Saturday before the current week)
  DateTime endOfLastWeek = startOfLastWeek.add(Duration(days: 6));

  // Filter data
  List<dynamic> filteredEntries = data.where((entry) {
    if (entry is Map<String, dynamic> && entry.containsKey('timeEntry_Date')) {
      DateTime entryDate = DateTime.parse(entry['timeEntry_Date']);
      return entryDate.isAfter(startOfLastWeek) &&
          entryDate.isBefore(endOfLastWeek);
    }
    return false;
  }).toList();

  return filteredEntries;
}

int? getUserIDFunction(
  List<dynamic>? getcompany,
  String? userName,
) {
  if (getcompany == null || userName == null) {
    return null;
  }

  for (var company in getcompany) {
    if (company is Map<String, dynamic> && company['userName'] == userName) {
      return company['userId'];
    }
  }

  return null;
}

String? attachmentCountFunction(List<String>? attachmentList) {
  //  attachmentList calculate count
  if (attachmentList != null) {
    return attachmentList.length.toString();
  } else {
    return '0';
  }
}

String? changelatlongFormatFunction(String? latlng) {
  // change format 16.804683,96.210862
  if (latlng != null) {
    List<String> latlngList = latlng.split(',');
    if (latlngList.length == 2) {
      double latitude = double.tryParse(latlngList[0]) ?? 0.0;
      double longitude = double.tryParse(latlngList[1]) ?? 0.0;
      return '$latitude,$longitude';
    }
  }
  return null;
}

List<dynamic>? mergeModelTimeForShowIrregAndRegTodayView(
    List<dynamic>? getTimeEntriesByEmployeeIDAndTime) {
  if (getTimeEntriesByEmployeeIDAndTime == null ||
      getTimeEntriesByEmployeeIDAndTime.isEmpty) return [];

  final List<Map<String, dynamic>> mergedList = [];
  final DateTime today = DateTime.now();
  final String todayString = DateFormat('yyyy/MM/dd').format(today);

  // Define the correct date format
  final DateFormat format = DateFormat('yyyy/MM/dd HH:mm');

  void processEntries(List<dynamic> entries, String type) {
    for (var entry in entries) {
      if (entry == null) continue;

      final clockInTime = entry['clock_In_Time'];
      if (clockInTime != null && clockInTime.startsWith(todayString)) {
        try {
          final DateTime clockInDateTime = format.parse(clockInTime);

          // Check if clockInTime is today
          if (clockInDateTime.year == today.year &&
              clockInDateTime.month == today.month &&
              clockInDateTime.day == today.day) {
            mergedList.add({
              "clock_ID": entry['clock_ID'],
              "clock_In_Location": entry['clock_In_Location'],
              "clock_Out_Location": entry['clock_Out_Location'],
              "clock_In_Lattitude": entry['clock_In_Lattitude'],
              "clock_In_Longitude": entry['clock_In_Longitude'],
              "clock_Out_Lattitude": entry['clock_Out_Lattitude'],
              "clock_Out_Longitude": entry['clock_Out_Longitude'],
              "clock_In_Time": entry['clock_In_Time'],
              "clock_Out_Time": entry['clock_Out_Time'],
              "type": type,
            });
          }
        } catch (e) {
          debugPrint('Error parsing clock_In_Time: $clockInTime - $e');
        }
      }
    }
  }

  for (var entry in getTimeEntriesByEmployeeIDAndTime) {
    if (entry['regCinoutData'] != null) {
      processEntries(entry['regCinoutData'], "regular");
    }

    if (entry['irrRegCinoutData'] != null) {
      processEntries(entry['irrRegCinoutData'], "irregular");
    }
  }

  return mergedList;
}

String? changelatFormatFunction(String? latlng) {
  // change format 16.804683,96.210862
  if (latlng != null) {
    List<String> latlngList = latlng.split(',');
    if (latlngList.length == 2) {
      double latitude = double.tryParse(latlngList[0]) ?? 0.0;
      return '$latitude';
    }
  }
  return null;
}

String? changeLongitudeFormatFunction(String? latlng) {
  if (latlng != null) {
    List<String> latlngList = latlng.split(',');
    if (latlngList.length == 2) {
      double longitude = double.tryParse(latlngList[0]) ?? 0.0;
      return '$longitude';
    }
  }
  return null;
}

String? calculateOTHourFunction(
  String? startTime,
  String? endTime,
) {
  //   final DateFormat format = DateFormat('Hm');
  if (startTime == null || endTime == null) {
    return null;
  }

  final DateFormat format = DateFormat('Hm');
  final DateTime start = format.parse(startTime);
  final DateTime end = format.parse(endTime);

  final Duration duration = end.difference(start);
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);

  return '$hours hr $minutes min';
}

String? calculateCheckInOutTimeFunction(
  String? checkinTime,
  String? checkoutTime,
) {
  // checkinTime - checkoutTime , return hr min
  if (checkinTime == null || checkoutTime == null) {
    return null;
  }

  final DateFormat format = DateFormat('HH:mm');
  final DateTime checkin = format.parse(checkinTime);
  final DateTime checkout = format.parse(checkoutTime);

  final Duration difference = checkout.difference(checkin);

  final int hours = difference.inHours;
  final int minutes = difference.inMinutes.remainder(60);

  return '$hours hr $minutes min';
}

int? leaveAvailableDayFunction(
  List<dynamic>? leavtypeList,
  int? ddlLeaveID,
) {
  if (leavtypeList is List && ddlLeaveID != null) {
    for (final item in leavtypeList) {
      if (item is Map<String, dynamic> && item['timeOff_ID'] == ddlLeaveID) {
        final value = item['availablDays'];
        if (value is int) return value;
        if (value is double) return value.toInt(); // In case it's like 96.5
      }
    }
  }

  return null;
}

String? changeHHmmFormatFunction(String? apiDate) {
  // apiDate format yyyy-MM-dd HH:mm , return HH:mm format
  if (apiDate == null) {
    return null;
  }

  try {
    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm').parse(apiDate);
    return DateFormat('HH:mm').format(dateTime);
  } catch (e) {
    return null;
  }
}

int? leaveforYearCustomFunction() {
  // current year also return integer type not thai region 2567 need 2024 only
  return DateTime.now().year;
}

List<dynamic>? mergeModelTimeForShowIrregAndRegMonthView(
    List<dynamic>? getTimeEntriesByEmployeeIDAndTime) {
  if (getTimeEntriesByEmployeeIDAndTime == null) return [];

  final List<Map<String, dynamic>> mergedList = [];

  for (var entry in getTimeEntriesByEmployeeIDAndTime) {
    // Process regCinoutData as regular
    if (entry['regCinoutData'] != null && entry['regCinoutData'].isNotEmpty) {
      for (var regData in entry['regCinoutData']) {
        if (regData == null) continue; // Skip null entries
        mergedList.add({
          "clock_ID": regData['clock_ID'],
          "clock_In_Location": regData['clock_In_Location'],
          "clock_Out_Location": regData['clock_Out_Location'],
          "clock_In_Lattitude": regData['clock_In_Lattitude'],
          "clock_In_Longitude": regData['clock_In_Longitude'],
          "clock_Out_Lattitude": regData['clock_Out_Lattitude'],
          "clock_Out_Longitude": regData['clock_Out_Longitude'],
          "clock_In_Time": regData['clock_In_Time'],
          "clock_Out_Time": regData['clock_Out_Time'],
          "type": "regular",
        });
      }
    }

    // Process irregularRegCinoutData as irregular
    if (entry['irregularRegCinoutData'] != null &&
        entry['irregularRegCinoutData'].isNotEmpty) {
      for (var irregularData in entry['irregularRegCinoutData']) {
        if (irregularData == null ||
            irregularData['clock_In_Location'] == "<irregular_In_Location>")
          continue; // Skip null entries
        mergedList.add({
          "clock_ID": irregularData['clock_ID'],
          "clock_In_Location": irregularData['clock_In_Location'],
          "clock_Out_Location": irregularData['clock_Out_Location'],
          "clock_In_Lattitude": irregularData['clock_In_Lattitude'],
          "clock_In_Longitude": irregularData['clock_In_Longitude'],
          "clock_Out_Lattitude": irregularData['clock_Out_Lattitude'],
          "clock_Out_Longitude": irregularData['clock_Out_Longitude'],
          "clock_In_Time": irregularData['clock_In_Time'],
          "clock_Out_Time": irregularData['clock_Out_Time'],
          "type": "irregular",
        });
      }
    }
  }

  return mergedList;
}

List<dynamic>? filteredOvertimeStatusFunction(
  String selectedStatus,
  List<dynamic> allData,
  List<dynamic> overTimeHistoryJSON,
) {
  // Return an empty list if no valid status is selected
  if (selectedStatus.isEmpty || selectedStatus == 'None') {
    return [];
  }

  // Return all data if selectedStatus is "All"
  if (selectedStatus == 'All') {
    return allData;
  }

  // Filter allData based on the selected status
  return allData.where((item) {
    switch (selectedStatus) {
      case 'Approved':
        return item['status'] == 'Approved';
      case 'Rejected':
        return item['status'] ==
            'Denied'; // Assuming 'Denied' corresponds to "Rejected"
      case 'Canceled':
        return item['status'] == 'Canceled';
      default:
        return false; // No match for the selected status
    }
  }).toList();
}

List<dynamic> filteredYearMyaApprovalFunction(
  String? currentYear,
  List<String> yearMyApproval,
) {
  String currentYear = DateTime.now().year.toString();
  // return json formatA
  List<dynamic> filteredList =
      yearMyApproval.where((element) => element.contains(currentYear)).toList();
  return filteredList.map((e) => {'yearMyApproval': e}).toList();
}

AddressLatLngDataModelStruct? getCurrentLocationCustomFunction(
    LatLng? currentLocation) {
  if (currentLocation == null) {
    return null;
  }

  // Perform some logic to get the address and convert it to lat and lng
  double lat = currentLocation.latitude;
  double lng = currentLocation.longitude;

  return AddressLatLngDataModelStruct(latitude: lat, longitude: lng);
}

List<dynamic>? filteredMyapprovalforYearFunction(
    List<dynamic>? myApprovalList) {
  // filter current year
  if (myApprovalList == null) {
    return null;
  }

  int currentYear = DateTime.now().year;

  return myApprovalList.where((approval) {
    DateTime approvalDate = DateTime.parse(approval['date']);
    return approvalDate.year == currentYear;
  }).toList();
}

String? calculateRadiusFunction(String? saveLatLong) {
  // If radius is 500 with current latLong , please alert
  if (saveLatLong == null) {
    return null;
  }

  // Parse the saveLatLong string to get latitude and longitude
  List<String> latLongList = saveLatLong.split(',');
  double latitude = double.parse(latLongList[0]);
  double longitude = double.parse(latLongList[1]);

  // Calculate the distance from the current location to the center (0, 0)
  double distance = math.sqrt(latitude * latitude + longitude * longitude);

  // Check if the distance is within the radius of 500
  if (distance <= 500) {
    return 'Alert: Within 500m radius';
  } else {
    return null;
  }
}

String? localTimeToUTCtime(String? currentTime) {
  // currenttime to utc time ,Format (yyyy/MM/dd HH:mm)
  if (currentTime == null) {
    return null;
  }

  DateTime parsedTime = DateFormat('yyyy/MM/dd HH:mm').parse(currentTime);
  DateTime utcTime = parsedTime.toUtc();

  return DateFormat('yyyy/MM/dd HH:mm').format(utcTime);
}

String? changeTimeEntriesDateFormate(String? apiDate) {
  if (apiDate == null) return null;

  try {
    DateTime parsedDate = DateTime.parse(apiDate as String);

    // Format the parsed date into the desired format (EEE d MMM yyyy)
    DateFormat outputFormat = DateFormat('EEE d MMM yyyy');
    String formattedDate = outputFormat.format(parsedDate);

    return formattedDate;
  } catch (e) {
    debugPrint('Error parsing date: $apiDate');
    return null;
  }
}

dynamic filteredYearAndDatecustomFunction(
  dynamic overtimeallList,
  String? currentYear,
  String? currentMonth,
) {
  if (overtimeallList == null || currentYear == null || currentMonth == null) {
    return null;
  }

  try {
    int year = int.parse(currentYear);
    int month = int.parse(currentMonth.padLeft(2, '0')); // Ensures "02" format

    var filteredList = (overtimeallList['data'] as List).where((item) {
      DateTime requestedDate = DateTime.parse(item['oT_Requested_Date']);
      return requestedDate.year == year &&
          requestedDate.month == month &&
          item['status'] == "Approved"; // Filtering by "Approved" status
    }).toList();

    return jsonEncode(filteredList); // Returns filtered list as JSON string
  } catch (e) {
    return 'Error: ${e.toString()}';
  }
}

bool? overtimeCheckInOutFunction(List<dynamic>? overtimeApprovedlist) {
  if (overtimeApprovedlist == null || overtimeApprovedlist.isEmpty) {
    return false;
  }

  // Get current date and time with timezone adjustment
  final now = DateTime.now();
  final localNow =
      now.toUtc().add(Duration(seconds: now.timeZoneOffset.inSeconds));

  // Extract date and time components
  final currentDate = DateFormat('yyyy-MM-dd').format(localNow);
  final currentTime = DateFormat('HH:mm').format(localNow);

  // Check if any entry matches the condition
  bool hasValidOvertime = overtimeApprovedlist.any((entry) {
    if (entry is Map<String, dynamic>) {
      final startDate = entry['start_Date'] as String?;
      final startTime = entry['oT_Start_Time'] as String?;
      final endTime = entry['oT_End_Time'] as String?;

      if (startDate == null || startTime == null || endTime == null) {
        return false;
      }

      // Parse startDate into DateTime
      final startDateTime = DateTime.tryParse(startDate);
      if (startDateTime == null) {
        return false;
      }

      // Check if the date matches
      if (DateFormat('yyyy-MM-dd').format(startDateTime) != currentDate) {
        return false;
      }

      // Convert time strings to DateTime for comparison
      final startDateTimeParsed = DateFormat('HH:mm').parse(startTime);
      final endDateTimeParsed = DateFormat('HH:mm').parse(endTime);
      final currentDateTimeParsed = DateFormat('HH:mm').parse(currentTime);

      // Check if current time falls within start and end time
      return currentDateTimeParsed.isAfter(startDateTimeParsed) &&
          currentDateTimeParsed.isBefore(endDateTimeParsed);
    }
    return false;
  });

  return hasValidOvertime;
}

String? getDaysLeftFunction(String? getDaysLeft) {
  if (getDaysLeft == null || !getDaysLeft.contains('/')) {
    return null; // Return null if input is invalid
  }

  return getDaysLeft.split('/')[0]; // Extract and return the first number
}

int? getCompanyIDFunction(
  List<dynamic>? getcompany,
  String? companyCode,
) {
  // filter company by matching companyCode
  if (getcompany == null || companyCode == null) {
    return null;
  }

  for (var company in getcompany) {
    if (company['companyCode'] == companyCode) {
      return company['company_ID'] as int?;
    }
  }

  return null;
}

Color? clockOutColorFunction(
  String? clockOutTime,
  String? shiftEndTime,
) {
  try {
    final format = DateFormat('HH:mm');

    final clockOut = clockOutTime != null ? format.parse(clockOutTime) : null;
    final shiftEnd = shiftEndTime != null ? format.parse(shiftEndTime) : null;

    final isEarlyClockOut =
        clockOut != null && shiftEnd != null && clockOut.isBefore(shiftEnd);

    if (isEarlyClockOut) {
      return Colors.red;
    }

    return Colors.green;
  } catch (e) {
    return Colors.green;
  }
}

int? leaveBalanceDayFunction(
  List<dynamic>? leavtypeList,
  int? ddlLeaveID,
) {
  if (leavtypeList is List && ddlLeaveID != null) {
    for (final item in leavtypeList) {
      if (item is Map<String, dynamic> && item['timeOff_ID'] == ddlLeaveID) {
        final value = item['leaveDaysLeft'];
        if (value is String && value.contains('/')) {
          final parts = value.split('/');
          if (parts.length == 2) {
            final totalDays = int.tryParse(parts[1].trim());
            return totalDays;
          }
        }
      }
    }
  }

  return null;
}

String? checkInbyEmployeeIDFunction(
  String? getdayViewList,
  String? employeeID,
) {
  if (getdayViewList == null || employeeID == null) return '-';

  final parsedData = jsonDecode(getdayViewList);
  final parsedEmployeeID = int.tryParse(employeeID);
  if (parsedEmployeeID == null) return '-';

  final dataList = parsedData['data'] as List<dynamic>?;
  if (dataList == null) return '-';

  for (final employee in dataList) {
    if (employee['employee_ID'] == parsedEmployeeID) {
      final regCinoutData = employee['regCinoutData'] as List<dynamic>? ?? [];
      final irrRegCinoutData =
          employee['irrRegCinoutData'] as List<dynamic>? ?? [];

      if (regCinoutData.isEmpty && irrRegCinoutData.isEmpty) {
        return '-';
      }

      final allCinoutData = [...regCinoutData, ...irrRegCinoutData];

      for (final entry in allCinoutData) {
        final clockInTime = entry['clock_In_Time'];
        if (clockInTime != null && clockInTime != '-') {
          return clockInTime as String;
        }
      }

      return '-'; // No valid time found
    }
  }

  return '-';
}

bool? overtimeShowDataFunction(List<dynamic>? currentList) {
  // if (currentList is List && currentList.isNotEmpty) {
  //   return true;
  // }
  // return false;
  if (currentList != null && currentList.isNotEmpty) {
    return true;
  }
  return false;
}

String? getCurrentYear() {
  final now = DateTime.now();
  return now.year.toString(); // returns '2025'
}
