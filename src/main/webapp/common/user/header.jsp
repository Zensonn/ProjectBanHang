<%@ page contentType="text/html;charset=UTF-8"%>
<a href="#top" class="back-to-top" id="backto-top"><i class="fal fa-arrow-up" style="line-height: inherit"></i></a>
<!-- Start Header -->
<header class="header axil-header header-style-5">
    <div class="axil-header-top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-sm-6 col-12">
                    <div class="header-top-dropdown">
                        <div class="dropdown">
                            <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                English
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">English</a></li>
                                <li><a class="dropdown-item" href="#">Arabic</a></li>
                                <li><a class="dropdown-item" href="#">Spanish</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                USD
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">USD</a></li>
                                <li><a class="dropdown-item" href="#">AUD</a></li>
                                <li><a class="dropdown-item" href="#">EUR</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6 col-12">
                    <div class="header-top-link">
                        <ul class="quick-link">
                            <li>
                                <a href="#">Help</a>
                            </li>
                            <li>
                                <a href='<c:url value="/vendor/product"/>'>Kênh người bán </a>
                            </li>
<%--                            <li>--%>
<%--                                <a href='<c:url value="/login"/>'>Đăng nhập</a>--%>
<%--                            </li>--%>
                            <li>
                                <a href='<c:url value="/views/user/register.jsp"/>'>Đăng ký</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Mainmenu Area  -->
    <div id="axil-sticky-placeholder"></div>
    <div class="axil-mainmenu">
        <div class="container">
            <div class="header-navbar">
                <div class="header-brand">
                    <a href='<c:url value="/trang-chu"/>' class="logo logo-dark">
                        <img src='<c:url value="/templates/user/images/logo/logo.png"/>' alt="Site Logo">
                    </a>
                    <a href='<c:url value="/trang-chu"/>' class="logo logo-light">
                        <img src='<c:url value="/templates/user/images/logo/logo-light.png"/>' alt="Site Logo">
                    </a>
                </div>
                <div class="header-main-nav">
                    <!-- Start Main menu Nav -->
                    <nav class="mainmenu-nav">
                        <button class="mobile-close-btn mobile-nav-toggler"><i class="fas fa-times"></i></button>
                        <div class="mobile-nav-brand">
                            <a href='<c:url value="/trang-chu"/>' class="logo">
                                <img src='<c:url value="/templates/user/images/logo/logo.png"/>' alt="Site Logo">
                            </a>
                        </div>
                        <ul class="mainmenu">
                            <li class="">
                                <a href='<c:url value="/trang-chu"/>'>Trang chủ</a>
                            </li>
                            <li class="">
                                <a href='<c:url value="/views/user/shop.jsp"/>'>Mua sắm</a>
                            </li>
                            <li>
                                <a href='<c:url value="/views/user/about-us.jsp"/>'>Về chúng tôi</a>
                            </li>
                            <li class="">
                                <a href='<c:url value="/views/user/blog.jsp"/>'>Blog</a>
                            </li>
                            <li>
                                <a href='<c:url value="/views/user/contact.jsp"/>'>Liên hệ</a>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Main menu Nav -->
                </div>
                <div class="header-action">
                    <ul class="action-list">
                        <li class="axil-search d-xl-block d-none">
                            <label for="search2"></label>
                            <input type="search" class="placeholder product-search-input" name="search2" id="search2" value="" maxlength="128" placeholder="What are you looking for?" autocomplete="off">
                            <button type="submit" class="icon wooc-btn-search">
                                <i class="flaticon-magnifying-glass"></i>
                            </button>
                        </li>
                        <li class="axil-search d-xl-none d-block">
                            <a href="javascript:void(0)" class="header-search-icon" title="Search">
                                <i class="flaticon-magnifying-glass"></i>
                            </a>
                        </li>
                        <li class="wishlist">
                            <a href='<c:url value="/views/user/wishlist.jsp"/>'>
                                <i class="flaticon-heart"></i>
                            </a>
                        </li>
                        <li class="shopping-cart">
                            <a href="#" class="cart-dropdown-btn">
                                <span class="cart-count">3</span>
                                <i class="flaticon-shopping-cart"></i>
                            </a>
                        </li>
                        <li class="my-account">
                            <a href="javascript:void(0)">
                                <i class="flaticon-person"></i>
                            </a>
                            <div class="my-account-dropdown">
                                <span class="title">QUICK LINKS</span>
                                <ul>
                                    <li>
                                        <a href='<c:url value="/views/user/my-account.jsp"/>'>Tài khoản của tôi</a>
                                    </li>
                                    <li>
                                        <a href="#">Initiate return</a>
                                    </li>
                                    <li>
                                        <a href="#">Hỗ trợ</a>
                                    </li>
                                    <li>
                                        <a href="#">Ngôn ngữ</a>
                                    </li>
                                </ul>
                                <a href='<c:url value="/views/user/login.jsp"/>' class="axil-btn btn-bg-primary">Login</a>
                                <div class="reg-footer text-center">Chưa có tài khoản? <a href='<c:url value="/views/user/register.jsp"/>' class="btn-link">Đăng ký.</a></div>
                            </div>
                        </li>
                        <li class="axil-mobile-toggle">
                            <button class="menu-btn mobile-nav-toggler">
                                <i class="flaticon-menu-2"></i>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Mainmenu Area -->
    <div class="header-top-campaign">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6 col-md-10">
                    <div class="header-campaign-activation axil-slick-arrow arrow-both-side header-campaign-arrow">
                        <div class="slick-slide">
                            <div class="campaign-content">
                                <p>STUDENT NOW GET 10% OFF : <a href="#">GET OFFER</a></p>
                            </div>
                        </div>
                        <div class="slick-slide">
                            <div class="campaign-content">
                                <p>STUDENT NOW GET 10% OFF : <a href="#">GET OFFER</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- End Header -->