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
            if (session.getAttribute("role").toString().equalsIgnoreCase("enterprise")) {
                response.sendRedirect("enterprise.jsp");
        %>

        <div id="bene" class="alert alert-success fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Completata</strong> -  Messaggio inviato!.
        </div>

        <div id="error" class="alert alert-danger fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Fallita</strong> -  Il messaggio non è stato inviato.
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
                                        <a href="client/uniAdu.jsp"> Vista Universit� per ADU</a>
                                    </li>
                                    <li>
                                        <a href="client/uniSsd.jsp"> Vista Universit� per SSD</a>
                                    </li>
                                    <li>
                                        <a href="client/profAssoluta.jsp">Vista Docenti Assoluta</a>
                                    </li>
                                    <li>
                                        <a href="client/profRuolo.jsp">Vista Docenti per Ruolo</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Grafici <%=session.getAttribute("selectedUni")%><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="client/ripartizionePersonale.jsp">Ripartizione Personale</a>
                                    </li>
                                    <li>
                                        <a href="#">Performance Ateneo <span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="client/performanceUni.jsp">Performance media</a>
                                            </li>                                            
                                            <li>
                                                <a href="client/performanceADU.jsp">Performanance delle ADU</a>
                                            </li>                                            
                                            <li>
                                                <a href="client/performanceSSD.jsp">Performance degli SSD</a>
                                            </li>
                                            <li>
                                                <a href="client/quartili.jsp">Performance medie per quartile</a>
                                            </li> 
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="client/confrontiIndividui.jsp">Performance individuali</a>
                                    </li>
                                    <li>
                                        <a href="#">Top Scientist<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="client/top20.jsp">Top 10% Scientist</a>
                                            </li>
                                            <li>
                                                <a href="client/top20Adu.jsp">Top 10% Scientist per ADU</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="client/attiviInattivi.jsp">Percentuale Improduttivi</a>
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
