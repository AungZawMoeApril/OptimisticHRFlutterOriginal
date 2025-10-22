import '/components/confirm_pin_code_component/confirm_pin_code_component_widget.dart';
import '/components/wrong_pin_code_component/wrong_pin_code_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'confirm_pin_code_widget.dart' show ConfirmPinCodeWidget;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ConfirmPinCodeModel extends FlutterFlowModel<ConfirmPinCodeWidget> {
  ///  Local state fields for this page.

  List<String> confirmPinCodeList = [];
  void addToConfirmPinCodeList(String item) => confirmPinCodeList.add(item);
  void removeFromConfirmPinCodeList(String item) =>
      confirmPinCodeList.remove(item);
  void removeAtIndexFromConfirmPinCodeList(int index) =>
      confirmPinCodeList.removeAt(index);
  void insertAtIndexInConfirmPinCodeList(int index, String item) =>
      confirmPinCodeList.insert(index, item);
  void updateConfirmPinCodeListAtIndex(int index, Function(String) updateFn) =>
      confirmPinCodeList[index] = updateFn(confirmPinCodeList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future pinCodeCheckActionBlock(BuildContext context) async {
    if (confirmPinCodeList.length == 6) {
      if (functions.pinCodeCombineString(confirmPinCodeList.toList()) ==
          functions.pinCodeCombineString(widget!.pincCodeList?.toList())) {
        FFAppState().isGeneralFirstTime = true;
        FFAppState().mainPinCode =
            functions.pinCodeCombineString(confirmPinCodeList.toList())!;
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ConfirmPinCodeComponentWidget(),
                ),
              ),
            );
          },
        );
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: WrongPinCodeComponentWidget(),
                ),
              ),
            );
          },
        );

        confirmPinCodeList = [];
      }
    }
  }
}
