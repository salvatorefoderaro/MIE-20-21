<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bootstrap/js/jquery.cookie.min.js"></script>
        <title>logout Page</title>

        <script>
            function replace() {
                window.location.replace("login.jsp");
            }
            function deleteAllCookies() {
                $.cookie('performanceIndividualiList', "", {expires: -1});
                $.cookie('inatAttList', "", {expires: -1});
                $.cookie('aduBiblio', "", {expires: -1});
                $.cookie('nonBiblio', "", {expires: -1});
                $.cookie('mediaAdu', "", {expires: -1});
                $.cookie('perfSsdList', "", {expires: -1});
                $.cookie('aduList', "", {expires: -1});
                $.cookie('quartiliList', "", {expires: -1});
                $.cookie('perfAduList', "", {expires: -1});
                replace();
            }
            deleteAllCookies();
        </script>
    </head>
    <body>
        <%
            session.removeAttribute("userId");
            session.removeAttribute("role");
            session.removeAttribute("selectedUni");
            session.removeAttribute("uniList");
            session.invalidate();
        %>

    </body>
</html>