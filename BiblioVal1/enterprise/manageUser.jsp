<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>BiblioEvaluate - Enterprise - ManageUser</title>

        <!-- Bootstrap Core CSS -->
        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="../bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
        <!-- DatePicker CSS -->
        <link href="../bootstrap/css/bootstrap-datepicker.standalone.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- jQuery -->
        <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

        <script src="../bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="../bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="../bootstrap/js/jquery.cookie.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../bootstrap/dist/js/sb-admin-2.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });

            var Password = {
                _pattern: /[a-zA-Z0-9_\-\+\.]/,
                _getRandomByte: function ()
                {
                    // http://caniuse.com/#feat=getrandomvalues
                    if (window.crypto && window.crypto.getRandomValues)
                    {
                        var result = new Uint8Array(1);
                        window.crypto.getRandomValues(result);
                        return result[0];
                    } else if (window.msCrypto && window.msCrypto.getRandomValues)
                    {
                        var result = new Uint8Array(1);
                        window.msCrypto.getRandomValues(result);
                        return result[0];
                    } else
                    {
                        return Math.floor(Math.random() * 256);
                    }
                },
                generate: function (length)
                {
                    return Array.apply(null, {'length': length})
                            .map(function ()
                            {
                                var result;
                                while (true)
                                {
                                    result = String.fromCharCode(this._getRandomByte());
                                    if (this._pattern.test(result))
                                    {
                                        return result;
                                    }
                                }
                            }, this)
                            .join('');
                }

            };

        </script>
        <script src="../bootstrap/js/bootstrap-datepicker.js"></script>
        <script>
            function openModalEditUser(id, nome, cognome, uni, ruolo, old_pass, old_date) {
                $('#editUser').modal("show");
                document.getElementById("inputNome").value = nome;
                document.getElementById("inputCognome").value = cognome;
                document.getElementById("inputUserName").value = id;
                document.getElementById("role").value = ruolo;
                document.getElementById("uni").value = uni;
                document.getElementById("old_password").value = old_pass;
                document.getElementById("old_date").value = old_date;
            }
            ;
            function openModalRemoveUser(id, role) {
                if (role === "admin") {
                    $('#modalAdmin').modal("show");
                } else {
                    $('#myModal').modal("show");
                    document.getElementById("idToRemove").value = id;
                }
            }
            ;
            $('.datepicker').datepicker();
            $.fn.datepicker.defaults.format = "yyyy-mm-dd";
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
        <div id="bene" class="alert alert-success fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Completata</strong> -  Informazioni utente aggiornate con successo.
        </div>

        <div id="error" class="alert alert-danger fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Operazione Fallita</strong> -  Informazioni utente non aggiornate.
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
                        <h1 class="page-header">Gestione Utenti</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row" >
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Modifica Utenti
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>User Id</th>
                                                <th>Nome</th>
                                                <th>Cognome</th>
                                                <th>Università</th>
                                                <th>Ruolo</th>
                                                <th>Scadenza</th>
                                                <th>Elimina</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${userList}" var="u">
                                                <tr class="odd gradeX">
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getUserId()}</td>
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getFirstName()}</td>
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getLastName()}</td>
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getUni()}</td>
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getRole()}</td>
                                                    <td onclick="openModalEditUser('${u.getUserId()}', '${u.getFirstName()}',
                                                                    '${u.getLastName()}', '${u.getUni()}', '${u.getRole()}',
                                                                    '${u.getPassword()}', '${u.getScadenza()}');" 
                                                        title="Clicca per modificare l'utente">${u.getScadenza()}</td>
                                                    <td align="center" onclick="openModalRemoveUser('${u.getUserId()}', '${u.getRole()}');" title="Clicca per rimuovere l'utente">
                                                        <img src="../images/del.png" width="30" height="30">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- Modal -->
        <div class="modal fade" id="editUser" role="dialog">
            <div class="modal-dialog">    
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modifica utente</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="UpdateUserServlet" method="POST">
                                    <div class="form-group">
                                        <label>Inserisci il nome dell'utente</label>
                                        <input class="form-control" name="firstName" id="inputNome">
                                    </div>
                                    <div class="form-group">
                                        <label>Inserisci il cognome dell'utente</label>
                                        <input class="form-control" name="lastName" id="inputCognome">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" name="userId" id="inputUserName" type="hidden">
                                        <input class="form-control" name="old_date" id="old_date" type="hidden">
                                        <input class="form-control" name="old_password" id="old_password" type="hidden">
                                    </div>
                                    <div>
                                        <input type="button" value ='Genera Password' class="btn btn-primary" onclick='document.getElementById("p").value = Password.generate(16)'>
                                        &nbsp; &nbsp;<input type='text' id='p' name="password"/><br/>                                               
                                    </div>
                                    <br>

                                    <div class="form-group">
                                        <label>Inserisci il ruolo dell'utente</label>
                                        <select class="form-control" name="role" id="role">
                                            <option></option>
                                            <option value="admin">Amministratore</option>
                                            <option value="client">Cliente</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Seleziona l'univerist� dell'utente</label>
                                        <select class="form-control" name="uni" id="uni">
                                            <c:forEach items="${uniList}" var="uni">
                                                <option value="${uni}">${uni}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Inserisci il periodo di validit� dell'account</label> &nbsp; &nbsp;
                                        <input data-provide="datepicker" name="new_date" id="new_date">
                                    </div>
                                    <div align="center">
                                        <input type="submit" value="Submit" class="btn btn-primary" >
                                    </div>
                                </form>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalAdmin" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: red">Impossibile elimanare l'utente!</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <h3>L'utente selezionato � un amministratore</h3>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sicuro di voler eliminare l'utente?</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" action="DeleteUserServlet" method="POST">
                            <input class="form-control" name="userId" id="idToRemove" type="hidden">
                            <div align="center">
                                <input type="submit" value="Conferma eliminazione" class="btn btn-primary" >
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function checkError() {
                if ($.cookie('check')) {
                    var check = $.cookie('check');

                    if (check === 'ok') {
                        document.getElementById("bene").style.display = 'block';
                    } else if (check === 'no') {
                        document.getElementById("error").style.display = 'block';
                    }
                    $.cookie('check', null);
                }
            }
            checkError();

            function reset() {
                $.cookie('check', "", {expires: -1});
            }

            window.onunload = reset;
        </script>

    </body>

</html>
