<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Cart Area  -->
<div class="axil-product-cart-area axil-section-gap">
    <div class="container">
        <div class="axil-product-cart-wrap">
            <div class="product-table-heading">
                <h4 class="title">Your Cart</h4>
                <a href="#" class="cart-clear">Clear Shopping Cart</a>
            </div>
            <div class="table-responsive">
                <table class="table axil-product-table axil-cart-table mb--40">
                    <thead>
                        <tr>
                            <th scope="col" class="product-remove"></th>
                            <th scope="col" class="product-thumbnail">Product</th>
                            <th scope="col" class="product-title"></th>
                            <th scope="col" class="product-price">Price</th>
                            <th scope="col" class="product-quantity">Quantity</th>
                            <th scope="col" class="product-subtotal">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="product-remove">
                                <a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a>
                            </td>
                            <td class="product-thumbnail">
                                <a href='<c:url value="product-details.jsp"/>'>
                                    <img src='<c:url value="/templates/user/images/product/electric/product-01.png"/>' alt="Digital Product">
                                </a>
                            </td>
                            <td class="product-title">
                                <a href='<c:url value="product-details.jsp"/>'>Wireless PS Handler</a>
                            </td>
                            <td class="product-price" data-title="Price">
                                <span class="currency-symbol">$</span>124.00
                            </td>
                            <td class="product-quantity" data-title="Qty">
                                <div class="pro-qty">
                                    <label>
                                        <input type="number" class="quantity-input" value="1">
                                    </label>
                                </div>
                            </td>
                            <td class="product-subtotal" data-title="Subtotal"><span class="currency-symbol">$</span>275.00</td>
                        </tr>
                        <tr>
                            <td class="product-remove"><a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a></td>
                            <td class="product-thumbnail"><a href='<c:url value="product-details.jsp"/>'><img src='<c:url value="/templates/user/images/product/electric/product-02.png"/>' alt="Digital Product"></a></td>
                            <td class="product-title"><a href='<c:url value="product-details.jsp"/>'>Gradient Light Keyboard</a></td>
                            <td class="product-price" data-title="Price"><span class="currency-symbol">$</span>124.00</td>
                            <td class="product-quantity" data-title="Qty">
                                <div class="pro-qty">
                                    <label>
                                        <input type="number" class="quantity-input" value="1">
                                    </label>
                                </div>
                            </td>
                            <td class="product-subtotal" data-title="Subtotal"><span class="currency-symbol">$</span>275.00</td>
                        </tr>
                        <tr>
                            <td class="product-remove"><a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a></td>
                            <td class="product-thumbnail"><a href='<c:url value="product-details.jsp"/>'><img src='<c:url value="/templates/user/images/product/electric/product-03.png"/>' alt="Digital Product"></a></td>
                            <td class="product-title"><a href='<c:url value="product-details.jsp"/>'>HD CC Camera</a></td>
                            <td class="product-price" data-title="Price"><span class="currency-symbol">$</span>124.00</td>
                            <td class="product-quantity" data-title="Qty">
                                <div class="pro-qty">
                                    <label>
                                        <input type="number" class="quantity-input" value="1">
                                    </label>
                                </div>
                            </td>
                            <td class="product-subtotal" data-title="Subtotal"><span class="currency-symbol">$</span>275.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="cart-update-btn-area">
                <div class="input-group product-cupon">
                    <label>
                        <input placeholder="Enter coupon code" type="text">
                    </label>
                    <div class="product-cupon-btn">
                        <button type="submit" class="axil-btn btn-outline">Apply</button>
                    </div>
                </div>
                <div class="update-btn">
                    <a href="#" class="axil-btn btn-outline">Update Cart</a>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-5 col-lg-7 offset-xl-7 offset-lg-5">
                    <div class="axil-orders-summery mt--80">
                        <div class="summery-table-wrap">
                            <table class="table summery-table mb--30">
                                <thead class="title fs-3">
                                    <tr><th>Order Summary</th></tr>
                                </thead>
                                <tbody>
                                    <tr class="orders-subtotal">
                                        <td>Subtotal</td>
                                        <td>$117.00</td>
                                    </tr>
                                    <tr class="orders-shipping">
                                        <td>Shipping</td>
                                        <td>
                                            <div class="input-group">
                                                <input type="radio" id="radio1" name="shipping" checked>
                                                <label for="radio1">Free Shopping</label>
                                            </div>
                                            <div class="input-group">
                                                <input type="radio" id="radio2" name="shipping">
                                                <label for="radio2">Local: $35.00</label>
                                            </div>
                                            <div class="input-group">
                                                <input type="radio" id="radio3" name="shipping">
                                                <label for="radio3">Flat rate: $12.00</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="orders-tax">
                                        <td>State Tax</td>
                                        <td>$8.00</td>
                                    </tr>
                                    <tr class="orders-total">
                                        <td>Total</td>
                                        <td class="orders-total-amount">$125.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a href='<c:url value="checkout.jsp"/>' class="axil-btn btn-bg-primary checkout-btn">Process to Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Cart Area  -->