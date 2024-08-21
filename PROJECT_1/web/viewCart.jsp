<%-- 
    Document   : viewCart
    Created on : Jun 15, 2024, 2:03:51 PM
    Author     : Admin
--%>

<%@ page import="java.util.Date" %>
<%@page import="sample.product.Product"%>
<%@page import="sample.product.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Duyen Official</title>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">

        <!-- font awesome cdn link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <!-- custom css file link -->
        <link rel="stylesheet" href="css/viewCart.css">

    </head>
    <body>
        <!-- header section starts -->
        <header>

            <a href="MainController?action=Shopping_Page" class="logo"><i class="fas fa-cart-plus"></i>MyDuyenLuxury.</a>

            <<div class="icons">
                <i class="fas fa-bars" id="menu-bars"></i>
                <i class="fas fa-search" id="search-icon"></i>          
                <a href="MainController?action=View" class="fas fa-shopping-cart"></a>    
            </div>


        </header>

        <!-- header section ends -->


        <!-- menu section starts -->
        <section class="menu" id="menu">
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>

            <c:set var="cart" value="${sessionScope.CART}" />
            <c:if test="${not empty sessionScope.CART}">
                <h3 class="sub-heading">Our Stationary</h3>
                <h1 class="heading">All Products</h1>

                <div class="box-container">
                    <c:forEach items="${cart.cart.values()}" var="product">
                        <form action="MainController" class="box" method="POST">
                            <div class="image">
                                <img src="images/eat2.jpg" alt="">
                                <a href="#" class="fas fa-heart"></a>
                            </div>
                            <div class="content">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <h3>${product.id}</h3>
                                <h3>${product.name}</h3>
                                <p><input type="number" name="quantity" value="${product.getQuantity()}" required></p>
                                <p><a href="MainController?action=Remove&id=${product.getId()}">Delete</a></p>
                                <button type="submit" class="btn" name="action" value="UpdateProduct">
                                    <i class="fas fa-cart-plus"></i> Update Cart
                                    <input type="hidden" name="cartID" value="${product.getId()}">
                                </button>
                                <span class="price">$${product.price}</span>
                            </div>
                        </form>
                    </c:forEach>              
                </div>
                <p>Order date: <%= (new Date()).toString()%></p>
                <form action="MainController" >
                    <input type="submit" class="btn" name="action" value="CheckoutProduct" />
                </form>
            </c:if>

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



        <!-- footer section ends -->



        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

        <!-- custom js file link -->
        <script src="js/script.js"></script>


        <a href="shopping.jsp" >Add more</a>
    </body>

</html>


