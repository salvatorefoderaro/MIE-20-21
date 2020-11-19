<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
    <!-- DataTables CSS -->
    <link href="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <script src="../bootstrap/dist/js/sb-admin-2.js"></script>
    <script src="../bootstrap/js/jquery.cookie.min.js"></script>

    <!-- Custom Fonts -->
    <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
        response.sendRedirect("../login.jsp");
    }
    if (!session.getAttribute("role").toString().equalsIgnoreCase("enterprise")) {
        response.sendRedirect("../login.jsp");
    }
%>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/osservatorio_biblioval?autoReconnect=true"
                   user = "root" password = "Foderaro95"/>
<sql:query dataSource = "${snapshot}" var = "result">
    SELECT * from USER WHERE organization= '<%= session.getAttribute("userId") %>';
</sql:query>

<div id="wrapper">

    <%

        if(request.getParameter("userToDelete") != null){

            try
            {
                Class.forName("com.mysql.jdbc.Driver");  //load driver

                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/osservatorio_biblioval?autoReconnect=true","root","Foderaro95"); // create connection

                PreparedStatement pstmt=null; //create statement

                pstmt=con.prepareStatement("DELETE FROM USER WHERE user_id = ?;"); //sql update query
                pstmt.setString(1,request.getParameter("userToDelete"));

                pstmt.executeUpdate(); //execute query

                con.close(); //connection close

                out.println("LICENZA ELIMINATA CORRETTAMETE."); //after update record successfully message


            }
            catch(Exception e)
            {
                out.println("ERRORE NELL'ELIMINAZIONE DELLA LICENZA.");
            }

        }
    %>

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
                                        <th>User ID</th>
                                        <th>Cognome</th>
                                        <th>Nome</th>
                                        <th>Ruolo</th>
                                        <th>Scadenza</th>
                                        <th>Uni</th>
                                        <th>Organization</th>
                                        <th>Facolta</th>
                                        <th>Elimina licenza</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${result.rows}" var="row">
                                        <tr>
                                            <td >${row.user_id}</td>
                                            <td >${row.cognome}</td>
                                            <td >${row.nome}</td>
                                            <td >${row.ruolo}</td>
                                            <td >${row.scadenza}</td>
                                            <td >${row.uni}</td>
                                            <td >${row.organization}</td>
                                            <td >${row.facolta}</td>
                                            <td ><a href="gestioneLicenze.jsp?userToDelete=${row.user_id}">Elimina licenza</a></td>

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
