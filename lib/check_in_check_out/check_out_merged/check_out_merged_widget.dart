import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'check_out_merged_model.dart';
export 'check_out_merged_model.dart';

class CheckOutMergedWidget extends StatefulWidget {
  const CheckOutMergedWidget({
    super.key,
    this.timeType,
    required this.checkInData,
  });

  final String? timeType;
  final dynamic checkInData;

  static String routeName = 'CheckOutMerged';
  static String routePath = '/checkOutMerged';

  @override
  State<CheckOutMergedWidget> createState() => _CheckOutMergedWidgetState();
}

class _CheckOutMergedWidgetState extends State<CheckOutMergedWidget> {
  late CheckOutMergedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckOutMergedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await Future.wait([
        Future(() async {
          _model.apiResultLocation =
              await MainGroup.getAllLocationsByCompanyIDCall.call(
            companyID: FFAppState().companyID,
            token: FFAppState().token,
          );

          if ((_model.apiResultLocation?.succeeded ?? true)) {
            if ('true' ==
                getJsonField(
                  (_model.apiResultLocation?.jsonBody ?? ''),
                  r'''$.activeStatus''',
                ).toString().toString()) {
              _model.radius = MainGroup.getAllLocationsByCompanyIDCall.radius(
                (_model.apiResultLocation?.jsonBody ?? ''),
              );
              _model.worklocationName =
                  MainGroup.getAllLocationsByCompanyIDCall.worklocationName(
                (_model.apiResultLocation?.jsonBody ?? ''),
              );
              _model.statusAllLocation =
                  MainGroup.getAllLocationsByCompanyIDCall.activeStaus(
                (_model.apiResultLocation?.jsonBody ?? ''),
              );
              safeSetState(() {});
              _model.currentLocationLatLng = functions
                  .getCurrentLocationCustomFunction(currentUserLocationValue);
              safeSetState(() {});
              _model.apiGetAddressCheckOut = await ApiGetAddressCall.call(
                originalValue:
                    '${'${_model.currentLocationLatLng?.latitude.toString()},${_model.currentLocationLatLng?.longitude.toString()}'}',
                userId: ' 501afb52-6d63-481f-4cba-08dcd9195c86',
                companyId: 'bda0f20e-0784-4f90-3701-08dccbc8d8e9',
              );

              if ((_model.apiGetAddressCheckOut?.succeeded ?? true)) {
                _model.checkOutAddress = ApiGetAddressCall.location(
                  (_model.apiGetAddressCheckOut?.jsonBody ?? ''),
                );
                safeSetState(() {});
              }
            }
          }
        }),
        Future(() async {
          _model.currentLocationLatLng = functions
              .getCurrentLocationCustomFunction(currentUserLocationValue);
          _model.statusAllLocation = true;
          safeSetState(() {});
          _model.apiGetAddressResult = await ApiGetAddressCall.call(
            originalValue:
                '${'${_model.currentLocationLatLng?.latitude.toString()},${_model.currentLocationLatLng?.longitude.toString()}'}',
            userId: ' 501afb52-6d63-481f-4cba-08dcd9195c86',
            companyId: 'bda0f20e-0784-4f90-3701-08dccbc8d8e9',
          );

          if ((_model.apiGetAddressResult?.succeeded ?? true)) {
            _model.checkOutAddress = ApiGetAddressCall.location(
              (_model.apiGetAddressResult?.jsonBody ?? ''),
            );
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiGetDefaultSettingResult =
              await MainGroup.getDefaultSettingCall.call(
            companyID: FFAppState().companyID,
            token: FFAppState().token,
          );

          if ((_model.apiGetDefaultSettingResult?.succeeded ?? true)) {
            _model.checkOutLocationStatus =
                MainGroup.getDefaultSettingCall.checkOutLocation(
              (_model.apiGetDefaultSettingResult?.jsonBody ?? ''),
            );
            _model.checkOutradius = MainGroup.getDefaultSettingCall
                .distanceCheckInLocation(
                  (_model.apiGetDefaultSettingResult?.jsonBody ?? ''),
                )
                ?.toDouble();
            safeSetState(() {});
            if (_model.checkOutLocationStatus == 0) {
              _model.checkoutstatus = false;
              safeSetState(() {});
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      title: Text('Alert'),
                      content: Text(_model.checkoutstatus!.toString()),
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
            } else {
              _model.checkoutstatus = true;
              safeSetState(() {});
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      title: Text('Alert'),
                      content: Text(_model.checkoutstatus!.toString()),
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
          }
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: MainGroup.getDayViewOfSTACall.call(
        token: FFAppState().token,
        companyID: FFAppState().companyID,
        employeeID: FFAppState().employeeID,
        todayDate: functions.dateFormatToDay(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).themeColor,
                  ),
                ),
              ),
            ),
          );
        }
        final checkOutMergedGetDayViewOfSTAResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'ylxkb5wv' /* Check - Out */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.272,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.272,
                                  child: custom_widgets.CustomMapTap(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.272,
                                    distanceThreshold:
                                        _model.checkOutradius?.toString(),
                                    addresstimeInterval: 1,
                                    checkinpinstatus: _model.checkoutstatus,
                                    onMarkerMoved: (moveMarker) async {
                                      _model.checkOutAddress = null;
                                      safeSetState(() {});
                                      _model.currentLocationLatLngCheckOut =
                                          functions
                                              .getCurrentLocationCustomFunction(
                                                  moveMarker);
                                      _model.statusAllLocation = MainGroup
                                          .getAllLocationsByCompanyIDCall
                                          .activeStaus(
                                        (_model.apiResultLocation?.jsonBody ??
                                            ''),
                                      );
                                      safeSetState(() {});
                                      await _model.getaddress(context);
                                      safeSetState(() {});
                                    },
                                    onInitialPositionSet:
                                        (initialLocation) async {
                                      _model.currentLocationLatLng = functions
                                          .getCurrentLocationCustomFunction(
                                              initialLocation);
                                      _model.lastKnowLocation = functions
                                          .getCurrentLocationCustomFunction(
                                              initialLocation);
                                      safeSetState(() {});
                                      await _model.getaddress(context);
                                      safeSetState(() {});
                                    },
                                    locstatus: (distancestatus) async {
                                      _model.statusAllLocation = distancestatus;
                                      safeSetState(() {});
                                      await _model.getaddress(context);
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.65,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '13hqplrb' /* Work Location */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.checkOutAddress,
                                                        'searching....',
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 2.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ].addToStart(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Divider(
                                        height: 0.0,
                                        thickness: 1.0,
                                        indent: 10.0,
                                        endIndent: 10.0,
                                        color: FlutterFlowTheme.of(context)
                                            .themeColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .themeColor,
                                                      size: 24.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.checkOutAddress,
                                                        'searching....',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 3,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 3.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 370.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '2zw9z0p9' /* Check In   : */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .themeColor,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .clockInTime,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          MainGroup
                                                              .getDayViewOfSTACall
                                                              .checkInImage(
                                                                checkOutMergedGetDayViewOfSTAResponse
                                                                    .jsonBody,
                                                              )!
                                                              .lastOrNull!,
                                                          width: 60.0,
                                                          height: 60.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .themeColor,
                                                                    size: 24.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .checkOutAddress,
                                                                      'searching....',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 3,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                          lineHeight:
                                                                              3.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataCheckOutImage =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading_uploadDataCheckOutImage =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataCheckOutImage =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                _model.apiResultCheckOutImage =
                                                                    await GetCheckInImageURLCall
                                                                        .call(
                                                                  file: _model
                                                                      .uploadedLocalFile_uploadDataCheckOutImage,
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: _model
                                                                          .isDataUploading_uploadDataCheckOutImage
                                                                      ? double
                                                                          .infinity
                                                                      : 100.0,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .camera_alt,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f9afhcmq' /* Take a photo* */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if ((_model
                                                                      .uploadedLocalFile_uploadDataCheckOutImage
                                                                      .bytes
                                                                      ?.isNotEmpty ??
                                                                  false))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                          .showPopUpImage =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .memory(
                                                                    _model.uploadedLocalFile_uploadDataCheckOutImage
                                                                            .bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bkCheckin,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          width: 0.0,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                "MMMMEEEEd",
                                                                getCurrentTimestamp,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      50.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
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
                                        ].addToStart(SizedBox(width: 0.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResultGetDayViewOfSTA =
                              await MainGroup.getDayViewOfSTACall.call(
                            token: FFAppState().token,
                            companyID: FFAppState().companyID,
                            employeeID: FFAppState().employeeID,
                            todayDate: functions.dateFormatToDay(),
                          );

                          if (FFAppState().timeType == 'Regular') {
                            FFAppState().clockOutTime = dateTimeFormat(
                              "Hm",
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            );
                            FFAppState().clockOutLocation =
                                MainGroup.getDayViewOfSTACall
                                    .clockOutLocation(
                                      checkOutMergedGetDayViewOfSTAResponse
                                          .jsonBody,
                                    )!
                                    .lastOrNull!;
                            FFAppState().clockOutLattitude =
                                MainGroup.getDayViewOfSTACall
                                    .clockOutLattitude(
                                      checkOutMergedGetDayViewOfSTAResponse
                                          .jsonBody,
                                    )!
                                    .lastOrNull!;
                            FFAppState().clockOutLongitude =
                                MainGroup.getDayViewOfSTACall
                                    .clockOutLongitude(
                                      checkOutMergedGetDayViewOfSTAResponse
                                          .jsonBody,
                                    )!
                                    .firstOrNull!;
                            safeSetState(() {});
                            _model.apiResultUpdateClockInOut =
                                await MainGroup.updateClockInOutCall.call(
                              clockID: MainGroup.getDayViewOfSTACall
                                  .clockID(
                                    (_model.apiResultGetDayViewOfSTA
                                            ?.jsonBody ??
                                        ''),
                                  )
                                  ?.lastOrNull,
                              timeID: 0,
                              clockInTime: MainGroup.getDayViewOfSTACall
                                          .regclockInTime(
                                            (_model.apiResultGetDayViewOfSTA
                                                    ?.jsonBody ??
                                                ''),
                                          )
                                          ?.lastOrNull ==
                                      '-'
                                  ? MainGroup.getDayViewOfSTACall
                                      .irregularClockInTime(
                                        (_model.apiResultGetDayViewOfSTA
                                                ?.jsonBody ??
                                            ''),
                                      )
                                      ?.lastOrNull
                                  : MainGroup.getDayViewOfSTACall
                                      .regclockInTime(
                                        (_model.apiResultGetDayViewOfSTA
                                                ?.jsonBody ??
                                            ''),
                                      )
                                      ?.lastOrNull,
                              clockInLocation: FFAppState().clockInLocation,
                              clockInLattitude: FFAppState().clockInLattitude,
                              clockInLongitude: FFAppState().clockInLongitude,
                              clockOutTime:
                                  functions.localTimeToUTCtime(dateTimeFormat(
                                "yyyy/MM/dd HH:mm",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )),
                              clockOutLocation: _model.checkOutAddress,
                              clockOutLattitude: _model
                                  .currentLocationLatLng?.latitude
                                  .toString(),
                              clockOutLongitude: _model
                                  .currentLocationLatLng?.longitude
                                  .toString(),
                              timeType: 'Regular',
                              approve: FFAppState().approve,
                              userID: FFAppState().userID,
                              shiftStartTime: FFAppState().shiftStartTIme,
                              shiftEndTime: FFAppState().shiftEndTime,
                              companyIDMain: FFAppState().companyID,
                              employeeIDMain: FFAppState().employeeID,
                              todayDateMain: functions.dateFormatToDay(),
                              token: FFAppState().token,
                              checkOutImage: GetCheckInImageURLCall.imgURL(
                                (_model.apiResultCheckOutImage?.jsonBody ?? ''),
                              ).toString(),
                              timeEntryDate: dateTimeFormat(
                                "yyyy-MM-ddTHH:mm:ss.SSSZ",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            );

                            if (MainGroup.updateClockInOutCall.status(
                                  (_model.apiResultUpdateClockInOut?.jsonBody ??
                                      ''),
                                ) ==
                                0) {
                              FFAppState().clockOutTime = dateTimeFormat(
                                "Hm",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              );
                              safeSetState(() {});
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Alert'),
                                      content:
                                          Text('Checked Out Successfully !'),
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

                              context.pushNamed(HomeWidget.routeName);

                              FFAppState().checkInOutshowStatus = true;
                              FFAppState().deleteCheckInStatusOnSite();
                              FFAppState().checkInStatusOnSite = 0;

                              safeSetState(() {});
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Error !'),
                                      content: Text(MainGroup
                                          .updateClockInOutCall
                                          .message(
                                        (_model.apiResultUpdateClockInOut
                                                ?.jsonBody ??
                                            ''),
                                      )!),
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
                            }
                          } else {
                            FFAppState().otClockOutTime = dateTimeFormat(
                              "Hm",
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            );
                            FFAppState().otClockOutLocation =
                                MainGroup.getDayViewOfSTACall
                                    .otClockOutLocation(
                                      checkOutMergedGetDayViewOfSTAResponse
                                          .jsonBody,
                                    )!
                                    .lastOrNull!;
                            FFAppState().otClockOutLattitude =
                                MainGroup.getDayViewOfSTACall
                                    .otClockOutLattitude(
                                      checkOutMergedGetDayViewOfSTAResponse
                                          .jsonBody,
                                    )!
                                    .lastOrNull!;
                            safeSetState(() {});
                            _model.apiResultUpdateOTClockInOut =
                                await MainGroup.updateClockInOutCall.call(
                              clockID: MainGroup.getDayViewOfSTACall
                                  .oTClockID(
                                    (_model.apiResultGetDayViewOfSTA
                                            ?.jsonBody ??
                                        ''),
                                  )
                                  ?.lastOrNull,
                              timeID: FFAppState().timeID,
                              clockInTime: FFAppState().otClockInTime,
                              clockInLocation: FFAppState().otClockInLocation,
                              clockInLattitude: FFAppState().otClockInLattitude,
                              clockInLongitude: FFAppState().otClockInLongitude,
                              clockOutTime: dateTimeFormat(
                                "yyyy/MM/dd HH:mm",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              clockOutLocation: _model.checkOutAddress,
                              clockOutLattitude: _model
                                  .currentLocationLatLng?.latitude
                                  .toString(),
                              clockOutLongitude: _model
                                  .currentLocationLatLng?.longitude
                                  .toString(),
                              timeType: 'Overtime',
                              approve: FFAppState().approve,
                              userID: FFAppState().userID,
                              shiftStartTime: FFAppState().shiftStartTIme,
                              shiftEndTime: FFAppState().shiftEndTime,
                              companyIDMain: FFAppState().companyID,
                              employeeIDMain: FFAppState().employeeID,
                              todayDateMain: functions.dateFormatToDay(),
                              token: FFAppState().token,
                              checkOutImage: GetCheckInImageURLCall.imgURL(
                                (_model.apiResultCheckOutImage?.jsonBody ?? ''),
                              ).toString(),
                            );

                            if ((_model
                                    .apiResultUpdateOTClockInOut?.succeeded ??
                                true)) {
                              FFAppState().otClockOutTime = dateTimeFormat(
                                "Hm",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              );
                              safeSetState(() {});
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Alert'),
                                      content:
                                          Text('Checked Out Successfully !'),
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

                              context.pushNamed(OvertimeWidget.routeName);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Error !'),
                                      content: Text(MainGroup
                                          .updateClockInOutCall
                                          .message(
                                        (_model.apiResultUpdateOTClockInOut
                                                ?.jsonBody ??
                                            ''),
                                      )!),
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
                            }
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '9kjo3fsx' /* Check Out */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).themeColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
