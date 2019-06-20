<%-- 
    Document   : Add_Banner
    Created on : Jul 31, 2018, 9:50:43 AM
    Author     : APTA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Admin Panel | </title>

        <!-- Bootstrap core CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="css/custom.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.3.css" />
        <link href="css/icheck/flat/green.css" rel="stylesheet" />
        <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />

        <script src="js/jquery.min.js"></script>
        <script src="js/nprogress.js"></script>

        <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            function fileValidation() {
                var fileInput = document.getElementById('file');
                var filePath = fileInput.value;
                var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
                if (!allowedExtensions.exec(filePath)) {
                    alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
                    fileInput.value = '';
                    return false;
                } else {
                    //Image preview
                    if (fileInput.files && fileInput.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            document.getElementById('imagePreview').innerHTML = '<img src="' + e.target.result + '"/>';
                        };
                        reader.readAsDataURL(fileInput.files[0]);
                    }
                }
            }
        </script>

    </head>


    <body class="nav-md">

        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <jsp:include page="include/header.jsp"></jsp:include>


                            <!-- sidebar menu -->
                        <jsp:include page="include/sidebar.jsp"></jsp:include>

                            <!-- /sidebar menu -->

                            <!-- /menu footer buttons -->

                            <!-- /menu footer buttons -->
                        </div>
                    </div>

                    <!-- top navigation -->
                <jsp:include page="include/nav.jsp"></jsp:include>

                    <!-- /top navigation -->


                    <!-- page content -->
                    <div class="right_col" role="main">

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="dashboard_graph">

                                    <div class="row x_title">
                                        <div class="col-md-6">
                                            <h3>Query </h3>
                                        </div>
                                        <div class="col-md-6">

                                        </div>
                                    </div>
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>View Query <small>Here</small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>
                                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <div class="col-sm-12 mail_view">
                                                  <%
                                                            String id = request.getParameter("id");
                                                            Connection conn = new Connect().getConnection();
                                                            PreparedStatement ps = conn.prepareStatement("select * from contactus where contactId=?");
                                                            ps.setString(1,id);
                                                            ResultSet rs = ps.executeQuery();
                                                            if (rs.next()) {
                                                        %>
                                                <div class="inbox-body">
                                                    <div class="mail_heading row">
                                                        <div class="col-md-8">



                                                 
                                                        <div class="compose-btn">
                                                            <%
                                                                if (rs.getString("status").equalsIgnoreCase("Not Replied"))
                                                                {
                                                            %>
                                                            <a class="btn btn-sm btn-primary" href="ReplyQuery.jsp?email=<%=rs.getString("email")%>"><i class="fa fa-reply"></i> Reply</a>
                                                        <%    } 
                                                            else
                                                             {
                                                            %>
                                                            <a class="btn btn-sm btn-default" href=""><i class="fa fa-reply"></i> Reply</a>
                                                            <%}%>
                                                            <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="Print" onclick="window.print();" class="btn  btn-sm tooltips"><i class="fa fa-print"></i> </button>
                                                            <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm tooltips" onclick="if (confirm('Sure Want?')) {
                                          return true;} else {
                                          return false;};"><i class="fa fa-trash-o"></i>
                                                            </button>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 text-right">

                                                    </div>
                                                    <div class="col-md-12">
                                                        <h4><strong>Subject: </strong>Query Regarding Service</h4>
                                                    </div>
                                                </div>
                                                <div class="sender-info">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <strong><%=rs.getString("name")%></strong>
                                                            <span>(<%=rs.getString("email")%>)</span> to
                                                            <strong>me</strong>
                                                            <a class="sender-dropdown"><i class="fa fa-chevron-down"></i></a>
                                                        </div>
                                                    </div>
                                                </div
                                                <br/>
                                                <div class="view-mail">
                                                    <p><%=rs.getString("message")%></p>
                                                </div>

                                                <div class="compose-btn pull-left">
                                                    <%
                                                                if (rs.getString("status").equalsIgnoreCase("Not Replied"))
                                                                {
                                                            %>
                                                            <a class="btn btn-sm btn-primary" href="ReplyQuery.jsp?email=<%=rs.getString("email")%>"><i class="fa fa-reply"></i> Reply</a>
                                                        <%    } 
                                                            else
                                                             {
                                                            %>
                                                            <a class="btn btn-sm btn-default" href=""><i class="fa fa-reply"></i> Reply</a>
                                                            <%}%>

                                                    <button title="" data-placement="top" data-toggle="tooltip" onclick="window.print()" type="button" data-original-title="Print" class="btn  btn-sm tooltips"><i class="fa fa-print"></i> </button>
                                                    <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" onclick="if (confirm('Sure Want?')) {
                                      return true;} else {
                                      return false;};" class="btn btn-sm tooltips"><i class="fa fa-trash-o"></i>
                                                    </button>
                                                </div>
                                            </div>
<%}%>
                                        </div>
                                        <!-- /CONTENT MAIL -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <br />

    <!-- footer content -->
    <jsp:include page="include/footer.jsp"></jsp:include>


    <!-- /footer content -->
</div>
<!-- /page content -->

</div>

</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>

<script src="js/bootstrap.min.js"></script>

<!-- gauge js -->
<script type="text/javascript" src="js/gauge/gauge.min.js"></script>
<script type="text/javascript" src="js/gauge/gauge_demo.js"></script>
<!-- chart js -->
<script src="js/chartjs/chart.min.js"></script>
<!-- bootstrap progress js -->
<script src="js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="js/icheck/icheck.min.js"></script>
<!-- daterangepicker -->
<script type="text/javascript" src="js/moment/moment.min.js"></script>
<script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>

<script src="js/custom.js"></script>

<!-- flot js -->
<!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" src="js/flot/jquery.flot.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.orderBars.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="js/flot/date.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.spline.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.stack.js"></script>
<script type="text/javascript" src="js/flot/curvedLines.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.resize.js"></script>
<script>
                      $(document).ready(function () {
                          // [17, 74, 6, 39, 20, 85, 7]
                          //[82, 23, 66, 9, 99, 6, 2]
                          var data1 = [
                              [gd(2012, 1, 1), 17],
                              [gd(2012, 1, 2), 74],
                              [gd(2012, 1, 3), 6],
                              [gd(2012, 1, 4), 39],
                              [gd(2012, 1, 5), 20],
                              [gd(2012, 1, 6), 85],
                              [gd(2012, 1, 7), 7]
                          ];

                          var data2 = [
                              [gd(2012, 1, 1), 82],
                              [gd(2012, 1, 2), 23],
                              [gd(2012, 1, 3), 66],
                              [gd(2012, 1, 4), 9],
                              [gd(2012, 1, 5), 119],
                              [gd(2012, 1, 6), 6],
                              [gd(2012, 1, 7), 9]
                          ];
                          $("#canvas_dahs").length && $.plot($("#canvas_dahs"), [
                              data1, data2
                          ], {
                              series: {
                                  lines: {
                                      show: false,
                                      fill: true
                                  },
                                  splines: {
                                      show: true,
                                      tension: 0.4,
                                      lineWidth: 1,
                                      fill: 0.4
                                  },
                                  points: {
                                      radius: 0,
                                      show: true
                                  },
                                  shadowSize: 2
                              },
                              grid: {
                                  verticalLines: true,
                                  hoverable: true,
                                  clickable: true,
                                  tickColor: "#d5d5d5",
                                  borderWidth: 1,
                                  color: '#fff'
                              },
                              colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
                              xaxis: {
                                  tickColor: "rgba(51, 51, 51, 0.06)",
                                  mode: "time",
                                  tickSize: [1, "day"],
                                  //tickLength: 10,
                                  axisLabel: "Date",
                                  axisLabelUseCanvas: true,
                                  axisLabelFontSizePixels: 12,
                                  axisLabelFontFamily: 'Verdana, Arial',
                                  axisLabelPadding: 10
                                          //mode: "time", timeformat: "%m/%d/%y", minTickSize: [1, "day"]
                              },
                              yaxis: {
                                  ticks: 8,
                                  tickColor: "rgba(51, 51, 51, 0.06)",
                              },
                              tooltip: false
                          });

                          function gd(year, month, day) {
                              return new Date(year, month - 1, day).getTime();
                          }
                      });
</script>

<!-- worldmap -->
<script type="text/javascript" src="js/maps/jquery-jvectormap-2.0.3.min.js"></script>
<script type="text/javascript" src="js/maps/gdp-data.js"></script>
<script type="text/javascript" src="js/maps/jquery-jvectormap-world-mill-en.js"></script>
<script type="text/javascript" src="js/maps/jquery-jvectormap-us-aea-en.js"></script>
<!-- pace -->
<script src="js/pace/pace.min.js"></script>
<script>
                      $(function () {
                          $('#world-map-gdp').vectorMap({
                              map: 'world_mill_en',
                              backgroundColor: 'transparent',
                              zoomOnScroll: false,
                              series: {
                                  regions: [{
                                          values: gdpData,
                                          scale: ['#E6F2F0', '#149B7E'],
                                          normalizeFunction: 'polynomial'
                                      }]
                              },
                              onRegionTipShow: function (e, el, code) {
                                  el.jsp(el.jsp() + ' (GDP - ' + gdpData[code] + ')');
                              }
                          });
                      });
</script>
<!-- skycons -->
<script src="js/skycons/skycons.min.js"></script>
<script>
                      var icons = new Skycons({
                          "color": "#73879C"
                      }),
                              list = [
                                  "clear-day", "clear-night", "partly-cloudy-day",
                                  "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                  "fog"
                              ],
                              i;

                      for (i = list.length; i--; )
                          icons.set(list[i], list[i]);

                      icons.play();
</script>

<!-- dashbord linegraph -->
<script>
    var doughnutData = [{
            value: 30,
            color: "#455C73"
        }, {
            value: 30,
            color: "#9B59B6"
        }, {
            value: 60,
            color: "#BDC3C7"
        }, {
            value: 100,
            color: "#26B99A"
        }, {
            value: 120,
            color: "#3498DB"
        }];
    var myDoughnut = new Chart(document.getElementById("canvas1").getContext("2d")).Doughnut(doughnutData);
</script>
<!-- /dashbord linegraph -->
<!-- datepicker -->
<script type="text/javascript">
    $(document).ready(function () {

        var cb = function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
            $('#reportrange span').jsp(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
        }

        var optionSet1 = {
            startDate: moment().subtract(29, 'days'),
            endDate: moment(),
            minDate: '01/01/2012',
            maxDate: '12/31/2015',
            dateLimit: {
                days: 60
            },
            showDropdowns: true,
            showWeekNumbers: true,
            timePicker: false,
            timePickerIncrement: 1,
            timePicker12Hour: true,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            opens: 'left',
            buttonClasses: ['btn btn-default'],
            applyClass: 'btn-small btn-primary',
            cancelClass: 'btn-small',
            format: 'MM/DD/YYYY',
            separator: ' to ',
            locale: {
                applyLabel: 'Submit',
                cancelLabel: 'Clear',
                fromLabel: 'From',
                toLabel: 'To',
                customRangeLabel: 'Custom',
                daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                firstDay: 1
            }
        };
        $('#reportrange span').jsp(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
        $('#reportrange').daterangepicker(optionSet1, cb);
        $('#reportrange').on('show.daterangepicker', function () {
            console.log("show event fired");
        });
        $('#reportrange').on('hide.daterangepicker', function () {
            console.log("hide event fired");
        });
        $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
            console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
            console.log("cancel event fired");
        });
        $('#options1').click(function () {
            $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
        });
        $('#options2').click(function () {
            $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
        });
        $('#destroy').click(function () {
            $('#reportrange').data('daterangepicker').remove();
        });
    });
</script>
<script>
    NProgress.done();
</script>
<!-- /datepicker -->
<!-- /footer content -->
</body>

</html>
