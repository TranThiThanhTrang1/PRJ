<%-- 
    Document   : login
    Created on : 30-10-2022
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <h1>Login information</h1>       
        <form action="MainController" method="POST">
            User ID:<input type="text" name="userID" /></br>
            Password:<input type="password" name="password" /></br>
            <input type="submit" name="action" value="Login" />
            <input type="reset" value="Reset" />
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
    
</html>

