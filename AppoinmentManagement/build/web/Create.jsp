<%-- 
    Document   : Create
    Created on : Aug 21, 2024, 12:47:53 PM
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
        <form action="MainController" method="POST">
            account : <input type="text" name="account" value="${sessionScope.usersession.account}" readonly=""> </br>
            partner Phone : <input type="number" name="partnerPhone" required=""> </br>
            partner Name : <input type="text" name="partnerName" required=""> </br>
            time To Meet : <input type="date" name="timeToMeet" required="" > </br>
            place : <input type="text" name="place" required=""> </br>
            expense : <input type="number" name="expense" required=""> </br>
            note : <input type="text" name="note" > </br>
            <input type="submit" name="action" value="create">
        </form>

    </body>
</html>
