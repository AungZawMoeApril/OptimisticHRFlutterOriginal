import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_staff_widget.dart' show ContactStaffWidget;
import 'package:flutter/material.dart';

class ContactStaffModel extends FlutterFlowModel<ContactStaffWidget> {
  ///  Local state fields for this page.

  List<dynamic> searchQuery = [];
  void addToSearchQuery(dynamic item) => searchQuery.add(item);
  void removeFromSearchQuery(dynamic item) => searchQuery.remove(item);
  void removeAtIndexFromSearchQuery(int index) => searchQuery.removeAt(index);
  void insertAtIndexInSearchQuery(int index, dynamic item) =>
      searchQuery.insert(index, item);
  void updateSearchQueryAtIndex(int index, Function(dynamic) updateFn) =>
      searchQuery[index] = updateFn(searchQuery[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetPersonalInfoByCompanyID)] action in ContactStaff widget.
  ApiCallResponse? apiResultOutputList;
  // State field(s) for SearchContactStaff widget.
  FocusNode? searchContactStaffFocusNode;
  TextEditingController? searchContactStaffTextController;
  String? Function(BuildContext, String?)?
      searchContactStaffTextControllerValidator;
  // Stores action output result for [Custom Action - contactstaffSearch] action in SearchContactStaff widget.
  List<dynamic>? searchOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchContactStaffFocusNode?.dispose();
    searchContactStaffTextController?.dispose();
  }
}
