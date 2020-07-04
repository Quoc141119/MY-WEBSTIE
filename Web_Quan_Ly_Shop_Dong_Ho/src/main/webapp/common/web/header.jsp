<header id="htc__header" class="htc__header__area header--one">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                                <div class="logo">
                                     <a href="${pageContext.request.contextPath}"><img src="<c:url value='/static/images/logo/4.png' />" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="${pageContext.request.contextPath}">Home</a></li>
                                        <li class="drop"><a href="#">Product</a>
                                        	<ul class="dropdown">
                                                <li><a href="${pageContext.request.contextPath}/category/list">Category</a></li>
                                                <li><a href="${pageContext.request.contextPath}/supplier/list">Supplier</a></li>
                                            </ul>
                                        </li>                 
                                        <li class="drop"><a href="${pageContext.request.contextPath}/wishlist">wishlist</a></li>
                                        <li class="drop"><a href="${pageContext.request.contextPath}/checkout">checkout</a></li>                    
                                    </ul>
                                </nav>

                                <div class="mobile-menu clearfix visible-xs visible-sm">
                                    <nav id="mobile_dropdown">
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}">Home</a></li>
                                            <li><a href="#">Product</a>
                                            	<ul>
                                            		<li><a href="${pageContext.request.contextPath}/category/list">Category</a></li>
                                            		<li><a href="${pageContext.request.contextPath}/supplier/list">Supplier</a></li>
                                            	</ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/wishlist/list">wishlist</a></li>
                                            <li><a href="${pageContext.request.contextPath}/checkout">checkout</a></li>
                                        </ul>
                                    </nav>
                                </div>  
                            </div>
                            <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                                <div class="header__right">
                                    <nav class="main__menu__nav hidden-xs hidden-sm htc__shopping__cart">
                                         <ul class="main__menu">
                                         	<c:if test="${empty sessionScope.customer}">
                                         		<li class="drop"><a href="#"><i class="icon-user icons"></i></a>
                                            		<ul class="dropdown">
                                                		<li><a href="${pageContext.request.contextPath}/customer/login">Login</a></li>
                                            		</ul>
                                            	</li>
                                         	</c:if>
                                         	<c:if test="${!empty sessionScope.customer}">
                                         		<li class="drop"><a href="#">${customer.getUsername()}</a>
                                            		<ul class="dropdown">
                                            			<li><a href="${pageContext.request.contextPath}/order/history">Order History</a></li>
                                            			<li><a href="${pageContext.request.contextPath}/customer/info">Infomation</a></li>
                                                		<li><a href="${pageContext.request.contextPath}/customer/logout">Logout</a></li>
                                            		</ul>
                                        		</li>
                                         	</c:if>
                                         </ul>
                                    </nav>
                                    <div class="htc__shopping__cart">
                                        <a class="cart__menu" href="${pageContext.request.contextPath}/cart"><i class="icon-handbag icons"></i></a>
                                        <a href="${pageContext.request.contextPath}/cart"><span class="htc__qua">${cart.size()}</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-menu-area"></div>
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
        <!-- End Header Area -->
        <!-- Start Offset Wrapper -->
        <div class="offset__wrapper">
            <!-- Start Search Popap -->
            <div class="search__area">
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="search__inner">
                                <form action="#" method="get">
                                    <input placeholder="Search here... " type="text">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Search Popap -->
        </div>