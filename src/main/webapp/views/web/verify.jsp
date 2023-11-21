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
                    <p>Already a member?</p>
                    <a href='<c:url value="/buyer/login"/>' class="axil-btn btn-bg-secondary sign-up-btn">Đăng nhập</a>
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
                    <h3 class="title">I'm New Here</h3>
                    <p class="b2 mb--55">Enter your detail below</p>
                    <form action='<c:url value="/buyer/verifyCode"/>' method="post" class="singin-form">
                        <div class="form-group">
                            <label for="authCode">OTP</label>
                            <input type="text" class="form-control" id="authCode" name="authCode">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="axil-btn btn-bg-primary submit-btn">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>