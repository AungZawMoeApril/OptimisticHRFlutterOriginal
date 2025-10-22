import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'time_attendance_widget.dart' show TimeAttendanceWidget;
import 'package:flutter/material.dart';

class TimeAttendanceModel extends FlutterFlowModel<TimeAttendanceWidget> {
  ///  Local state fields for this page.

  List<dynamic> calendarlist = [];
  void addToCalendarlist(dynamic item) => calendarlist.add(item);
  void removeFromCalendarlist(dynamic item) => calendarlist.remove(item);
  void removeAtIndexFromCalendarlist(int index) => calendarlist.removeAt(index);
  void insertAtIndexInCalendarlist(int index, dynamic item) =>
      calendarlist.insert(index, item);
  void updateCalendarlistAtIndex(int index, Function(dynamic) updateFn) =>
      calendarlist[index] = updateFn(calendarlist[index]);

  List<dynamic> testijson = [];
  void addToTestijson(dynamic item) => testijson.add(item);
  void removeFromTestijson(dynamic item) => testijson.remove(item);
  void removeAtIndexFromTestijson(int index) => testijson.removeAt(index);
  void insertAtIndexInTestijson(int index, dynamic item) =>
      testijson.insert(index, item);
  void updateTestijsonAtIndex(int index, Function(dynamic) updateFn) =>
      testijson[index] = updateFn(testijson[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetTimeAttendanceListMobile)] action in TimeAttendance widget.
  ApiCallResponse? apiResultCalendarList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
