<%@page import="sample.product.ProductError"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>

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
                <i class="fas fa-search" id="search-icon"></i>           
                <a href="MainController?action=View" class="fas fa-shopping-cart"></a>    
            </div>


        </header>

        <!-- header section ends -->

        <!-- search form -->
        <form action="MainController" id="search-form">
            <input type="search" placeholder="search here...." id="search-box" name="search" value="${param.search}">
            <label for="search-box" ></label>
            <i class="fas fa-times" id="close"></i>
            <button type="submit" class="btn" name="action" value="Search" >Search</button>
        </form>

        <!-- menu section starts -->
        <section class="menu" id="menu">
            
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            
            <h3 class="sub-heading">User</h3>
            <h1 class="heading">table user</h1>

            <a href="MainController?action=logout" class="btn">Logout</a>

            <c:if test="${not empty requestScope.LIST_USER}">
                <table class="content-table" border="1">
                    <thead>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Update</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.LIST_USER}" var="user" >
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${user.userID}</td>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullName}" required>
                                </td>
                                <td>
                                    <input type="text" name="roleID" value="${user.roleID}" required>
                                </td>
                                <td>${user.password}</td>
                                <td>
                                    <a href="MainController?action=Delete&userID=${user.userID}&search=${param.search}">Delete</a>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Update"/>
                                    <input type="hidden" name="userID" value="${user.userID}">
                                    <input type="hidden" name="search" value="${param.search}">
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${not empty requestScope.ERR}">
                <h2>${requestScope.ERR}</h2>
            </c:if>

        </section>


        <!-- menu section ends -->
        
        <!--create product-->
        
        <section class="form-container">
            
            <%
                ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                if (productError == null) {
                    productError = new ProductError();
                }
            %>
            <form action="MainController" method="POST">
                <h3>Create Product</h3>
                <input type="text" name="productID" class="box" placeholder="enter product ID" required="" />
                <p class="error-message">ID error: <%= productError.getIdError() %></p>
                </br>
                <input type="text" name="productName" class="box" placeholder="enter product name" required="" />
                <p class="error-message">Name error <%= productError.getNameError() %></p>
                </br>
                <input type="number" name="productPrice" class="box" placeholder="enter product price" required="" />
                <p class="error-message">Price error: <%= productError.getPriceError() %></p>
                </br>
                <input type="number" name="quantity" class="box" placeholder="enter product" required="" />
                <p class="error-message">Quantity error: <%= productError.getQuantityError() %></p>
                </br>
                <input type="submit" name="action" class="btn" value="CreateProduct" />
                <input type="reset" value="Reset" class="btn" />
                <p class="error-message">Product error: <%= productError.getError() %></p>
                
            </form>
           
        </section>

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