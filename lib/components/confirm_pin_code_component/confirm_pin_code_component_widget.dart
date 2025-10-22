import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirm_pin_code_component_model.dart';
export 'confirm_pin_code_component_model.dart';

class ConfirmPinCodeComponentWidget extends StatefulWidget {
  const ConfirmPinCodeComponentWidget({super.key});

  @override
  State<ConfirmPinCodeComponentWidget> createState() =>
      _ConfirmPinCodeComponentWidgetState();
}

class _ConfirmPinCodeComponentWidgetState
    extends State<ConfirmPinCodeComponentWidget> {
  late ConfirmPinCodeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmPinCodeComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 180.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'yrotnb4l' /* Set a PIN code */,
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.readexPro(
                    fontWeight: FontWeight.w600,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'qc0p32j2' /* A new PIN code has been set. */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(HomeWidget.routeName);
                  },
                  text: FFLocalizations.of(context).getText(
                    'i9vhkc8t' /* AGREE */,
                  ),
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).themeColor,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
