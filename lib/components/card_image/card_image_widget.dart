import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'card_image_model.dart';
export 'card_image_model.dart';

class CardImageWidget extends StatefulWidget {
  const CardImageWidget({
    super.key,
    required this.imageByte,
  });

  final String? imageByte;

  @override
  State<CardImageWidget> createState() => _CardImageWidgetState();
}

class _CardImageWidgetState extends State<CardImageWidget> {
  late CardImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardImageModel());

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
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Stack(
        children: [
          Image.network(
            widget.imageByte!,
            width: double.infinity,
            height: 400.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.02, -1.05),
            child: FlutterFlowIconButton(
              buttonSize: 48.0,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                FFAppState().showPopUpImage = false;
                _model.updatePage(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
