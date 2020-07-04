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
		
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<c:url value='/static/images/bg/bg.jpg' />) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.html">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <a class="breadcrumb-item" href="product-grid.html">Products</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">ean shirt</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Product Details Area -->
        <section class="htc__product__details bg__white ptb--100">
            <c:if test="${not empty product }">
            	<!-- Start Product Details Top -->
            <div class="htc__product__details__top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                            <div class="htc__product__details__tab__content">
                                <!-- Start Product Big Images -->
                                <div class="product__big__images">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                            <img style="width: 100%;" src="<c:url value='${product.getImage()}'/>" alt="full-image">
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product Big Images -->
                                
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="ht__product__dtl">
                                <h2>${product.getProductName()}</h2>
                                <hr>
                                <c:if test="${product.getQuantity() == 0}">
                                	 <h6>Quantity: <span style="color:red;">&emsp;&nbsp;(Tạm hết hàng)</span></h6>
                                </c:if>
                                <c:if test="${product.getQuantity() != 0}">
                                	 <h6>Quantity: <span>&emsp;&nbsp;${product.getQuantity()}</span></h6>
                                </c:if>
                                <h6>Old Price: <span>&emsp;&nbsp;$${product.getPrice()}</span></h6>
                                <h6>New Price: 
                                <span>&emsp;$${product.getPrice() - product.getPrice()*product.getDiscount()/100}</span>
                                <span style="color: red;">(&darr;${product.getDiscount()}%)</span>
                                </h6>
                                <h6>Description: <span>${product.getDescription()}</span></h6>
                                
                                <div class="ht__pro__desc">
                                    <div class="sin__desc">
                                        <p><span></span></p>
                                    </div>
                                    <div class="sin__desc align--left">
                                        <ul class="shopping__btn">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/cart/add?id=${product.getProductID()}">Add to card</a>
                                            </li>
                                        </ul>
                                    </div>                              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product Details Top -->
            </c:if>
        </section>
        <!-- End Product Details Area -->
   
        <!-- Start Product Area -->
        <section class="htc__product__area--2 pb--100 product-details-res">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">New Arrivals</h2>
                            <p>But I must explain to you how all this mistaken idea</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product__wrap clearfix">         
                      	<c:if test="${not empty lstProductsNew}">
							<c:forEach var="product" items="${lstProductsNew }">
							<!-- Start Single Product -->
                        <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                            <div class="category">
                                <div class="ht__cat__thumb">
                                    <a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">
                                        <img src="<c:url value='${product.getImage()}'/>" alt="product images">
                                    </a>
                                </div>
                                <div class="fr__hover__info">
                                    <ul class="product__action">
                                        <li><a href="${pageContext.request.contextPath}/wishlist/add?id=${product.getProductID()}"><i class="icon-heart icons"></i></a></li>

                                        <li><a href="${pageContext.request.contextPath}/cart/add?id=${product.getProductID()}"><i class="icon-handbag icons"></i></a></li>
                                    </ul>
                                </div>
                                <div class="fr__product__inner">
                                    <h4><a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">${product.getProductName()}</a></h4>
                                    <ul class="fr__pro__prize">
										<li class="old__prize">${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
										<li style="color: red;">(&darr;${product.getDiscount()}%)</li>
									</ul>
									<p>($<strike>${product.getPrice()}</strike>%)</p>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Product -->
							</c:forEach>
						</c:if>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Area -->
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
		
		<!-- Footer -->
     	<%@ include file="/common/web/footer.jsp" %>
     </div>
     
     <%@ include file="/common/web/scriptslib.jsp" %>
</body>
</html>