<%-- 
    Document   : UserLogout
    Created on : 6 May, 2019, 10:04:55 AM
    Author     : Sanya Dhall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("home2.jsp");
            
            
            %>
    </body>
</html>
