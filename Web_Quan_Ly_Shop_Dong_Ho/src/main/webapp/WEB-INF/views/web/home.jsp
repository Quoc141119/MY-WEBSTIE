<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Place favicon.ico in the root directory -->
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    
    <%@ include file="/common/web/taglib.jsp" %>
    
</head>
<body>
	<div class="wrapper">
	<!-- Header -->
	<%@ include file="/common/web/header.jsp" %>
        <!-- Start Slider Area -->
        <div class="slider__container slider--one bg__cat--3">
            <div class="slide__container slider__activation__wrap owl-carousel">
                <!-- Start Single Slide -->
                <div class="single__slide animation__style01 slider__fixed--height">
                    <div class="container">
                        <div class="row align-items__center">
                            <div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
                                <div class="slide">
                                    <div class="slider__inner">
                                        <h2>collection 2020</h2>
                                        <h1>NICE CHAIR</h1>
                                        <div class="cr__btn">
                                            <a href="${pageContext.request.contextPath}/supplier/list">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
                                <div class="slide__thumb">
                                    <img src="<c:url value='/static/images/slider/fornt-img/1.jpg'/>" alt="slider images">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single Slide -->
                <!-- Start Single Slide -->
                <div class="single__slide animation__style01 slider__fixed--height">
                    <div class="container">
                        <div class="row align-items__center">
                            <div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
                                <div class="slide">
                                    <div class="slider__inner">
                                        <h2>collection 2020</h2>
                                        <h1>NICE CHAIR</h1>
                                        <div class="cr__btn">
                                            <a href="${pageContext.request.contextPath}/category/list">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
                                <div class="slide__thumb">
                                    <img src="<c:url value='/static/images/slider/fornt-img/2.jpg'/>" alt="slider images">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single Slide -->
            </div>
        </div>
        <!-- Start Slider Area -->
        <!-- Start Category Area -->
        <section class="htc__category__area ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">New Arrivals</h2>
                            <p>The UK's Largest Independent Online Watch Shop</p>
                        </div>
                    </div>
                </div>
                <div class="htc__product__container">
                    <div class="row">
                        <div class="product__list clearfix mt--30">
                            <!-- Start Single Category -->
							<c:if test="${not empty lstProductsNew}">
								<c:forEach var="product" items="${lstProductsNew }">
									<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
										<div class="category">
											<div class="ht__cat__thumb">
												<a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}"> <img
													src="<c:url value='${product.getImage()}'/>"
													alt="product images">
												</a>
											</div>
											<div class="fr__hover__info">
												<ul class="product__action">
													<li><a href="${pageContext.request.contextPath}/wishlist/add?id=${product.getProductID()}"><i
															class="icon-heart icons"></i></a></li>

													<li><a href="${pageContext.request.contextPath}/cart/add?id=${product.getProductID()}"><i
															class="icon-handbag icons"></i></a></li>

												</ul>
											</div>
											<div class="fr__product__inner">
												<h4>
													<a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">${product.getProductName()}</a>
												</h4>
												<ul class="fr__pro__prize">
													<li class="old__prize">$${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
													<li style="color: red;">(&darr;${product.getDiscount()}%)</li>
												</ul>
												<p>($<strike>${product.getPrice()}</strike>)</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<!-- End Single Category -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Category Area -->
        <!-- Start Prize Good Area -->
        <section class="htc__good__sale bg__cat--3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                        <div class="fr__prize__inner">
                            <h2>Be the first to know</h2>
                            <h3>Discover how to find the best watch and enjoy exclusive products and offers</h3>
                            <a class="fr__btn" href="#">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                        <div class="prize__inner">
                            <div class="prize__thumb">
                                <img src="<c:url value='/static/images/banner/big-img/1.jpg'/>" alt="banner images">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Prize Good Area -->
        <!-- Start Product Area -->
        <section class="ftr__product__area ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">Best Seller</h2>
                            <p>But I must explain to you how all this mistaken idea</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product__wrap clearfix">
						<c:if test="${not empty lstProductTopSell}">
							<c:forEach var="product" items="${lstProductTopSell }">
								<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
									<div class="category">
										<div class="ht__cat__thumb">
											<a
												href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">
												<img src="<c:url value='${product.getImage()}'/>"
												alt="product images">
											</a>
										</div>
										<div class="fr__hover__info">
											<ul class="product__action">
												<li><a
													href="${pageContext.request.contextPath}/wishlist/add?id=${product.getProductID()}"><i
														class="icon-heart icons"></i></a></li>

												<li><a
													href="${pageContext.request.contextPath}/cart/add?id=${product.getProductID()}"><i
														class="icon-handbag icons"></i></a></li>

											</ul>
										</div>
										<div class="fr__product__inner">
											<h4>
												<a
													href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">${product.getProductName()}</a>
											</h4>
											<ul class="fr__pro__prize">
												<li class="old__prize">$${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
												<li style="color: red;">(&darr;${product.getDiscount()}%)</li>
											</ul>
											<p>
												($<strike>${product.getPrice()}</strike>)
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
                </div>
            </div>
        </section>
        <!-- End Product Area -->
        <!-- Start Testimonial Area -->
        <section class="htc__testimonial__area bg__cat--4">
            <div class="container">
                <div class="row">
                    <div class="ht__testimonial__activation clearfix">
                        <!-- Start Single Testimonial -->
                        <div class="col-lg-6 col-md-6 single__tes">
                            <div class="testimonial">
                                <div class="testimonial__thumb">
                                    <img src="<c:url value='/static/images/test/client/1.jpg'/>" alt="testimonial images">
                                </div>
                                <div class="testimonial__details">
                                    <h4><a href="#">Mr.Mike Band</a></h4>
                                    <p>I’m up to something. Stay focused. The weather is amazing, walk with me through the pathway of more success. </p>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                        <!-- Start Single Testimonial -->
                        <div class="col-lg-6 col-md-6 single__tes">
                            <div class="testimonial">
                                <div class="testimonial__thumb">
                                    <img src="<c:url value='/static/images/test/client/2.jpg'/>" alt="testimonial images">
                                </div>
                                <div class="testimonial__details">
                                    <h4><a href="#">Ms.Lucy Barton</a></h4>
                                    <p>I’m up to something. Stay focused. The weather is amazing, walk with me through the pathway of more success. </p>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                        <!-- Start Single Testimonial -->
                        <div class="col-lg-6 col-md-6 single__tes">
                            <div class="testimonial">
                                <div class="testimonial__thumb">
                                    <img src="<c:url value='/static/images/test/client/1.jpg'/>" alt="testimonial images">
                                </div>
                                <div class="testimonial__details">
                                    <h4><a href="#">Ms.Lucy Barton</a></h4>
                                    <p>I’m up to something. Stay focused. The weather is amazing, walk with me through the pathway of more success. </p>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                        <!-- Start Single Testimonial -->
                        <div class="col-lg-6 col-md-6 single__tes">
                            <div class="testimonial">
                                <div class="testimonial__thumb">
                                    <img src="<c:url value='/static/images/test/client/2.jpg'/>" alt="testimonial images">
                                </div>
                                <div class="testimonial__details">
                                    <h4><a href="#">Ms.Lucy Barton</a></h4>
                                    <p>I’m up to something. Stay focused. The weather is amazing, walk with me through the pathway of more success. </p>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Testimonial Area -->
        <!-- Start Brand Area -->
        <div class="htc__brand__area bg__cat--4">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="ht__brand__inner">
                            <ul class="brand__list owl-carousel clearfix">
                                <li><a href="#"><img src="<c:url value='/static/images/brand/1.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/2.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/3.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/4.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/5.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/5.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/1.png'/>" alt="brand images"></a></li>
                                <li><a href="#"><img src="<c:url value='/static/images/brand/2.png'/>" alt="brand images"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Brand Area -->
        <!-- End Banner Area -->
     <!-- Footer -->
     <%@ include file="/common/web/footer.jsp" %>
     </div>
     
     <%@ include file="/common/web/scriptslib.jsp" %>
</body>
</html>