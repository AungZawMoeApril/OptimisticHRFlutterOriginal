import '/backend/api_requests/api_calls.dart';
import '/components/card_time_attendance/card_time_attendance_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_attendance_list_model.dart';
export 'time_attendance_list_model.dart';

class TimeAttendanceListWidget extends StatefulWidget {
  const TimeAttendanceListWidget({super.key});

  static String routeName = 'TimeAttendanceList';
  static String routePath = '/timeAttendanceList';

  @override
  State<TimeAttendanceListWidget> createState() =>
      _TimeAttendanceListWidgetState();
}

class _TimeAttendanceListWidgetState extends State<TimeAttendanceListWidget>
    with TickerProviderStateMixin {
  late TimeAttendanceListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeAttendanceListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultCalendarMonthList =
          await MainGroup.getTimeAttendanceListMobileCall.call(
        employeeID: FFAppState().employeeID,
        companyID: FFAppState().companyID,
        token: FFAppState().token,
      );

      if ((_model.apiResultCalendarMonthList?.succeeded ?? true)) {
        _model.monthViewTimeAttendance =
            MainGroup.getTimeAttendanceListMobileCall
                .timeAttendanceList(
                  (_model.apiResultCalendarMonthList?.jsonBody ?? ''),
                )!
                .toList()
                .cast<dynamic>();
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
      future: MainGroup.getTimeAttendanceListMobileCall.call(
        employeeID: FFAppState().employeeID,
        companyID: FFAppState().companyID,
        todayDateMain: FFAppState().token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEDEDED),
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
        final timeAttendanceListGetTimeAttendanceListMobileResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFEDEDED),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.date_range,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'pc4ucrdt' /* Time Attendance */,
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
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                  child: Icon(
                    Icons.article_outlined,
                    color: Color(0xFFF9B052),
                    size: 30.0,
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                labelColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: Color(0xFFF9B052),
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedBorderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                elevation: 0.0,
                                buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'pnek4gm6' /* Last Week */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '3p7ap3vk' /* This Week */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '8fwspz0e' /* This Month */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final timeAttendanceForLastWeekView =
                                          functions
                                                  .filterEntriesForLastWeek(_model
                                                      .monthViewTimeAttendance
                                                      .toList())
                                                  ?.where((e) =>
                                                      'Holiday' !=
                                                      getJsonField(
                                                        e,
                                                        r'''$.remark''',
                                                      ).toString())
                                                  .toList()
                                                  .toList() ??
                                              [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: timeAttendanceForLastWeekView
                                            .length,
                                        itemBuilder: (context,
                                            timeAttendanceForLastWeekViewIndex) {
                                          final timeAttendanceForLastWeekViewItem =
                                              timeAttendanceForLastWeekView[
                                                  timeAttendanceForLastWeekViewIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .changeTimeEntriesDateFormate(
                                                              getJsonField(
                                                        timeAttendanceForLastWeekViewItem,
                                                        r'''$.timeEntry_Date''',
                                                      ).toString()),
                                                      'date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFF9B052),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              CardTimeAttendanceWidget(
                                                key: Key(
                                                    'Keysfu_${timeAttendanceForLastWeekViewIndex}_of_${timeAttendanceForLastWeekView.length}'),
                                                location: getJsonField(
                                                  timeAttendanceForLastWeekViewItem,
                                                  r'''$.clock_In_Location''',
                                                ),
                                                checkIn: getJsonField(
                                                  timeAttendanceForLastWeekViewItem,
                                                  r'''$.clock_In_Time''',
                                                ),
                                                checkOut: getJsonField(
                                                  timeAttendanceForLastWeekViewItem,
                                                  r'''$.clock_Out_Time''',
                                                ),
                                                checkInAndOuttype: getJsonField(
                                                  timeAttendanceForLastWeekViewItem,
                                                  r'''$.remark''',
                                                ),
                                                checkInStatus: getJsonField(
                                                  timeAttendanceForLastWeekViewItem,
                                                  r'''$.checkIn_Status''',
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final getThisWeek = functions
                                              .filterEntriesForThisWeek(_model
                                                  .monthViewTimeAttendance
                                                  .toList())
                                              ?.toList() ??
                                          [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: getThisWeek.length,
                                        itemBuilder:
                                            (context, getThisWeekIndex) {
                                          final getThisWeekItem =
                                              getThisWeek[getThisWeekIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .changeTimeEntriesDateFormate(
                                                              getJsonField(
                                                        getThisWeekItem,
                                                        r'''$.timeEntry_Date''',
                                                      ).toString()),
                                                      'date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFF9B052),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              CardTimeAttendanceWidget(
                                                key: Key(
                                                    'Key2k8_${getThisWeekIndex}_of_${getThisWeek.length}'),
                                                location: getJsonField(
                                                  getThisWeekItem,
                                                  r'''$.clock_In_Location''',
                                                ),
                                                checkIn: getJsonField(
                                                  getThisWeekItem,
                                                  r'''$.clock_In_Time''',
                                                ),
                                                checkOut: getJsonField(
                                                  getThisWeekItem,
                                                  r'''$.clock_Out_Time''',
                                                ),
                                                checkInAndOuttype: getJsonField(
                                                  getThisWeekItem,
                                                  r'''$.remark''',
                                                ),
                                                checkInStatus: getJsonField(
                                                  getThisWeekItem,
                                                  r'''$.checkIn_Status''',
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final monthViewList =
                                          _model.monthViewTimeAttendance
                                              .where((e) =>
                                                  'Holiday' !=
                                                  getJsonField(
                                                    e,
                                                    r'''$.remark''',
                                                  ).toString())
                                              .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: monthViewList.length,
                                        itemBuilder:
                                            (context, monthViewListIndex) {
                                          final monthViewListItem =
                                              monthViewList[monthViewListIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .changeTimeEntriesDateFormate(
                                                              getJsonField(
                                                        monthViewListItem,
                                                        r'''$.timeEntry_Date''',
                                                      ).toString()),
                                                      'date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFF9B052),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              CardTimeAttendanceWidget(
                                                key: Key(
                                                    'Keybw5_${monthViewListIndex}_of_${monthViewList.length}'),
                                                location: getJsonField(
                                                  monthViewListItem,
                                                  r'''$.clock_In_Location''',
                                                ),
                                                checkIn: getJsonField(
                                                  monthViewListItem,
                                                  r'''$.clock_In_Time''',
                                                ),
                                                checkOut: getJsonField(
                                                  monthViewListItem,
                                                  r'''$.clock_Out_Time''',
                                                ),
                                                checkInAndOuttype: getJsonField(
                                                  monthViewListItem,
                                                  r'''$.remark''',
                                                ),
                                                checkInStatus: getJsonField(
                                                  monthViewListItem,
                                                  r'''$.checkIn_Status''',
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
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
