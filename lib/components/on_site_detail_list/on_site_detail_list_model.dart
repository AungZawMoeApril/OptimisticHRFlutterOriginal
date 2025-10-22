import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'on_site_detail_list_widget.dart' show OnSiteDetailListWidget;
import 'package:flutter/material.dart';

class OnSiteDetailListModel extends FlutterFlowModel<OnSiteDetailListWidget> {
  ///  Local state fields for this component.

  List<dynamic> checkInDetails = [];
  void addToCheckInDetails(dynamic item) => checkInDetails.add(item);
  void removeFromCheckInDetails(dynamic item) => checkInDetails.remove(item);
  void removeAtIndexFromCheckInDetails(int index) =>
      checkInDetails.removeAt(index);
  void insertAtIndexInCheckInDetails(int index, dynamic item) =>
      checkInDetails.insert(index, item);
  void updateCheckInDetailsAtIndex(int index, Function(dynamic) updateFn) =>
      checkInDetails[index] = updateFn(checkInDetails[index]);

  /// details
  bool detailsValie = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTimeAttendanceListMobile)] action in onSiteDetailList widget.
  ApiCallResponse? apiResultCheckInDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
