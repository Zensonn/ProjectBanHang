<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
                <form class="singin-form">
                    <div class="form-group">
                        <label for="username">User Name</label>
                        <input id="username" type="text" class="form-control" name="username" value="bang">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email" type="email" class="form-control" name="email" value="annie@example.com">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="password" value="123456789">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="axil-btn btn-bg-primary submit-btn">Create Account</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>