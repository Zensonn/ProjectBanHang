<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Checkout Area  -->
<div class="axil-checkout-area axil-section-gap">
    <div class="container">
        <form action="#">
            <div class="row">
                <div class="col-lg-6">
                    <div class="axil-checkout-billing">
                        <h4 class="title mb--40">Thông tin</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="fullName">Họ và tên <span>*</span></label>
                                    <input type="text" id="fullName">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="last-name">Last Name <span>*</span></label>
                                    <input type="text" id="last-name" placeholder="John">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span>*</span></label>
                            <input type="email" id="email">
                        </div>
                        <div class="form-group">
                            <label for="phone">Số điện thoại <span>*</span></label>
                            <input id="phone" type="tel">
                        </div>
                        <div class="form-group">
                            <label for="street-address">Địa chỉ <span>*</span></label>
                            <input id="street-address" type="text" class="mb--15">
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
                                <tr class="orders-product">
                                    <td>Commode Blown Lamp <span class="quantity">x1</span></td>
                                    <td>$117.00</td>
                                </tr>
                                <tr class="orders-product">
                                    <td>Commode Blown Lamp <span class="quantity">x1</span></td>
                                    <td>$198.00</td>
                                </tr>
                                <tr class="orders-subtotal">
                                    <td>Subtotal</td>
                                    <td>$117.00</td>
                                </tr>
                                <tr class="orders-shipping">
                                    <td colspan="2">
                                        <div class="shipping-amount">
                                            <span class="title">Shipping Method</span>
                                            <span class="amount">$35.00</span>
                                        </div>
                                        <div class="input-group">
                                            <input type="radio" id="radio1" name="shipping" checked>
                                            <label for="radio1">Free Shipping</label>
                                        </div>
                                        <div class="input-group">
                                            <input type="radio" id="radio2" name="shipping">
                                            <label for="radio2">Local</label>
                                        </div>
                                        <div class="input-group">
                                            <input type="radio" id="radio3" name="shipping">
                                            <label for="radio3">Flat rate</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="orders-total">
                                    <td>Total</td>
                                    <td class="orders-total-amount">$323.00</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="orders-payment-method">
                            <div class="single-payment">
                                <div class="input-group">
                                    <input type="radio" id="radio4" name="payment">
                                    <label for="radio4">Direct bank transfer</label>
                                </div>
                                <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your orders will not be shipped until the funds have cleared in our account.</p>
                            </div>
                            <div class="single-payment">
                                <div class="input-group">
                                    <input type="radio" id="radio5" name="payment">
                                    <label for="radio5">Cash on delivery</label>
                                </div>
                                <p>Pay with cash upon delivery.</p>
                            </div>
                            <div class="single-payment">
                                <div class="input-group justify-content-between align-items-center">
                                    <input type="radio" id="radio6" name="payment" checked>
                                    <label for="radio6">Paypal</label>
                                    <img src='<c:url value="/templates/user/images/others/payment.png"/>' alt="Paypal payment">
                                </div>
                                <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                            </div>
                        </div>
                        <button type="submit" class="axil-btn btn-bg-primary checkout-btn">Process to Checkout</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- End Checkout Area  -->