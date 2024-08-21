<%-- 
    Document   : login
    Created on : May 29, 2024, 2:30:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <!-- font awesome cdn link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <!-- custom css file link -->
        <link rel="stylesheet" href="css/components.css">
    </head>
    <body>
        <section class="form-container"> 
            <form action="MainController" method="POST">
                <h3>Sign in</h3>
                <p class="">Don't have an account? <a href="MainController?action=Create_Page">Sign up</a></p>
                <span>UserID</span>
                <input type="text" name="userID" class="box" placeholder="enter your ID" required/>
                </br><span>Password</span>
                <input type="password" name="password" class="box" placeholder="enter your password" required />
                </br>
                <input type="submit" name="action" class="btn" value="Login" />

                <a href="MainController?action=Shopping_Page">My Duyen Luxury Store </a>
            </form>
            
        </section>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error== null) error="";
        %>
        <%= error %>
    </body>
</html>
