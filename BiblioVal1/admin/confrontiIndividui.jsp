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

        <title>BiblioEvaluate - Admin - ConfrontiIndividui</title>

        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="../bootstrap/css/demo.css" rel="stylesheet" type="text/css">

        <script src="../graph/Chart.js"></script>
        <script src="../graph/Chart.Scatter.js"></script>

        <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>
        <script src="../bootstrap/dist/js/sb-admin-2.js"></script>
        <script src="../bootstrap/bower_components/raphael/raphael-min.js"></script>
        <script src="../bootstrap/js/seedrandom.min.js"></script>
        <script src="../bootstrap/js/jquery.cookie.min.js"></script>
        <script src="../bootstrap/js/legend.js"></script>
        <script>
            function openModalChangeUni(selectedUni) {
                $.cookie('ssdList', "", {expires: -1});
                $.cookie('perfIndividuiList', "", {expires: -1});
                $.cookie('mediaSsd', "", {expires: -1});
                $('#modalSelectUni').modal("show");
                document.getElementById("uni").value = selectedUni;
            }
            ;
            function openModalChangeSsd(data) {
                $.cookie('perfIndividuiList', "", {expires: -1});
                $.cookie('mediaSsd', "", {expires: -1});
                if (data === 'prova') {
                    $('#modalSelectSsd').modal("show");
                } else {
                    test = JSON.parse($.cookie('ssdList'));
                    $.each(test, function (index, item) {
                        $('#ssd').append($('<option></option>').val(item.nome).html(item.nome));
                    });
                    $('#modalSelectSsd').modal("show");
                }
            }
            ;

        </script>
    </head>

    <body>
        <%
            if (null == session.getAttribute("userId")) {
                response.sendRedirect("../login.jsp");
            }
            if (!session.getAttribute("role").toString().equalsIgnoreCase("admin")) {
                response.sendRedirect("../client.jsp");
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
                                <a href="../admin.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Gestione Utenti<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="addUser.jsp">Inserisci Utente</a>
                                    </li>
                                    <li>
                                        <a href="manageUser">Modifica Utenti</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="updateDB.jsp"><i class="fa fa-database"></i> Update Database</a>
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
                        <h1 class="page-header">Performance individui riferiti all'SSD:<br>${selectedSsd}</h1>
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
                                        <div class="col-lg-6">
                                            <button class="btn btn-primary" onclick="openModalChangeSsd('prova');">Cambia SSD</button>
                                        </div>
                                        <div class="col-lg-6">
                                            <button class="btn btn-primary" onclick="openModalChangeUni('${selectedUni}');">Cambia Univerist�</button>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                            <div class="panel-body" >
                                <div class="row">
                                    <div class="col-lg-12" align="center">
                                        <h3>Legenda:</h3>
                                        <ul>
                                            <li style="color: red;">In ruolo meno di 5 anni</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12" align="center">
                                        <canvas id="myScatterChart" width="800" height="400"></canvas>
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
                        <form role="form" action="ConfrontoPerformance" method="POST">
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

        <div class="modal fade" id="modalSelectSsd" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" >Seleziona l'SSD</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <form role="form" action="ConfrontoPerformance" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="ssd" id="ssd">

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
                    function createChart() {

                        var array = JSON.parse($.cookie('perfIndividuiList'));
                        var media = JSON.parse($.cookie('mediaSsd'));

                        var data = [];

                        if (array.length > 0) {
                            for (var i = 0; i < array.length; i++) {
                                var color;
                                if (array[i].anni < 5) {
                                    color = 'red';
                                } else {
                                    color = 'black';
                                }
                                var tmp = {
                                    label: array[i].nome,
                                    color: color,
                                    pointColor: color,
                                    pointStrokeColor: color,
                                    data: [{x: i + 1, y: array[i].perc, r: 1}]
                                }
                                data.push(tmp);
                            }

                            var dt = []
                            for (var i = 0; i < array.length + 2; i++) {
                                var tmp = {
                                    x: i,
                                    y: media,
                                    r: 1
                                }
                                dt.push(tmp);
                            }

                            var line = {
                                label: 'Media SSD',
                                strokeColor: '#007ACC',
                                pointColor: 'rgba(0, 122, 204, 0.0)',
                                pointStrokeColor: 'rgba(0, 122, 204, 0.0)',
                                data: dt,
                                pointDot: false,
                            }

                            data.push(line);
                        }
                        var options = {
                            scaleOverride: true,
                            scaleSteps: 10,
                            scaleStepWidth: 10,
                            scaleStartValue: 0,
                            pointHitDetectionRadius: 3,
                        }

                        var ctx = $("#myScatterChart").get(0).getContext("2d");
                        var myScatterChart = new Chart(ctx).Scatter(data, options);

                        test = JSON.parse($.cookie('ssdList'));
                        $.each(test, function (index, item) {
                            $('#ssd').append($('<option></option>').val(item.nome).html(item.nome));
                        });

                        $.cookie('perfIndividuiList', "", {expires: -1});
                        $.cookie('mediaSsd', "", {expires: -1});
                    }

                    function test() {
                        if (!$.cookie('ssdList')) {
                            if (!$.cookie('perfIndividuiList')) {
                                $.post('GetSsdList', openModalChangeSsd);
                            } else {
                                createChart();
                            }
                        } else if (!$.cookie('perfIndividuiList')) {
                            openModalChangeSsd();
                        } else
                            createChart();
                    }

                    test();
                </script>
            </c:otherwise>
        </c:choose>
    </body>

</html>
