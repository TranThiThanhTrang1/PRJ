<%-- 
    Document   : create
    Created on : Jun 12, 2024, 1:43:41 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register-error</title>
        
        <!-- font awesome cdn link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        
        <!-- custom css file link -->
        <link rel="stylesheet" href="css/components.css">
        
    </head>
    <body>
        <section class="form-container">
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
            <form action="MainController" method="POST">
                <h3>register now</h3>
                <span>UserID</span>
                <input type="text" name="userID" class="box" placeholder="enter your ID" required="" /><%= userError.getUserIDError() %>
                </br><span>Fullname<span>
                <input type="text" name="fullName" class="box" placeholder="enter your name" required="" /><%= userError.getFullNameError() %>
                </br><span>Role ID</span>
                <select>
                    <option value="US">US</option>
                    <option value="AD">AD</option>
                </select>
                </br><span>Password</span>
                <input type="password" name="password" class="box" placeholder="enter your password" required="" />
                </br><span>Confirm</span>
                <input type="password" name="confirm" class="box" placeholder="confirm your pasword" required="" /><%= userError.getConfirmError() %>
                </br>
                <input type="submit" name="action" class="btn" value="Create" />
                <input type="reset" value="Reset" class="btn" /><%= userError.getError() %>

                <p>already have an account? <a href="login.jsp">login now</p>
            </form>
           
        </section>
    </body>
</html>
