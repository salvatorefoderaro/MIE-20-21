<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>BiblioEvaluate - Admin - AddUser</title>

        <!-- Bootstrap Core CSS -->
        <link href="../bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- DatePicker CSS -->
        <link href="../bootstrap/css/bootstrap-datepicker.standalone.css" rel="stylesheet">

        <script>
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

        <!-- jQuery -->
        <script src="../bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../bootstrap/dist/js/sb-admin-2.js"></script>
        <script src="../bootstrap/js/bootstrap-datepicker.js"></script>
        <script>
            $('.datepicker').datepicker();
            $.fn.datepicker.defaults.format = "yyyy-mm-dd";
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

            <div  id="bene" class="alert alert-success fade in" hidden="true">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Operazione Completata</strong> -  Nuovo utente aggiunto nel sistema.
            </div>

            <div  id="error" class="alert alert-danger fade in" hidden="true">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Operazione Fallita</strong> -  Errore nell'aggiunta del nuovo utente nel sistema.
            </div>

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
                    <div class="col-lg-10">
                        <h1 class="page-header">Gestione Utenti</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Aggiungi Nuovo Utente
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-8" >
                                        <form role="form" action="RegisterServlet" method="POST">
                                            <div class="form-group">
                                                <label>Inserisci il nome dell'utente</label>
                                                <input class="form-control" name="firstName" placeholder="Inserisci il nome">
                                            </div>
                                            <div class="form-group">
                                                <label>Inserisci il cognome dell'utente</label>
                                                <input class="form-control" name="lastName" placeholder="Inserisci il cognome dell'utente">
                                            </div>
                                            <div class="form-group">
                                                <label>Inserisci il nome utente</label>
                                                <input class="form-control" name="userId" placeholder="Inserisci il nome utente">
                                                <input class="form-control" name="check" id="checkUpdate" type="hidden" value="false">
                                            </div>
                                            <div align="center">
                                                <input type="button" value ='Genera Password' class="btn btn-primary" onclick='document.getElementById("p").value = Password.generate(16)'>
                                                <input type='text' id='p' name="password"/><br/>                                               
                                            </div>
                                            <br>

                                            <div class="form-group">
                                                <label>Inserisci il ruolo dell'utente</label>
                                                <select class="form-control" name="role">
                                                    <option value=""></option>
                                                    <option value="admin">Amministratore</option>
                                                    <option value="client">Cliente</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Seleziona l'univerist� dell'utente</label>
                                                <select class="form-control" name="uni">
                                                    <c:forEach items="${uniList}" var="uni">
                                                        <option value="${uni}">${uni}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Inserisci il periodo di validit� dell'account</label> &nbsp; &nbsp;
                                                <input data-provide="datepicker" name="date">
                                            </div> 
                                            <div align="center">
                                                <input type="submit" value="Submit" class="btn btn-primary">
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <script>
            function checkError() {

                var check = '<%= session.getAttribute("check")%>';

                if (check === 'ok') {
                    document.getElementById("bene").style.display = 'block';
                    document.getElementById("error").style.display = 'none';
                } else if (check === 'no') {
                    document.getElementById("bene").style.display = 'none';
                    document.getElementById("error").style.display = 'block';
                } else {
                    document.getElementById("error").style.display = 'none';
                    document.getElementById("bene").style.display = 'none';
                }
            }
            checkError();
        </script>
    </body>

</html>
