import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_approval_attachment_model_model.dart';
export 'my_approval_attachment_model_model.dart';

class MyApprovalAttachmentModelWidget extends StatefulWidget {
  const MyApprovalAttachmentModelWidget({
    super.key,
    required this.attachment,
  });

  final String? attachment;

  @override
  State<MyApprovalAttachmentModelWidget> createState() =>
      _MyApprovalAttachmentModelWidgetState();
}

class _MyApprovalAttachmentModelWidgetState
    extends State<MyApprovalAttachmentModelWidget> {
  late MyApprovalAttachmentModelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyApprovalAttachmentModelModel());

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
      width: 270.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '6tsi0rnf' /* Attachments */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.readexPro(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).themeColor,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 220.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: Text('Alert'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      widget.attachment!,
                                      width: double.infinity,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'jogofo94' /* Close */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).themeColor,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
