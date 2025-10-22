import '/backend/api_requests/api_calls.dart';
import '/components/card_time_attendance/card_time_attendance_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_attendance_model.dart';
export 'time_attendance_model.dart';

class TimeAttendanceWidget extends StatefulWidget {
  const TimeAttendanceWidget({super.key});

  static String routeName = 'TimeAttendance';
  static String routePath = '/timeAttendance';

  @override
  State<TimeAttendanceWidget> createState() => _TimeAttendanceWidgetState();
}

class _TimeAttendanceWidgetState extends State<TimeAttendanceWidget> {
  late TimeAttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeAttendanceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultCalendarList =
          await MainGroup.getTimeAttendanceListMobileCall.call(
        employeeID: FFAppState().employeeID,
        companyID: FFAppState().companyID,
        token: FFAppState().token,
      );

      if ((_model.apiResultCalendarList?.succeeded ?? true)) {
        FFAppState().CalendarList = MainGroup.getTimeAttendanceListMobileCall
            .timeAttendanceList(
              (_model.apiResultCalendarList?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        _model.calendarlist =
            FFAppState().CalendarList.toList().cast<dynamic>();
        safeSetState(() {});
      }
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.date_range,
              color: Color(0xFFF9B052),
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '3g2t5o4h' /* Time Attendance */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(TimeAttendanceListWidget.routeName);
                },
                child: Icon(
                  Icons.article_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF2E3),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 400.0,
                          child: custom_widgets.CustomCalendarWidget(
                            width: double.infinity,
                            height: 400.0,
                            calendarList: FFAppState().CalendarList,
                            onSelectedDate: (selectedDateTime) async {
                              _model.testijson =
                                  selectedDateTime!.toList().cast<dynamic>();
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 15.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions.changeTimeEntriesDateFormate(
                            FFAppState().selectedDate),
                        '18 Feb 2025',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFF9B052),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final selectedshow = _model.testijson.toList();

                      return RefreshIndicator(
                        onRefresh: () async {},
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: selectedshow.length,
                          itemBuilder: (context, selectedshowIndex) {
                            final selectedshowItem =
                                selectedshow[selectedshowIndex];
                            return CardTimeAttendanceWidget(
                              key: Key(
                                  'Keyhlx_${selectedshowIndex}_of_${selectedshow.length}'),
                              location: getJsonField(
                                selectedshowItem,
                                r'''$.clock_In_Location''',
                              ),
                              checkIn: getJsonField(
                                selectedshowItem,
                                r'''$.clock_In_Time''',
                              ),
                              checkOut: getJsonField(
                                selectedshowItem,
                                r'''$.clock_Out_Time''',
                              ),
                              checkInAndOuttype: getJsonField(
                                selectedshowItem,
                                r'''$.remark''',
                              ),
                              checkInStatus: getJsonField(
                                selectedshowItem,
                                r'''$.checkIn_Status''',
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
