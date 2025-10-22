import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PinCodeModel extends FlutterFlowModel<PinCodeWidget> {
  ///  Local state fields for this page.

  List<String> pinCodeList = [];
  void addToPinCodeList(String item) => pinCodeList.add(item);
  void removeFromPinCodeList(String item) => pinCodeList.remove(item);
  void removeAtIndexFromPinCodeList(int index) => pinCodeList.removeAt(index);
  void insertAtIndexInPinCodeList(int index, String item) =>
      pinCodeList.insert(index, item);
  void updatePinCodeListAtIndex(int index, Function(String) updateFn) =>
      pinCodeList[index] = updateFn(pinCodeList[index]);

  String mainPinCode = 'mainPinCode';

  ///  State fields for stateful widgets in this page.

  bool biometricResult = false;
  // Stores action output result for [Backend Call - API (GetPersonalInfo)] action in PinCode widget.
  ApiCallResponse? apiResultGetPersonalInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future pinCodeCheckActionBlock(BuildContext context) async {
    if (pinCodeList.length == 6) {
      mainPinCode = FFAppState().mainPinCode;
      if (FFAppState().resetPinCodeFlag) {
        FFAppState().resetPinCodeFlag = false;
        FFAppState().deleteMainPinCode();
        FFAppState().mainPinCode = '';
      }
      if (FFAppState().mainPinCode != '') {
        if (functions.pinCodeCombineString(pinCodeList.toList()) ==
            FFAppState().mainPinCode) {
          if (FFAppState().isGeneralFirstTime) {
            context.pushNamed(HomeWidget.routeName);
          } else {
            context.pushNamed(
              ConfirmPinCodeWidget.routeName,
              queryParameters: {
                'pincCodeList': serializeParam(
                  pinCodeList,
                  ParamType.String,
                  isList: true,
                ),
              }.withoutNulls,
            );
          }

          FFAppState().isPinCodeFlag = true;
        } else {
          pinCodeList = [];
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: Text('Alert'),
                  content: Text('PinCode is not same !'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
        }
      } else {
        if (functions.pinCodeCombineString(pinCodeList.toList()) ==
            mainPinCode) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: Text('Error'),
                  content: Text('Your new Pincode is same with old Pincode!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          pinCodeList = [];
        } else {
          context.pushNamed(
            ConfirmPinCodeWidget.routeName,
            queryParameters: {
              'pincCodeList': serializeParam(
                pinCodeList,
                ParamType.String,
                isList: true,
              ),
            }.withoutNulls,
          );

          FFAppState().isPinCodeFlag = true;
          pinCodeList = [];
        }
      }
    }
  }
}
