import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_approval_widget.dart' show MyApprovalWidget;
import 'package:flutter/material.dart';

class MyApprovalModel extends FlutterFlowModel<MyApprovalWidget> {
  ///  Local state fields for this page.

  bool isCancel = false;

  String historyDescription = 'description';

  String taskType = 'Time Off';

  int leavePendingCount = 0;

  int overtimePendingCount = 0;

  List<String> yearMyApproval = [];
  void addToYearMyApproval(String item) => yearMyApproval.add(item);
  void removeFromYearMyApproval(String item) => yearMyApproval.remove(item);
  void removeAtIndexFromYearMyApproval(int index) =>
      yearMyApproval.removeAt(index);
  void insertAtIndexInYearMyApproval(int index, String item) =>
      yearMyApproval.insert(index, item);
  void updateYearMyApprovalAtIndex(int index, Function(String) updateFn) =>
      yearMyApproval[index] = updateFn(yearMyApproval[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetOTandTimeOffMobile)] action in MyApproval widget.
  ApiCallResponse? apiResultGetOTandTimeOffMobile;
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
