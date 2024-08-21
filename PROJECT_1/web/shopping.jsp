<%@page import="java.util.List"%>
<%@page import="sample.product.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Food Website Design Tutorial</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">

    <!-- font awesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- custom css file link -->
    <link rel="stylesheet" href="css/shopping.css">

</head>
<body>
    <!-- header section starts -->
    <header>

        <a href="#" class="logo"><i class="fas fa-cart-plus"></i>MyDuyenLuxury.</a>

        <nav class="navbar">
            <a class="active" href="#home">home</a>
            <a href="#about">about</a>
            <a href="#menu">menu</a>
            <a href="#review">review</a>
        </nav>

        <div class="icons">  
            <i class="fas fa-bars" id="menu-bars"></i>
            <c:choose>
                <c:when test="${sessionScope.LOGIN_USER == null}">
                    <a href="login.html" class="fas fa-users"></a>
                </c:when>
                <c:when test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                    <a href="admin.jsp" class="fas fa-users"></a>
                </c:when>
                <c:otherwise>
                    <a href="user.jsp" class="fas fa-users"></a>
                </c:otherwise>
            </c:choose>
            <i class="fas fa-search" id="search-icon"></i>         
            <a href="MainController?action=View" class="fas fa-shopping-cart"></a>    
        </div>


    </header>

    <!-- header section ends -->

     <!--search form--> 
    
    <form action="" id="search-form">
        <input type="search" placeholder="search here...." id="search-box">
        <label for="search-box" class="fas fa-search"></label>
        <i class="fas fa-times" id="close"></i>
    </form>

    <!-- home section starts -->
    <section class="home" id="home">
        <c:if test="${not empty LIST3}">
            <div class="swiper-container home-slider">
                <div class="swiper-wrapper wrapper">
                    <c:forEach items="${LIST3}" var="product">
                        <div class="swiper-slide slide">
                            <div class="content">
                                <span>Top 3</span>
                                <h3>${product.name}</h3>
                                <p>Lorem...</p>
                                <a href="#" class="btn">order now</a>
                            </div>
                            <div class="image">
                                <img src="images/image1.jpg" alt="${product.name}">
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </c:if>
    </section>

    <!-- home section ends -->


    <!-- about section starts -->
     <section class="about" id="about">

        <h3 class="sub-heading"> about us</h3>
        <h1 class="heading"> why choose us</h1>

        <div class="row">

            <div class="image">
                <img src="images/eat1.jpg" alt="">
            </div>

            <div class="content">
                <h3>best stationary in the country</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium quia, blanditiis possimus expedita optio facilis repellat tempora et ut ad alias nam consequuntur ratione harum veniam dolorem ducimus explicabo. Sapiente?</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, magnam. Eligendi minus cupiditate tempore deleniti suscipit neque, cum animi tenetur atque nam earum exercitationem vero voluptates adipisci aut itaque temporibus.</p>
                <div class="icons-container">
                    <div class="icons">
                        <i class="fas fa-shipping-fast"></i>
                        <span>free delivery</span>
                    </div>
                    <div class="icons">
                        <i class="fas fa-dollar-sign"></i>
                        <span>easy payments</span>
                    </div>
                    <div class="icons">
                        <i class="fas fa-headset"></i>
                        <span>24/7 service</span>
                    </div>
                </div>
                <a href="#" class="btn">learn more</a>
            </div>

        </div>

     </section>

     <!-- about section ends -->

     <!-- menu section starts -->

     <section class="menu" id="menu">
         <h3 class="sub-heading">Our Stationary</h3>
         <h1 class="heading">All Products</h1>

         <c:if test="${not empty LIST}">
             <div class="box-container">
                 <c:forEach items="${LIST}" var="product">
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
                             <p>${product.quantity}</p>
                             <h3>Quantity:</h3><span><input type="number" name="quantity" ></span>
                             <button type="submit" class="btn" name="action" value="Add">
                                 <i class="fas fa-cart-plus"></i> Add to Cart
                                 <input type="hidden" name="id" value="${product.id}">
                             </button>
                             
                             <span class="price">$${product.price}</span>
                         </div>
                     </form>
                 </c:forEach>
             </div>
         </c:if>
     </section>

     <!-- menu section ends -->

     <!-- review section starts -->

     <section class="review" id="review">

        <h3 class="sub-heading"> customer's review </h3>
        <h1 class="heading"> what they say </h1>

        <div class="swiper-container review-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/luffy.jpg" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Placeat voluptas reiciendis amet consequuntur ex, eligendi blanditiis a voluptates aperiam velit aut nulla in impedit excepturi, labore, cumque dolorem. Ducimus, deserunt.</p>

                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/eat2.jpg" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Placeat voluptas reiciendis amet consequuntur ex, eligendi blanditiis a voluptates aperiam velit aut nulla in impedit excepturi, labore, cumque dolorem. Ducimus, deserunt.</p>

                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/eat2.jpg" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Placeat voluptas reiciendis amet consequuntur ex, eligendi blanditiis a voluptates aperiam velit aut nulla in impedit excepturi, labore, cumque dolorem. Ducimus, deserunt.</p>

                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/eat2.jpg" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Placeat voluptas reiciendis amet consequuntur ex, eligendi blanditiis a voluptates aperiam velit aut nulla in impedit excepturi, labore, cumque dolorem. Ducimus, deserunt.</p>

                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/eat2.jpg" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Placeat voluptas reiciendis amet consequuntur ex, eligendi blanditiis a voluptates aperiam velit aut nulla in impedit excepturi, labore, cumque dolorem. Ducimus, deserunt.</p>

                </div>

            </div>

        </div>

     </section>

     <!-- review section ends -->


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


    <!-- footer section ends -->




    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- custom js file link -->
    <script src="js/script.js"></script>

</body>
    <% String message = (String) request.getAttribute("MESSAGE");
        if (message == null) {
            message = "";
        }
    %>
    <%= message%>
    
</html>
