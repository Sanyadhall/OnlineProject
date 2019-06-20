<%-- 
    Document   : Logout
    Created on : 1 May, 2019, 12:44:11 PM
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
            response.sendRedirect("index1.jsp");
            
            
            %>
    </body>
</html>
