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
        <link href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
        <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>
        <script src="bootstrap/dist/js/sb-admin-2.js"></script>
        <script src="bootstrap/js/jquery.cookie.min.js"></script>

        <!-- Custom Fonts -->
        <link href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">

            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });

            function openModalRemoveMsg(id) {
                $('#myModal').modal("show");
                document.getElementById("idToRemove").value = id;
            }
            ;

            function refresh() {
                location.reload(true);
            }
            function update() {
                $.post('GetMessageList', refresh);
            }
        </script>
    </head>

    <body>

        <%
            if (null == session.getAttribute("userId")) {
                response.sendRedirect("login.jsp");
            }

            if (!session.getAttribute("role").toString().equalsIgnoreCase("admin")){
                response.sendRedirect("logout.jsp");
            }
        %>
        <c:if test="${messageList == 'null'}">
            <script>
                $.post('GetMessageList', refresh);
            </script>
        </c:if>
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
                                <a href="admin.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Gestione Utenti<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="admin/addUser.jsp">Inserisci Utente</a>
                                    </li>
                                    <li>
                                        <a href="admin/manageUser">Modifica Utenti</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="admin/updateDB.jsp"><i class="fa fa-database"></i> Update Database</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-table fa-fw"></i> Tabelle<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="admin/uniAdu.jsp"> Vista Universit� per ADU</a>
                                    </li>
                                    <li>
                                        <a href="admin/uniSsd.jsp"> Vista Universit� per SSD</a>
                                    </li>
                                    <li>
                                        <a href="admin/profAssoluta.jsp">Vista Docenti Assoluta</a>
                                    </li>
                                    <li>
                                        <a href="admin/profRuolo.jsp">Vista Docenti per Ruolo</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Grafici<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="admin/ripartizionePersonale.jsp">Ripartizione Personale</a>
                                    </li>
                                    <li>
                                        <a href="#">Performance Ateneo <span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="admin/performanceUni.jsp">Performance media</a>
                                            </li>                                            
                                            <li>
                                                <a href="admin/performanceADU.jsp">Performanance delle ADU</a>
                                            </li>                                            
                                            <li>
                                                <a href="admin/performanceSSD.jsp">Performance degli SSD</a>
                                            </li>
                                            <li>
                                                <a href="admin/quartili.jsp">Performance medie per quartile</a>
                                            </li> 
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="admin/confrontiIndividui.jsp">Performance individuali</a>
                                    </li>
                                    <li>
                                        <a href="#">Top Scientist<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                          <li>
                                                <a href="admin/top20.jsp">Top 10% Scientist</a>
                                          </li>
                                          <li>
                                                <a href="admin/top20Adu.jsp">Top 10% Scientist per ADU</a>
                                          </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="admin/attiviInattivi.jsp">Percentuale Improduttivi</a>
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
                                    <div class="row">
                                        <div class="col-lg-6" align="left">
                                            <i class="fa fa-bell fa-fw"></i> Feedback Recenti
                                        </div>
                                        <div class="col-lg-6" align="right">
                                            <button class="btn btn-primary" onclick="update()">Aggiorna</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Titolo</th>
                                                    <th>Messaggio</th>
                                                    <th>Elimina</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${messageList}" var="msg">
                                                    <tr>
                                                        <td style="min-width: 150px">${msg.getTitle()}</td>
                                                        <td style="min-width: 500px">${msg.getMessaggio()}</td>
                                                        <td style="min-width: 20px" align="center" onclick="openModalRemoveMsg('${msg.getId()}');" title="Clicca per rimuovere">
                                                            <img src="images/del.png" width="30" height="30">
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sicuro di voler eliminare il messaggio?</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" action="DeleteMsgServlet" method="POST">
                            <input class="form-control" name="msgId" id="idToRemove" type="hidden">
                            <div align="center">
                                <input type="submit" value="Conferma eliminazione" class="btn btn-primary" >
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
