<%-- 
    Document   : appoinment
    Created on : Aug 21, 2024, 12:13:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>${sessionScope.usersession.fullName}</div>
        <a href="MainController?action=logout">LOGOUT</a>
        <a href="Create.jsp">CREATE</a>
        
    </body>
</html>
