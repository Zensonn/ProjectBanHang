<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Checkout Area  -->
<div class="axil-checkout-area axil-section-gap">
    <div class="container">
        <form action='<c:url value="/save-order"/>' method="get">
            <div class="row">
                <div class="col-lg-6">
                    <div class="axil-checkout-billing">
                        <h4 class="title mb--40">Thông tin</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="fullName">Họ và tên <span>*</span></label>
                                    <input type="text" id="fullName" value="${customer.fullName}">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="last-name">Tên tài khoản <span>*</span></label>
                                    <input type="text" id="last-name" value="${customer.userName}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span>*</span></label>
                            <input type="email" id="email" value="${customer.email}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Số điện thoại <span>*</span></label>
                            <input id="phone" type="tel" value="${customer.phone}">
                        </div>
                        <div class="form-group">
                            <label for="street-address">Địa chỉ <span>*</span></label>
                            <input id="street-address" type="text" class="mb--15" value="${customer.addresses}">
                        </div>
                        <div class="form-group">
                            <label for="notes">Ghi chú (optional)</label>
                            <textarea id="notes" rows="2"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="axil-orders-summery orders-checkout-summery">
                        <h5 class="title mb--20">Đơn hàng của bạn</h5>
                        <div class="summery-table-wrap">
                            <table class="table summery-table">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Tổng tiền</th>
                                    </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${cart.cartItems}">
                                <tr class="orders-product">
                                    <td>${item.product.name} <span class="quantity">x${item.quantity}</span></td>
                                    <td><fmt:formatNumber pattern="###,###đ" value="${item.totalPrice}"/></td>
                                </tr>
                                </c:forEach>

                                <tr class="orders-total">
                                    <td>Tổng</td>
                                    <input type="hidden" name="orderTotal" value="${cart.totalMoney}" />
                                    <td class="orders-total-amount"><fmt:formatNumber pattern="###,###đ" value="${cart.totalMoney}"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="orders-payment-method">
                            <div class="single-payment">
                                <div class="input-group">
                                    <input type="radio" id="radio5" name="payment">
                                    <label for="radio5">Thanh toán khi nhận hàng</label>
                                </div>
                            </div>
                            <div class="single-payment">
                                <div class="input-group justify-content-between align-items-center">
                                    <input type="radio" id="radio6" name="payment" checked>
                                    <label for="radio6">VnPay</label>
                                    <img src='<c:url value="/templates/user/images/others/payment.png"/>' alt="Paypal payment">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="axil-btn btn-bg-primary">Thanh toán</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- End Checkout Area  -->

<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        var selectedPaymentMethod = document.querySelector('input[name="payment"]:checked').id;
        if (selectedPaymentMethod === 'radio5') {
            this.action = '<c:url value="/save-order"/>';
            //this.method = 'get';
        } else if (selectedPaymentMethod === 'radio6') {
            this.action = '<c:url value="/submitOrder-vnpay"/>';
            //this.method = 'post';
        }
    });

</script>