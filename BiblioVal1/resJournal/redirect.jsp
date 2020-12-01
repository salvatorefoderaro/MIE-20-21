<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.http.HttpClient" %>

<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Using GET and POST Method to Read Form Data</title>
    <meta charset="UTF-8">
</head>

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

    <script type="text/javascript">
        $(document).ready(function(){
        /// here you can put all the code that you want to run after page load
            $.post( "../admin/UniAdu", { uni :             "<%= request.getParameter("uni")%>" } ) .done(function( data ) {
                    window.location.replace("<%= request.getParameter("page")%>");
            });;
    });
</script>



<body>

</body>
</html>