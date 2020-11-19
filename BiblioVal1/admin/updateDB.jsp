<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
        <!-- jQuery -->
        <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../bootstrap/dist/js/sb-admin-2.js"></script>
    </head>

    <body>

        <c:if test="${result == -1}">
            <script>
                $(window).load(function() {
                    $('#modalErrorSSD_ADU').modal("show");
                });
            </script>
        </c:if>
        <c:if test="${result == -2}">
            <script>
                $(window).load(function() {
                    $('#modalError_VistaUni').modal("show");
                });
            </script>
        </c:if>
        <c:if test="${result == -3}">
            <script>
                $(window).load(function() {
                    $('#modalError_VistaProf').modal("show");
                });
            </script>
        </c:if>
            
        <c:if test="${result == 1}">
            <script>
                $(window).load(function() {
                    $('#modalSuccess').modal("show");
                });
            </script>
        </c:if>
        <%
            if (null == session.getAttribute("userId")) {
                response.sendRedirect("../login.jsp");
            }
            if (!session.getAttribute("role").toString().equalsIgnoreCase("admin")) {
                response.sendRedirect("../client.jsp");
            }
            session.setAttribute("result", 0);
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
                                        <a href="uniAdu.jsp"> Vista UniversitÓ per ADU</a>
                                    </li>
                                    <li>
                                        <a href="uniSsd.jsp"> Vista UniversitÓ per SSD</a>
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
                    <div class="col-lg-10">
                        <h1 class="page-header">Aggiornamento Database</h1>
                    </div>
                </div>
                <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Seleziona il file contenetne il mapping SSD - ADU
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                                <div class="col-lg-4">
                                    <div align="left">
                                        <input type="file" name="SSD-ADU" size="50" />
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div align="right">
                                        <input type="submit" value="Upload File" class="btn btn-primary" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                     <div class="panel-heading">
                        Seleziona il file contenente la Vista UniveritÓ
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                                <div class="col-lg-4">
                                    <div align="left">
                                        <input type="file" name="VistaUni" size="50" />
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div align="right">
                                        <input type="submit" value="Upload File" class="btn btn-primary" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                     <div class="panel-heading">
                        Seleziona il file contenente la Vista Docenti
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                                <div class="col-lg-4">
                                    <div align="left">
                                        <input type="file" name="VistaProf" size="50" />
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div align="right">
                                        <input type="submit" value="Upload File" class="btn btn-primary" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- /#wrapper -->

        <div class="modal fade" id="modalErrorSSD_ADU" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" style="color:red">Errore nell'aggiornamento del DB</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <h4>Struttura file non conforme alle specifiche.</h4><br> 
                        Usare un file con le seguneti colonne: <br>
                        {"SSD", "Titolo", "ADU", "Titolo", "Bibliometrico"};
                    </div>
                </div>

            </div>
        </div>
        
        <div class="modal fade" id="modalError_VistaUni" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" style="color:red">Errore nell'aggiornamento del DB</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <h4>Struttura file non conforme alle specifiche. </h4><br>
                        Usare un file con le seguneti caratteristiche:<br>
                        Il primo foglio contenente le colonne: <br>
                        {"SSD", "ADU", "Research staff", "FSS", "rank", "percentile"};<br>
                        Il secondo foglio contenente le colonne: <br>
                        {"Ateneo", "ADU", "Research staff", "FSS", "rank", "percentile"};
 
                    </div>
                </div>

            </div>
        </div>
        
        <div class="modal fade" id="modalError_VistaProf" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" style="color:red">Errore nell'aggiornamento del DB</h4>
                    </div>
                    <div class="modal-body">
                        <h4>Struttura file non conforme alle specifiche. </h4><br>
                        Usare un file con le seguneti caratteristiche:<br>
                        Il primo foglio contenente le colonne: <br>
                        {"Nominativo", "Ateneo", "SSD", "Bibliometrico", "Ultimo ruolo",<br>
                        "Annate in ruolo", "FSS", "rank", "percentile"} <br>
                        Il secondo foglio contenente le colonne: <br>
                        {"Nominativo", "Ateneo", "SSD", "Bibliometrico",<br>
                        "Ultimo ruolo","Annate in ruolo", "v.a.",<br>
                        "rankB", "perc.", "FSS", "rank", "percentile"};
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="modalSuccess" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center" style="color:green">Operazione completata</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <h3>Database aggiornato con successo.</h3>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
