<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>BiblioEvaluate - Enterprise - PerformanceUni</title>

        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="../bootstrap/css/demo.css" rel="stylesheet" type="text/css">

        <script src="../graph/Chart.js"></script>

        <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>
        <script src="../bootstrap/dist/js/sb-admin-2.js"></script>
        <script src="../bootstrap/bower_components/raphael/raphael-min.js"></script>
        <script src="../bootstrap/js/seedrandom.min.js"></script>
        <script src="../bootstrap/js/jquery.cookie.min.js"></script>
        <script src="../graph/Chart.js"></script>
        <script src="../bootstrap/js/legend.js"></script>
        <script>
            function openModalChangeUni(selectedUni) {
                $('#modalSelectUni').modal("show");
                document.getElementById("uni").value = selectedUni;
            }
            ;
        </script>
    </head>

    <body>
        <%
            if (null == session.getAttribute("userId")) {
                response.sendRedirect("../login.jsp");
            }
            if (!session.getAttribute("role").toString().equalsIgnoreCase("enterprise")) {
                response.sendRedirect("../login.jsp");
            }
        %>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand">Pannello Amministratore</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="../enterprise.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Gestione Utenti<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="gestioneLicenze.jsp">Gestisci licenze</a>
                                    </li>
                                    <li>
                                        <a href="addUser.jsp">Aggiungi licenza</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-table fa-fw"></i> Tabelle<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="uniAdu.jsp"> Vista Università per ADU</a>
                                    </li>
                                    <li>
                                        <a href="uniSsd.jsp"> Vista Università per SSD</a>
                                    </li>
                                    <li>
                                        <a href="profAssoluta.jsp">Vista Docenti Assoluta</a>
                                    </li>
                                    <li>
                                        <a href="profRuolo.jsp">Vista Docenti per Ruolo</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Grafici<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ripartizionePersonale.jsp">Ripartizione Personale</a>
                                    </li>
                                    <li>
                                        <a href="#">Performance Ateneo <span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="performanceUni.jsp">Performance media</a>
                                            </li>
                                            <li>
                                                <a href="performanceADU.jsp">Performanance delle ADU</a>
                                            </li>
                                            <li>
                                                <a href="performanceSSD.jsp">Performance degli SSD</a>
                                            </li>
                                            <li>
                                                <a href="quartili.jsp">Performance medie per quartile</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="confrontiIndividui.jsp">Performance individuali</a>
                                    </li>
                                    <li>
                                        <a href="#">Top Scientist<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="top20.jsp">Top 10% Scientist</a>
                                            </li>
                                            <li>
                                                <a href="top20Adu.jsp">Top 10% Scientist per ADU</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="attiviInattivi.jsp">Percentuale Improduttivi</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Performance media Ateneo</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-lg-6" align="left">
                                        <h4>Università: ${selectedUni}</h4>
                                    </div>
                                    <div class="col-lg-6" align="right">
                                        <button class="btn btn-primary" onclick="openModalChangeUni('${selectedUni}');">Cambia Univerist�</button>
                                    </div>  
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-3" align="left">
                                        <h2>
                                            Legenda:
                                        </h2>
                                        <br>                                         
                                        <div align="left" id="js-legend">  </div>
                                    </div>
                                    <div class="col-lg-6" align="right" id="chartContainer">
                                        <canvas id="myLineChart" width="400" height="400"></canvas>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#wrapper -->
        <div class="modal fade" id="modalSelectUni" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" >Seleziona l'Università</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <form role="form" action="PerformanceUni" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="uni" id="uni">
                                    <c:forEach items="${uniList}" var="uni">
                                        <c:choose>
                                            <c:when test="${uni == ''}"></c:when>
                                            <c:when test="${uni == 'all'}"></c:when>
                                            <c:otherwise>
                                                <option value="${uni}">${uni}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div align="center">
                                <input type="submit" value="Scegli" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${selectedUni == 'null'}">
                <script>
                    $(window).load(function () {
                        $('#modalSelectUni').modal("show");
                    });
                </script>
            </c:when>
            <c:otherwise>
        <script>
            function createBarChart() {
                var array = $.cookie('performanceUni');
                var array1 = $.cookie('performanceIndividualiList');

                var value = [];
                value = JSON.parse(array);

                var valori = [];
                valori = JSON.parse(array1);

                var dataset = [];
                dataset.push(ordinari);
                dataset.push(associati);
                dataset.push(ricercatori);
                dataset.push(fss);

                var label = [];
                label.push("Ordinari");
                label.push("Associati");
                label.push("Ricercatori");
                label.push("FSS");

                var fss = {
                    label: "FSS percentile: "+value[0].toPrecision(2)+" - Rank: "+value[1],
                    fillColor: "rgba(255,0,0,0.5)",
                    strokeColor: "rgba(255,0,0,0.5)",
                    highlightFill: "rgba(255,0,0,0.5)",
                    highlightStroke: "rgba(255,0,0,1)",
                    data: [value[0]]
                }
                var ordinari = {
                    label: "Ordinari ("+valori[0].toPrecision(2)+"%)",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data: [valori[0].toPrecision(4)]
                }

                var associati = {
                    label: "Associati ("+valori[1].toPrecision(2)+"%)",
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: [valori[1].toPrecision(4)]
                }

                var ricercatori = {
                    label: "Ricercatori ("+valori[2].toPrecision(2)+"%)",
                    fillColor: "rgba(0,127,255,0.5)",
                    strokeColor: "rgba(0,127,255,0.5)",
                    highlightFill: "rgba(0,127,255,0.5)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: [valori[2].toPrecision(4)]
                }

                var lab = [];
                var generale = {
                    labels: lab,
                    datasets: [fss, ordinari, associati, ricercatori]
                };
                var options = {
                    // Boolean - If we want to override with a hard coded scale
                    scaleOverride: true,
                    // ** Required if scaleOverride is true **
                    // Number - The number of steps in a hard coded scale
                    scaleSteps: 10,
                    // Number - The value jump in the hard coded scale
                    scaleStepWidth: 10,
                    // Number - The scale starting value
                    scaleStartValue: 0,
                    showTooltips: false
                }
                var ctx = $("#myLineChart").get(0).getContext("2d");
                var myBarChart = new Chart(ctx).Bar(generale, options);
                legend(document.getElementById("js-legend"), generale, myBarChart);
            }
            ;

            function test() {
                if ($.cookie('performanceUni') === 'null' || !$.cookie('performanceUni') || 
                    $.cookie('performanceIndividualiList') === 'null' || !$.cookie('performanceIndividualiList')) {
                    $.post('PerformanceUni', createBarChart);
                } else
                    createBarChart();
            }
            
            test();
            
            function exit() {
                $.cookie('performanceUni', "", {expires: -1});
                $.cookie('performanceIdividualiList', "", {expires: -1});
            }
            window.onunload = exit;
        </script>

    </body>

</html>
