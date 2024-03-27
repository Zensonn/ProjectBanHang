<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<div class="axil-signin-area">
    <!-- Start Header -->
    <div class="signin-header">
        <div class="row align-items-center">
            <div class="col-xl-4 col-sm-6">
                <a href='<c:url value="/home"/>' class="site-logo"><img
                        src='<c:url value="/templates/user/images/logo/logo.png"/>' alt="logo"></a>
            </div>
            <div class="col-md-2 d-lg-block d-none">
                <a href='<c:url value="/user/login"/>' class="back-btn"><i class="far fa-angle-left"></i></a>
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
                    <h3 class="title">Quên mật khẩu?</h3>
                    <p class="b2 mb--55">Nhập địa chỉ email bạn đã sử dụng khi đăng ký và chúng tôi sẽ gửi lại mật khẩu
                        cho bạn qua mail.</p>
                    <form action='<c:url value="/user/forgot"/>' method="post" class="singin-form">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" type="email" class="form-control" name="email">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="axil-btn btn-bg-primary submit-btn">Gửi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
