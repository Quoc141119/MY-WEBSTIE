<%@page import="java.util.ArrayList"%>
<%@page import="com.shopdongho.model.ProductModel"%>
<%@page import="java.util.List"%>
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
                                  <span class="breadcrumb-item active">Products</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- Start Product Grid -->
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
                        <div class="htc__product__rightidebar">
                            <div class="htc__grid__top">
                                <form class="form-inline" action="${pageContext.request.contextPath}/supplier/search" method="get">
                                    <label for="search" class="mb-2 mr-sm-2">Search:</label>
                                    <input type="text" class="form-control mb-2 mr-sm-2" id="name" placeholder="Enter name" name="name">
                                    <button type="submit" class="btn btn-primary mb-2">Submit</button>
                                </form>
                                <!-- Start List And Grid View -->
                                <ul class="view__mode" role="tablist">
                                    <li role="presentation" class="grid-view active"><a href="#grid-view" role="tab" data-toggle="tab"><i class="zmdi zmdi-grid"></i></a></li>
                                    <li role="presentation" class="list-view"><a href="#list-view" role="tab" data-toggle="tab"><i class="zmdi zmdi-view-list"></i></a></li>
                                </ul>
                                <!-- End List And Grid View -->
                            </div>
                            <!-- Start Product View -->
                            <div class="row">
                                <div class="shop__grid__view__wrap">
                                    <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
										<c:if test="${not empty lstProduct}">
											<c:forEach var="product" items="${lstProduct}">
												<div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
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
																<li class="old__prize">${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
																<li style="color: red;">(&darr;${product.getDiscount()}%)</li>
															</ul>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
                                    <div role="tabpanel" id="list-view" class="single-grid-view tab-pane fade clearfix">
                                        <div class="col-xs-12">
                                            <div class="ht__list__wrap">
                                            <c:if test="${not empty lstProduct}">
												<c:forEach var="product" items="${lstProduct}">
                                                <!-- Start List Product -->
                                                <div class="ht__list__product">
                                                    <div class="ht__list__thumb">
                                                        <a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">
                                                        <img src="<c:url value='${product.getImage()}'/>" alt="product images"></a>
                                                    </div>
                                                    <div class="htc__list__details">
                                                        <h2><a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">${product.getProductName()}</a></h2>
                                                        <ul  class="pro__prize">
                                                            <li class="old__prize">$${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
                                                            <li style="color: red;">(&darr;${product.getDiscount()}%)</li>
                                                        </ul>
                                                        <div class="fr__list__btn">
                                                            <a class="fr__btn" href="${pageContext.request.contextPath}/cart/add?id=${product.getProductID()}">Add To Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End List Product -->
                                                </c:forEach>
											</c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Product View -->
                        </div>
                        <!-- Start Pagenation -->
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="htc__pagenation">
                                <%
                                	List<ProductModel> lst = (ArrayList<ProductModel>)request.getAttribute("kqProducts");
                                	int a, b;
                                	int limit = lst.size() / 9;
                                	if(limit*9 < lst.size()){
                                		limit +=1;
                                	}
                                	for (int i = 1; i <= limit; i++){
                                		a = (i - 1) * 9;
                                		b = i * 9;
                                		if(b > lst.size()){
                                			b = lst.size();
                                		}
                                	
                                	%>
                                   	<li><a href="${pageContext.request.contextPath}/supplier/list?start=<%=a%>&end=<%=b%>"><%= i %></a></li> 
                                   <%} %>
                                </ul>
                            </div>
                        </div>
                        <!-- End Pagenation -->
                    </div>
                    <div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
                        <div class="htc__product__leftsidebar">
                            <!-- Start Category Area -->
                            <div class="htc__category">
                                <h4 class="title__line--4">Suppliers</h4>
                                <ul class="ht__cat__list">
                                <li><a href="${pageContext.request.contextPath}/supplier/list">Tất cả</a></li>
                                    <c:if test="${not empty lstSupplier}">
                                    	<c:forEach var="supplier" items="${lstSupplier}">
                                    		<li><a href="${pageContext.request.contextPath}/supplier/list?id=${supplier.getSupplierID()}">${ supplier.getSupplierName() }</a></li>
                                    	</c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- End Category Area -->             
                            <!-- Start Best Sell Area -->
                            <div class="htc__recent__product">
                                <h2 class="title__line--4">best seller</h2>
                                <div class="htc__recent__product__inner">
									<c:if test="${not empty lstProductTopSell}">
										<c:forEach var="product" items="${lstProductTopSell }">
											<div class="htc__best__product">
												<div class="htc__best__pro__thumb">
													<a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}"> <img
														src="<c:url value='${product.getImage()}'/>" alt="small product">
													</a>
												</div>
												<div class="htc__best__product__details">
													<h2>
														<a href="${pageContext.request.contextPath}/product/details?id=${product.getProductID()}">${product.getProductName()}</a>
													</h2>

													<ul class="pro__prize">
														<li style="font-size: 13px;" class="old__prize">$${product.getPrice() - product.getPrice()*product.getDiscount()/100}</li>
														<li style="color: red; font-size: 12px;">(&darr;${product.getDiscount()}%)</li>
													</ul>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
                            </div>
                            <!-- End Best Sell Area -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Grid -->
		
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