import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'leave_request_edit_main_widget.dart' show LeaveRequestEditMainWidget;
import 'package:flutter/material.dart';

class LeaveRequestEditMainModel
    extends FlutterFlowModel<LeaveRequestEditMainWidget> {
  ///  Local state fields for this page.

  bool isAllDay = true;

  List<String> attachmentModel = [];
  void addToAttachmentModel(String item) => attachmentModel.add(item);
  void removeFromAttachmentModel(String item) => attachmentModel.remove(item);
  void removeAtIndexFromAttachmentModel(int index) =>
      attachmentModel.removeAt(index);
  void insertAtIndexInAttachmentModel(int index, String item) =>
      attachmentModel.insert(index, item);
  void updateAttachmentModelAtIndex(int index, Function(String) updateFn) =>
      attachmentModel[index] = updateFn(attachmentModel[index]);

  List<BalanceDaysStruct> remainingDays = [];
  void addToRemainingDays(BalanceDaysStruct item) => remainingDays.add(item);
  void removeFromRemainingDays(BalanceDaysStruct item) =>
      remainingDays.remove(item);
  void removeAtIndexFromRemainingDays(int index) =>
      remainingDays.removeAt(index);
  void insertAtIndexInRemainingDays(int index, BalanceDaysStruct item) =>
      remainingDays.insert(index, item);
  void updateRemainingDaysAtIndex(
          int index, Function(BalanceDaysStruct) updateFn) =>
      remainingDays[index] = updateFn(remainingDays[index]);

  int? balance;

  int? availableDay = 0;

  String? startDate;

  String? endDate;

  String? startDateHalfDay;

  String? startTime;

  String? endTime;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetLeaveWithRemainingDays)] action in LeaveRequestEditMain widget.
  ApiCallResponse? apiResultRemainingDays;
  // State field(s) for ddlLeaveType widget.
  int? ddlLeaveTypeValue;
  FormFieldController<int>? ddlLeaveTypeValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  // State field(s) for txtDescription widget.
  FocusNode? txtDescriptionFocusNode;
  TextEditingController? txtDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtDescriptionTextControllerValidator;
  bool isDataUploading_uploadDataleaveRequest = false;
  FFUploadedFile uploadedLocalFile_uploadDataleaveRequest =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (GetCheckInImageURL)] action in Column widget.
  ApiCallResponse? apiResultGetCheckinImageURL;
  // Stores action output result for [Backend Call - API (UpdateLeaveRequest)] action in Button widget.
  ApiCallResponse? apiResultUpdateLeaveRequest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtDescriptionFocusNode?.dispose();
    txtDescriptionTextController?.dispose();
  }
}
