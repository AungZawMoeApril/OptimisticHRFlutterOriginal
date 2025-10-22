import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_attendance_list_widget.dart' show TimeAttendanceListWidget;
import 'package:flutter/material.dart';

class TimeAttendanceListModel
    extends FlutterFlowModel<TimeAttendanceListWidget> {
  ///  Local state fields for this page.

  List<dynamic> monthViewTimeAttendance = [];
  void addToMonthViewTimeAttendance(dynamic item) =>
      monthViewTimeAttendance.add(item);
  void removeFromMonthViewTimeAttendance(dynamic item) =>
      monthViewTimeAttendance.remove(item);
  void removeAtIndexFromMonthViewTimeAttendance(int index) =>
      monthViewTimeAttendance.removeAt(index);
  void insertAtIndexInMonthViewTimeAttendance(int index, dynamic item) =>
      monthViewTimeAttendance.insert(index, item);
  void updateMonthViewTimeAttendanceAtIndex(
          int index, Function(dynamic) updateFn) =>
      monthViewTimeAttendance[index] = updateFn(monthViewTimeAttendance[index]);

  List<dynamic> getthisweekViewTimeAttendance = [];
  void addToGetthisweekViewTimeAttendance(dynamic item) =>
      getthisweekViewTimeAttendance.add(item);
  void removeFromGetthisweekViewTimeAttendance(dynamic item) =>
      getthisweekViewTimeAttendance.remove(item);
  void removeAtIndexFromGetthisweekViewTimeAttendance(int index) =>
      getthisweekViewTimeAttendance.removeAt(index);
  void insertAtIndexInGetthisweekViewTimeAttendance(int index, dynamic item) =>
      getthisweekViewTimeAttendance.insert(index, item);
  void updateGetthisweekViewTimeAttendanceAtIndex(
          int index, Function(dynamic) updateFn) =>
      getthisweekViewTimeAttendance[index] =
          updateFn(getthisweekViewTimeAttendance[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetTimeAttendanceListMobile)] action in TimeAttendanceList widget.
  ApiCallResponse? apiResultCalendarMonthList;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
