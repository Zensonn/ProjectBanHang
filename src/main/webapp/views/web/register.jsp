<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
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
                    <p>Đã là thành viên hay chưa?</p>
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
                    <form action='<c:url value="/buyer/register"/>' method="post" class="singin-form">
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

