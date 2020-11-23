<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
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

        <!-- Bootstrap Core CSS -->
        <link href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>

    <body>

    <%
            if (null == session.getAttribute("userId")) {
                response.sendRedirect("login.jsp");
            }

            else if (session.getAttribute("role").toString().equalsIgnoreCase("admin")){
                response.sendRedirect("admin.jsp");
            }

            else if (session.getAttribute("role").toString().equalsIgnoreCase("enterprise")){
                response.sendRedirect("enterprise.jsp");
            }

            else if (session.getAttribute("role").toString().equalsIgnoreCase("journalist") || session.getAttribute("role").toString().equalsIgnoreCase("researcher")) {
                response.sendRedirect("resJournal.jsp");
            }

             else if (!session.getAttribute("role").toString().equalsIgnoreCase("student")){
                response.sendRedirect("logout.jsp");
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");  //load driver

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/osservatorio_biblioval?autoReconnect=true", "root", "root"); // create connection

                PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE user_id = ?");

                ps.setString(1, session.getAttribute("userId").toString());
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    session.setAttribute("facolta", rs.getString("facolta"));
                    session.setAttribute("uniScelta", rs.getString("uni"));

                } else {

                    out.println("COUPON NON CORRETTO.");

                }
            } catch(Exception e)
            {
                out.println(e.toString());
            }
        %>

        <div id="bene" class="alert alert-success fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Completata</strong> -  Messaggio inviato!.
        </div>

        <div id="error" class="alert alert-danger fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Fallita</strong> -  Il messaggio non � stato inviato.
        </div>
        
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
                            <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="client.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-table fa-fw"></i> Tabelle<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="student/uniAdu.jsp"> Vista Universit� per ADU</a>
                                    </li>
                                    <li>
                                        <a href="student/uniSsd.jsp"> Vista Universit� per SSD</a>
                                    </li>
                                    <li>
                                        <a href="student/profAssoluta.jsp">Vista Docenti Assoluta</a>
                                    </li>
                                    <li>
                                        <a href="student/profRuolo.jsp">Vista Docenti per Ruolo</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Grafici<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="student/ripartizionePersonale.jsp">Ripartizione Personale</a>
                                    </li>
                                    <li>
                                        <a href="#">Performance Ateneo <span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="student/performanceUni.jsp">Performance media</a>
                                            </li>                                            
                                            <li>
                                                <a href="student/performanceADU.jsp">Performanance delle ADU</a>
                                            </li>                                            
                                            <li>
                                                <a href="student/performanceSSD.jsp">Performance degli SSD</a>
                                            </li>
                                            <li>
                                                <a href="student/quartili.jsp">Performance medie per quartile</a>
                                            </li> 
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="student/confrontiIndividui.jsp">Performance individuali</a>
                                    </li>
                                    <li>
                                        <a href="#">Top Scientist<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="student/top20.jsp">Top 10% Scientist</a>
                                            </li>
                                            <li>
                                                <a href="student/top20Adu.jsp">Top 10% Scientist per ADU</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="student/attiviInattivi.jsp">Percentuale Improduttivi</a>
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

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Benvenuto in BiblioEvaluate</h1>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Lascia un feedback!
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <form role="form" action="SaveMessage" method="POST">
                                        <div class="form-group">
                                            <label>Inserisci il titolo</label>
                                            <input class="form-control" name="title" placeholder="Inserisci il titolo">
                                        </div>
                                        <div class="form-group">
                                            <label>Inserisci il messaggio</label>
                                            <textarea rows="5" class="form-control" name="message" placeholder="Inserisci il messaggio"> </textarea>
                                        </div>
                                        <div align="center">
                                            <input type="submit" value="Submit" class="btn btn-primary">
                                        </div>
                                    </form>

                                </div>
                                <!-- /.panel-body -->
                            </div>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="bootstrap/dist/js/sb-admin-2.js"></script>
        <script src="bootstrap/js/jquery.cookie.min.js"></script>

        <script>
            function checkError() {
                if ($.cookie('check')) {
                    var check = $.cookie('check');

                    if (check === 'ok') {
                        document.getElementById("bene").style.display = 'block';
                    } else if (check === 'no') {
                        document.getElementById("error").style.display = 'block';
                    }
                    $.cookie('check', "", {expires: -1});
                }
            }
            checkError();
        </script>
    </body>

</html>
