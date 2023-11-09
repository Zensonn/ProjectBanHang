<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Checkout Area  -->
<div class="axil-checkout-area axil-section-gap">
    <div class="container">
        <form action="#">
            <div class="row">
                <div class="col-lg-6">
                    <div class="axil-checkout-notice">
                        <div class="axil-toggle-box">
                            <div class="toggle-bar"><i class="fas fa-user"></i> Returning customer? <a href="javascript:void(0)" class="toggle-btn">Click here to login <i class="fas fa-angle-down"></i></a>
                            </div>
                            <div class="axil-checkout-login toggle-open">
                                <p>If you didn't Log ged in, Please Log in first.</p>
                                <div class="signin-box">
                                    <div class="form-group">
                                        <label for="email-login">Email</label>
                                        <input id="email-login" type="email" class="form-control" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="password-login">Password</label>
                                        <input id="password-login" type="password" class="form-control" name="password">
                                    </div>
                                    <div class="form-group mb--0">
                                        <button type="submit" class="axil-btn btn-bg-primary submit-btn">Sign In</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="axil-toggle-box">
                            <div class="toggle-bar"><i class="fas fa-pencil"></i> Have a coupon? <a href="javascript:void(0)" class="toggle-btn">Click here to enter your code <i class="fas fa-angle-down"></i></a>
                            </div>

                            <div class="axil-checkout-coupon toggle-open">
                                <p>If you have a coupon code, please apply it below.</p>
                                <div class="input-group">
                                    <label>
                                        <input placeholder="Enter coupon code" type="text">
                                    </label>
                                    <div class="apply-btn">
                                        <button type="submit" class="axil-btn btn-bg-primary">Apply</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="axil-checkout-billing">
                        <h4 class="title mb--40">Billing details</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="first-name">First Name <span>*</span></label>
                                    <input type="text" id="first-name" placeholder="Adam">
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
                            <label for="company-name">Company Name</label>
                            <input type="text" id="company-name">
                        </div>
                        <div class="form-group">
                            <label for="region">Country/ Region <span>*</span></label>
                            <select  id="region">
                                <option value="3">Australia</option>
                                <option value="4">England</option>
                                <option value="6">New Zealand</option>
                                <option value="5">Switzerland</option>
                                <option value="1">United Kindom (UK)</option>
                                <option value="2">United States (USA)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="street-address">Street Address <span>*</span></label>
                            <input id="street-address" type="text" class="mb--15" placeholder="House number and street name">
                        </div>
                        <div class="form-group">
                            <label for="city">Town/ City <span>*</span></label>
                            <input id="city" type="text">
                        </div>
                        <div class="form-group">
                            <label for="country1">Country</label>
                            <input id="country1" type="text">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone <span>*</span></label>
                            <input id="phone" type="tel">
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address <span>*</span></label>
                            <input type="email" id="email">
                        </div>
                        <div class="form-group input-group">
                            <input type="checkbox" id="checkbox" name="account-create">
                            <label for="checkbox">Create an account</label>
                        </div>
                        <div class="form-group">
                            <label for="notes">Other Notes (optional)</label>
                            <textarea id="notes" rows="2" placeholder="Notes about your orders, e.g. special notes for delivery."></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="axil-orders-summery orders-checkout-summery">
                        <h5 class="title mb--20">Your Order</h5>
                        <div class="summery-table-wrap">
                            <table class="table summery-table">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Subtotal</th>
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