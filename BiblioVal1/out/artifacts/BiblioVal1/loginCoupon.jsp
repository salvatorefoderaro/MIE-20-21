<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Login Page</title>

    <link href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="bootstrap/dist/js/sb-admin-2.js"></script>
    <script src="bootstrap/js/jquery.cookie.min.js"></script>
    <script src="bootstrap/jquery.bsAlerts.min.js"></script>

</head>

<%

    if(request.getParameter("submit") != null){

        try {
            Class.forName("com.mysql.jdbc.Driver");  //load driver

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/osservatorio_biblioval?autoReconnect=true", "root", "Foderaro95"); // create connection

            PreparedStatement ps = con.prepareStatement("SELECT * FROM COUPON WHERE id = ? AND scadenza >= NOW()");

            ps.setString(1, request.getParameter("couponId"));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                PreparedStatement pstmt = null; //create statement

                pstmt = con.prepareStatement("DELETE FROM COUPON WHERE id = ?;"); //sql update query
                pstmt.setString(1, request.getParameter("couponId"));

                pstmt.executeUpdate(); //execute query

                con.close(); //connection close

                session.setAttribute("userId", request.getParameter("couponId"));
                response.sendRedirect("client.jsp");

            } else {

                out.println("COUPON NON CORRETTO.");

            }
        } catch(Exception e)
        {
            out.println("ERRORE NELL'ELIMINAZIONE DELLA LICENZA.");
        }

    }
%>

<body>

<div  id="error" class="alert alert-danger fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Login fallito</strong> -  Nome Utente e/o Password errati.
</div>

<div  id="scaduto" class="alert alert-danger fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Sessione scaduta</strong> - Il tuo account � scaduto! Contatta un amministratore per il rinnovo.
</div>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form method="post" action="loginCoupon.jsp" role="form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" name="couponId" title="Username" size="30" maxlength="50" placeholder="User Id" autofocus/>
                            </div>
                            <input class="btn btn-lg btn-success btn-block" name="submit" type="submit" value="Login" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function checkError(){
        if(${error2 == "errore"}) {
            document.getElementById("error").style.display = 'block';
        }
        else  {
            document.getElementById("error").style.display = 'none';
        }

        if(${error2 == "scaduto"}) {
            document.getElementById("scaduto").style.display = 'block';
        }
        else {
            document.getElementById("scaduto").style.display = 'none';
        }
    }
    checkError();
</script>
<!-- jQuery -->

</body>
</html>
