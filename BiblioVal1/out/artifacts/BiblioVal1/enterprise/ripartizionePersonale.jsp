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

        <title>BiblioEvaluate - Enterprise - RipartizionePersonale</title>

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
                                <a href="gestioneLicenze.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
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
                        <h1 class="page-header">Ripartizione Personale per ADU senza gli SSD non bibliometrici</h1>
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
                            <div class="panel-body" >
                                <div class="row">
                                    <div class="col-lg-6" align="left">
                                        <h2>
                                            Legenda:
                                        </h2>
                                        <br>                                         
                                        <div align="left" id="js-legend">  </div>
                                    </div>
                                    <div class="col-lg-4" align="right">
                                        <canvas id="myChart" width="400" height="400"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Ripartizione del personale per ADU compresi gli SSD non bibliometrici</h1>
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
                            <div class="panel-body" >
                                <div class="row">
                                    <div class="col-lg-6" align="left">
                                        <h2>
                                            Legenda:
                                        </h2>
                                        <br>                                         
                                        <div align="left" id="js-legend-SSD-ADU">  </div>
                                    </div>
                                    <div class="col-lg-4" align="right">
                                        <canvas id="myChart-SSD-ADU" width="400" height="400"></canvas>
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
                        <form role="form" action="RipartPersServlet" method="POST">
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
                <script type="text/javascript">

                    function stringToColour(str) {
                        Math.seedrandom(str);
                        var rand = Math.random() * Math.pow(255, 3);
                        Math.seedrandom(); // don't leave a non-random seed in the generator
                        for (var i = 0, colour = "#"; i < 3; colour += ("00" + ((rand >> i++ * 8) & 0xFF).toString(16)).slice( - 2))
                            ;
                        return colour;
                    }

                    function ColorLuminance(hex, lum) {

                        // validate hex string
                        hex = String(hex).replace(/[^0-9a-f]/gi, '');
                        if (hex.length < 6) {
                            hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
                        }
                        lum = lum || 0;

                        // convert to decimal and change luminosity
                        var rgb = "#", c, i;
                        for (i = 0; i < 3; i++) {
                            c = parseInt(hex.substr(i * 2, 2), 16);
                            c = Math.round(Math.min(Math.max(0, c + (c * lum)), 255)).toString(16);
                            rgb += ("00" + c).substr(c.length);
                        }

                        return rgb;
                    }

                    function onlyADU() {
                        var data = [];
                        var array = JSON.parse($.cookie('aduBiblio'));
                        for (var i = 0; i < array.length; i++) {
                            var color = stringToColour(array[i].nomeADU);
                            var tmp = {
                                value: array[i].numProf,
                                color: color,
                                highlight: ColorLuminance(color, -0.25),
                                label: array[i].nomeADU + " - " + array[i].percentage + "%"
                            }
                            data.push(tmp);
                        }

                        var options = {
                            //Boolean - Whether we should show a stroke on each segment
                            segmentShowStroke: true,
                            //String - The colour of each segment stroke
                            segmentStrokeColor: "#fff",
                            segmentColorDefault: "#fff",
                            //Number - The width of each segment stroke
                            segmentStrokeWidth: 2,
                            //Number - The percentage of the chart that we cut out of the middle
                            percentageInnerCutout: 50, // This is 0 for Pie charts

                            //Number - Amount of animation steps
                            animationSteps: 100,
                            //String - Animation easing effect
                            animationEasing: "easeOutBounce",
                            //Boolean - Whether we animate the rotation of the Doughnut
                            animateRotate: true,
                            //Boolean - Whether we animate scaling the Doughnut from the centre
                            animateScale: false
                        };
                        //var ctx = document.getElementById("myChart").getContext("2d");
                        var ctx = $("#myChart").get(0).getContext("2d");
                        var myPieChart = new Chart(ctx).Pie(data, options);
                        legend(document.getElementById("js-legend"), data, myPieChart);
                    }

                    function ssdAndAdu() {
                        var dataSsd = [];
                        var arraySsd = JSON.parse($.cookie('nonBiblio'));
                        for (var i = 0; i < arraySsd.length; i++) {
                            var color = stringToColour(arraySsd[i].nomeADU);
                            var tmp = {
                                value: arraySsd[i].numProf,
                                color: color,
                                highlight: ColorLuminance(color, -0.25),
                                label: arraySsd[i].nomeADU + " - " + arraySsd[i].percentage + "%"
                            }
                            dataSsd.push(tmp);
                        }

                        var optionsSsd = {
                            //Boolean - Whether we should show a stroke on each segment
                            segmentShowStroke: true,
                            //String - The colour of each segment stroke
                            segmentStrokeColor: "#fff",
                            segmentColorDefault: "#fff",
                            //Number - The width of each segment stroke
                            segmentStrokeWidth: 2,
                            //Number - The percentage of the chart that we cut out of the middle
                            percentageInnerCutout: 50, // This is 0 for Pie charts

                            //Number - Amount of animation steps
                            animationSteps: 100,
                            //String - Animation easing effect
                            animationEasing: "easeOutBounce",
                            //Boolean - Whether we animate the rotation of the Doughnut
                            animateRotate: true,
                            //Boolean - Whether we animate scaling the Doughnut from the centre
                            animateScale: false
                        };
                        //var ctx = document.getElementById("myChart").getContext("2d");
                        var ctxSsd = $("#myChart-SSD-ADU").get(0).getContext("2d");
                        var ssdPieChart = new Chart(ctxSsd).Pie(dataSsd, optionsSsd);
                        legend(document.getElementById("js-legend-SSD-ADU"), dataSsd, ssdPieChart);
                    }

                    function all() {
                        onlyADU();
                        ssdAndAdu();
                    }
                    ;

                    function test() {
                        if ($.cookie('aduBiblio') === 'null' || $.cookie('nonBiblio') === 'null' ||
                                !$.cookie('aduBiblio') || !$.cookie('nonBiblio')) {
                            $.post('RipartPersServlet', all);
                        } else {
                            all();
                        }
                    }
                    test();
                </script>
            </c:otherwise>
        </c:choose>

        <script>
            function exit() {
                $.cookie('aduBiblio', "", {expires: -1});
                $.cookie('nonBiblio', "", {expires: -1});
            }
            ;

            window.onunload = exit;
        </script>


    </body>

</html>
