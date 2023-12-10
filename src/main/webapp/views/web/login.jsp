<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<div class="axil-signin-area">
    <!-- Start Header -->
    <div class="signin-header">
        <div class="row align-items-center">
            <div class="col-sm-4">
                <a href='<c:url value="/home"/>' class="site-logo"><img
                        src='<c:url value="/templates/user/images/logo/logo.png"/>' alt="logo"></a>
            </div>
            <div class="col-sm-4">
                <div class="singin-header-btn">
                    <a href='<c:url value="/buyer/register"/>' class="axil-btn btn-bg-secondary sign-up-btn">Đăng ký ngay</a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="singin-header-btn">
                    <a href='<c:url value="/vendor/register"/>' class="axil-btn btn-bg-secondary sign-up-btn">Tạo của hàng mới</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header -->

    <div class="row">
        <div class="col-xl-4 col-lg-6">
            <div class="axil-signin-banner bg_image bg_image--9">
                <h3 class="title">We Offer the Best Products</h3>
            </div>
        </div>
        <div class="col-lg-6 offset-xl-2">
            <div class="axil-signin-form-wrap">
                <div class="axil-signin-form">
                    <h3 class="title">Đăng nhập vào eTrade.</h3>
                    <p class="b2 mb--55">Nhập thông tin tài khoản của bạn</p>
                    <form action='<c:url value="/user/login"/>' method="post" class="singin-form">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" type="email" class="form-control" name="email">
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input id="password" type="password" class="form-control" name="password">
                        </div>
                        <div class="form-check d-flex align-items-center justify-content-between">
                            <input class="form-check-input" type="checkbox" name="remember" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                                Nhớ tôi
                            </label>
                            <a href='<c:url value="/user/forgot"/>' class="forgot-btn">Quên mật khẩu?</a>
                        </div>
                        <div class="form-group mt-5">
                            <button type="submit" class="axil-btn btn-bg-primary">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
