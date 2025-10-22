import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  String checkInTime = '-';

  String checkOutTime = '-';

  bool? timeOffWholeDay;

  List<dynamic> announcementListView = [];
  void addToAnnouncementListView(dynamic item) =>
      announcementListView.add(item);
  void removeFromAnnouncementListView(dynamic item) =>
      announcementListView.remove(item);
  void removeAtIndexFromAnnouncementListView(int index) =>
      announcementListView.removeAt(index);
  void insertAtIndexInAnnouncementListView(int index, dynamic item) =>
      announcementListView.insert(index, item);
  void updateAnnouncementListViewAtIndex(
          int index, Function(dynamic) updateFn) =>
      announcementListView[index] = updateFn(announcementListView[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetPersonalInfo)] action in Home widget.
  ApiCallResponse? apiGetPersonalInfoResult;
  // Stores action output result for [Backend Call - API (GetDayViewOfSTA)] action in Home widget.
  ApiCallResponse? apiResultGetDayViewOfSTA;
  // Stores action output result for [Backend Call - API (GetDayViewOfSTA)] action in Home widget.
  ApiCallResponse? apiResultGetDayView;
  // Stores action output result for [Backend Call - API (apiLatestNotification POST)] action in Home widget.
  ApiCallResponse? apiResultgetLastestNoti;
  // Stores action output result for [Backend Call - API (GetCustomerWeb)] action in Home widget.
  ApiCallResponse? apiResultAnnouncement;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
