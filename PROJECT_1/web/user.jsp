<%@page import="sample.product.ProductError"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">

        <!-- font awesome cdn link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <!-- custom css file link -->
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>

        <!-- header section starts -->
        <header>

            <a href="MainController?action=Shopping_Page" class="logo"><i class="fas fa-cart-plus"></i>MyDuyenLuxury.</a>

            <nav class="navbar">
                <a class="active" href="#home">home</a>
                <a href="#about">about</a>
                <a href="#menu">menu</a>
                <a href="#review">review</a>
            </nav>

            <<div class="icons">
                <i class="fas fa-bars" id="menu-bars"></i>           
                <a href="MainController?action=View" class="fas fa-shopping-cart"></a>    
            </div>


        </header>

        <!-- header section ends -->

        <!-- menu section starts -->
        <section class="form-container">
                     
            
            <a href="MainController?action=logout" class="btn">Logout</a>
            
            <form action="">
                <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
                <h3>user's information</h3>
                
                <p class="box">User ID: <c:out value="${sessionScope.LOGIN_USER.userID}" /></p>
                </br>
                <p class="box">Full Name: <c:out value="${sessionScope.LOGIN_USER.fullName}" /></p>
                </br>
                <p class="box">Role ID: <c:out value="${sessionScope.LOGIN_USER.roleID}" /></p>
                </br>
                <p class="box">Password: <c:out value="***" /></p>
                </br>>
                
            </form>
           
        </section>
            
   


        <!-- menu section ends -->
        
        

        <!-- footer section starts -->

        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3>locations</h3>
                    <a href="#">india</a>
                    <a href="#">japan</a>
                    <a href="#">russia</a>
                    <a href="#">USA</a>
                    <a href="#">france</a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="#">home</a>
                    <a href="#">about</a>
                    <a href="#">menu</a>
                    <a href="#">review</a>
                </div>

                <div class="box">
                    <h3>contact info</h3>
                    <a href="#">+123-456-7890</a>
                    <a href="#">+111-222-3333</a>
                    <a href="#">shaikhanas@gmail.com</a>
                    <a href="#">anasbhai@gmail.com</a>
                    <a href="#">mumbai, india - 400104</a>
                </div>

            </div>

            <div class="credit"> copyright @ 2021 by <span>mr. web designer</span></div>


        </section>

        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

        <!-- custom js file link -->
        <script src="js/script.js"></script>

    </body>
</html>
