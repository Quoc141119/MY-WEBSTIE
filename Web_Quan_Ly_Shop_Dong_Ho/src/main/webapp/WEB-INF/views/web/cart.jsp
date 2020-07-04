<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Cart</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Place favicon.ico in the root directory -->
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    
    <%@ include file="/common/web/taglib.jsp" %>
    <style type="text/css">
        .buttons-cart input{
            background: #ebebeb none repeat scroll 0 0;
            color: #3f3f3f;
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 500;
            height: 62px;
            line-height: 62px;
            padding: 0 45px;
            text-transform: uppercase;
            display: inline-block;
        }
    </style>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form action="${pageContext.request.contextPath}/cart/update" method="post">               
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">products</th>
                                            <th class="product-name">name of products</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:set var="total" value="0"></c:set>
										<c:forEach var="item" items="${sessionScope.cart}">
											<c:set var="price_exist" value="${item.product.getPrice() - item.product.getPrice() * item.product.getDiscount()/100 }"></c:set>
											<c:set var="total"
												value="${total + price_exist * item.quantity }"></c:set>
											<tr>
												<td class="product-thumbnail"><a href="${pageContext.request.contextPath}/product/details?id=${item.product.getProductID()}"><img
														src="<c:url value='${item.product.getImage()}'/>"
														alt="product img" /></a></td>
												<td class="product-name"><a href="${pageContext.request.contextPath}/product/details?id=${item.product.getProductID()}">${item.product.getProductName()}</a>
													<ul class="pro__prize">
														<li class="old__prize">$${item.product.getPrice()}</li>
														<li style="color: red;">(&darr;${item.product.getDiscount()}%)</li>
													</ul></td>
												<td class="product-price"><span class="amount">$${price_exist}</span></td>
												<td class="product-quantity"><input type="number" name="quantity" min = "1" max = "${item.product.getQuantity()}"
													value="${item.quantity}" /></td>
												<td class="product-subtotal">$${price_exist * item.quantity}</td>
												<td class="product-remove"><a href="${pageContext.request.contextPath}/cart/remove?id=${item.product.getProductID()}"><i
														class="icon-trash icons"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-3" style="float: right; margin-bottom: 50px;">
                                    <div class="cart__total">
                                    <span>order total</span>
                                    <span>$${total}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="buttons-cart--inner">
                                        <div class="buttons-cart">
                                            <a href="${pageContext.request.contextPath}">Continue Shopping</a>
                                        </div>
                                        <div class="buttons-cart checkout--btn">
                                        	<input type="submit" value="Update">
                                            <a href="${pageContext.request.contextPath}/checkout">checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
        <!-- cart-main-area end -->
	 
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