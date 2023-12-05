<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ include file="/common/info.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>eTrade</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href='<c:url value="/templates/user/images/favicon.png"/>'>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/font-awesome.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/flaticon/flaticon.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/slick.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/slick-theme.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/jquery-ui.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/sal.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/magnific-popup.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/product.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/vendor/base.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/user/css/style.min.css"/>'>
</head>
<body>

<div class="axil-signin-area">
    <!-- Start Header -->
    <div class="signin-header">
        <div class="row align-items-center">
            <div class="col-md-6">
                <a href='<c:url value="/home"/>' class="site-logo"><img
                        src='<c:url value="/templates/user/images/logo/logo.png"/>' alt="logo"></a>
            </div>
            <div class="col-md-6">
                <div class="singin-header-btn">
                    <p>Đã có của hàng?</p>
                    <a href='<c:url value="/user/login"/>' class="axil-btn btn-bg-secondary sign-up-btn">Đăng nhập</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header -->

    <div class="row">
        <div class="col-xl-4 col-lg-6">
            <div class="axil-signin-banner bg_image bg_image--10">
                <h3 class="title">We Offer the Best Products</h3>
            </div>
        </div>
        <div class="col-lg-6 offset-xl-2">
            <div class="axil-signin-form-wrap">
                <div class="axil-signin-form">
                    <h3 class="title">Tôi là người mới</h3>
                    <p class="b2 mb--55">Nhập thông tin tài khoản của bạn</p>
                    <form action='<c:url value="/vendor/register"/>' method="post" class="singin-form">
                        <input type="hidden" class="form-control" id="id" name="id">
                        <div class="form-group">
                            <label for="userName">Tên tài khoản</label>
                            <input type="text" class="form-control" id="userName" name="userName">
                        </div>
                        <div class="form-group">
                            <label for="fullName">Tên người dùng</label>
                            <input type="text" class="form-control" id="fullName" name="fullName">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <div class="form-group">
                            <label for="passwordConfirm">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="axil-btn btn-bg-primary submit-btn">Tạo tài khoản</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modernizer JS -->
<script src='<c:url value="/templates/user/js/vendor/modernizr.min.js"/>'></script>
<!-- jQuery JS -->
<script src='<c:url value="/templates/user/js/vendor/jquery.js"/>'></script>
<!-- Bootstrap JS -->
<script src='<c:url value="/templates/user/js/vendor/popper.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/bootstrap.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/slick.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/js.cookie.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/jquery-ui.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/jquery.ui.touch-punch.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/jquery.countdown.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/sal.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/jquery.magnific-popup.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/imagesloaded.pkgd.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/isotope.pkgd.min.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/counterup.js"/>'></script>
<script src='<c:url value="/templates/user/js/vendor/waypoints.min.js"/>'></script>

<!-- Main JS -->
<script src='<c:url value="/templates/user/js/main.js"/>'></script>
</body>
