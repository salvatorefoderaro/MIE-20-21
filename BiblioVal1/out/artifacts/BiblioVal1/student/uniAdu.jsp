<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>BiblioEvaluate</title>

        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="../bootstrap/css/demo.css" rel="stylesheet" type="text/css">
        <link href="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

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
        <script src="../bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
            
            function reload() {
                location.reload();
            }
        </script>
    </head>

    <body>
        <%
            if (null == session.getAttribute("userId")) {
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
                    <a class="navbar-brand">Pannello Cliente</a>
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
                                <a href="../student.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-table fa-fw"></i> Tabelle<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="uniAdu.jsp"> Vista Universit� per ADU</a>
                                    </li>
                                    <li>
                                        <a href="uniSsd.jsp"> Vista Universit� per SSD</a>
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
                        <h1 class="page-header">Tabella Universit� per ADU</h1>
                    </div>
                </div>

                <c:choose>

                    <c:when test="${uniAduList == 'null'}">
                        <script>
                            $.post('UniAdu', reload);
                        </script>                            
                    </c:when>

                    <c:otherwise>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-6" align="left">
                                                <h4>Universit�: ${selectedUni}</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="dataTable_wrapper">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>ADU</th>
                                                        <th>Reasearch Staff</th>
                                                        <th>FSS</th>
                                                        <th>Rank</th>
                                                        <th>Percentile</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${uniAduList}" var="p">
                                                        <tr class="odd gradeX">
                                                            <td style="min-width: 100px">${p.getADU()}</td>
                                                            <td>${p.getResearchStaff()}</td>
                                                            <td>${p.getFSS()}</td>  
                                                            <td style="min-width: 100px">${p.getRank()}</td> 
                                                            <td>${p.getPercentile()}</td>  
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                              
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>
