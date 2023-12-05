<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Breadcrumb Area  -->
<div class="axil-breadcrumb-area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-8">
                <div class="inner">
                    <ul class="axil-breadcrumb">
                        <li class="axil-breadcrumb-item"><a href='<c:url value="/home"/>'>Trang chủ</a></li>
                        <li class="separator"></li>
                        <li class="axil-breadcrumb-item active" aria-current="page">Tài khoản của tôi</li>
                    </ul>
                    <h1 class="title">Tất cả sản phẩm</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-4">
                <div class="inner">
                    <div class="bradcrumb-thumb">
                        <img src='<c:url value="/templates/user/images/product/product-45.png"/>' alt="Image">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumb Area  -->

<!-- Start My Account Area  -->
<div class="axil-dashboard-area axil-section-gap">
    <div class="container">
        <div class="axil-dashboard-warp">
            <div class="axil-dashboard-author">
                <div class="media">
                    <div class="thumbnail">
                        <c:url value="/image?fileName=category/${customer.avatar!=null?customer.avatar:'uploads/abc.jpg'}" var="avatar"/>
                        <img height="70px" width="70px" src="${avatar}" alt="Avatar">
                    </div>
                    <div class="media-body">
                        <h5 class="title mb-0">Xin chào ${customer.userName}</h5>
                        <span class="joining-date">eTrade Member Since Sep 2020</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-md-4">
                    <aside class="axil-dashboard-aside">
                        <nav class="axil-dashboard-nav">
                            <div class="nav nav-tabs" role="tablist">
                                <a class="nav-item nav-link active" data-bs-toggle="tab" href="#nav-dashboard" role="tab" aria-selected="true"><i class="fas fa-th-large"></i>Biểu đồ</a>
                                <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-orders" role="tab" aria-selected="false"><i class="fas fa-shopping-basket"></i>Đơn hàng</a>
                                <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-downloads" role="tab" aria-selected="false"><i class="fas fa-file-download"></i>Tải xuống</a>
                                <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-address" role="tab" aria-selected="false"><i class="fas fa-home"></i>Tài khoản</a>
                                <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-account" role="tab" aria-selected="false"><i class="fas fa-key"></i>Đổi mật khẩu</a>
                                <a class="nav-item nav-link" href='<c:url value="/buyer/logout"/>'><i class="fal fa-sign-out"></i>Log out</a>
                            </div>
                        </nav>
                    </aside>
                </div>
                <div class="col-xl-9 col-md-8">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="nav-dashboard" role="tabpanel">
                            <div class="axil-dashboard-overview">
                                <div class="welcome-text">Xin chào ${customer.userName} (không phải <span>${customer.userName}?</span> <a href='<c:url value="buyer/logout"/>'>Đăng xuất</a>)</div>
                                <p>Trong phần tài khoản của mình, bạn có thể xem các đơn đặt hàng gần đây, quản lý địa chỉ giao hàng và thanh toán cũng như chỉnh sửa mật khẩu và chi tiết tài khoản của mình.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-orders" role="tabpanel">
                            <div class="axil-dashboard-orders">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">Đơn hàng</th>
                                            <th scope="col">Ngày</th>
                                            <th scope="col">Trạng thái</th>
                                            <th scope="col">Tổng tiển</th>
                                            <th scope="col">Xác nhận</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th scope="row">#6523</th>
                                            <td>September 10, 2020</td>
                                            <td>Processing</td>
                                            <td>$326.63 for 3 items</td>
                                            <td><a href="#" class="axil-btn view-btn">View</a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">#6523</th>
                                            <td>September 10, 2020</td>
                                            <td>On Hold</td>
                                            <td>$326.63 for 3 items</td>
                                            <td><a href="#" class="axil-btn view-btn">View</a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">#6523</th>
                                            <td>September 10, 2020</td>
                                            <td>Processing</td>
                                            <td>$326.63 for 3 items</td>
                                            <td><a href="#" class="axil-btn view-btn">View</a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">#6523</th>
                                            <td>September 10, 2020</td>
                                            <td>Processing</td>
                                            <td>$326.63 for 3 items</td>
                                            <td><a href="#" class="axil-btn view-btn">View</a></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">#6523</th>
                                            <td>September 10, 2020</td>
                                            <td>Processing</td>
                                            <td>$326.63 for 3 items</td>
                                            <td><a href="#" class="axil-btn view-btn">View</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-downloads" role="tabpanel">
                            <div class="axil-dashboard-orders">
                                <p>Bạn không có bản tải xuống nào</p>
                            </div>
                        </div>

                        <%-- Tài khoản --%>

                        <div class="tab-pane fade" id="nav-address" role="tabpanel">
                            <div class="axil-dashboard-address">
                                <form action='<c:url value="/update-account"/>' method="post" enctype="multipart/form-data" class="account-details-form">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="avatar">Ảnh đại diện</label>
                                                <input type="file" class="form-control mt-3" value="${customer.avatar}" name="avatar" id="avatar">
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="fullName">Họ và tên</label>
                                                <input type="text" class="form-control" value="${customer.fullName}" name="fullName" id="fullName">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="firstname">Tên tài khoản</label>
                                                <input disabled class="form-control" value="${customer.userName}" name="userName" id="firstname" >
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input disabled class="form-control" value="${customer.email}" name="email" id="email">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="phone">Số điện thoại</label>
                                                <input type="text" class="form-control" value="${customer.phone}" name="phone" id="phone">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="address">Địa chỉ</label>
                                                <input type="text" class="form-control" value="${customer.addresses}" name="addresses" id="address">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <button type="submit" class="btn btn-primary">Lưu lại</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-account" role="tabpanel">
                            <div class="col-lg-9">
                                <div class="axil-dashboard-account">
                                    <form class="account-details-form">
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="title">Đổi mật khẩu</h5>
                                                <div class="form-group">
                                                    <label for="password">Mật khẩu cũ</label>
                                                    <input type="password" class="form-control" id="password">
                                                </div>
                                                <div class="form-group">
                                                    <label for="new-password">Mật khẩu mới</label>
                                                    <input type="password" id="new-password" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="confirm-password">Xác nhận mật khẩu</label>
                                                    <input type="password" id="confirm-password" class="form-control">
                                                </div>
                                                <div class="form-group mb--0">
                                                    <input type="submit" class="axil-btn" value="Save Changes">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End My Account Area  -->