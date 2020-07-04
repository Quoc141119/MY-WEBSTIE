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
                                  <span class="breadcrumb-item active">Wishlist</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        
        <!-- wishlist-area start -->
        <div class="wishlist-area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="wishlist-content">
                            <form action="#">
                                <div class="wishlist-table table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-remove"><span class="nobr">Remove</span></th>
                                                <th class="product-thumbnail">Image</th>
                                                <th class="product-name"><span class="nobr">Product Name</span></th>
                                                <th class="product-price"><span class="nobr"> Unit Price </span></th>
                                                <th class="product-stock-stauts"><span class="nobr"> Description </span></th>
                                                <th class="product-add-to-cart"><span class="nobr">Add To Cart</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${sessionScope.wishlist}">
                                            <tr>
                                                <td class="product-remove"><a href="${pageContext.request.contextPath}/wishlist/remove?id=${item.product.getProductID()}">×</a></td>
                                                <td class="product-thumbnail"><a href="${pageContext.request.contextPath}/product/details?id=${item.product.getProductID()}">
                                                	<img src="<c:url value='${item.product.getImage()}' />" alt="" /></a></td>
                                                <td class="product-name"><a href="${pageContext.request.contextPath}/product/details?id=${item.product.getProductID()}">${item.product.getProductName()}</a></td>
                                                <td class="product-price"><span class="amount">$${item.product.getPrice()}</span></td>
                                                <td class="product-stock-status"><span class="wishlist-in-stock">${item.product.getDescription()}</span></td>
                                                <td class="product-add-to-cart"><a href="${pageContext.request.contextPath}/cart/add?id=${item.product.getProductID()}"> Add to Cart</a></td>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                </div>  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- wishlist-area end -->
	
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