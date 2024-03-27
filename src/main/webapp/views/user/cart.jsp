<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Cart Area  -->
<div class="axil-product-cart-area axil-section-gap">
    <div class="container">
        <div class="axil-product-cart-wrap">
            <div class="product-table-heading">
                <h4 class="title">Giỏ hàng của bạn</h4>
            </div>

            <c:if test="${not empty info}">
                <p>${info}</p>
            </c:if>

            <c:if test="${empty info}">
                <div class="table-responsive">
                    <table class="table axil-product-table axil-cart-table mb--40">
                        <thead>
                        <tr>
                            <th scope="col" class="product-remove"></th>
                            <th scope="col" class="product-thumbnail">Tên sản phẩm</th>
                            <th scope="col" class="product-price">Giá</th>
                            <th scope="col" class="product-quantity">Số lượng</th>
                            <th scope="col" class="product-subtotal">Tổng tiền</th>
                            <th scope="col" class="product-title">Hành động</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${cartItems}" var="cartItem">
                            <form action='<c:url value="/cart-action"/>' method="post">
                                <input type="hidden" name="id" value="${cartItem.product.id}">
                                <tr>
                                    <td class="product-thumbnail">
                                        <a href='<c:url value="/product-detail"/>'>
                                            <c:url value="/image?fileName=product/${cartItem.product.image!=null?cartItem.product.image:'uploads/abc.jpg'}" var="imgProduct"/>
                                            <img src="${imgProduct}" alt="Product Images">
                                        </a>
                                    </td>
                                    <td class="product-title">
                                        <a href='<c:url value="/product-detail"/>'>${cartItem.product.name}</a>
                                    </td>
                                    <td class="product-price" data-title="Price">
                                        <span class="currency-symbol"><fmt:formatNumber pattern="###,###đ" value="${cartItem.product.promotionalPrice}"/></span>
                                    </td>
                                    <td class="product-quantity" data-title="Qty">
                                        <div class="pro-qty">
                                            <label>
                                                <input type="number" class="quantity-input" value="${cartItem.quantity}" name="quantity">
                                            </label>
                                        </div>
                                    </td>
                                    <td class="product-subtotal" data-title="Subtotal">

                                        <span class="currency-symbol"><fmt:formatNumber pattern="###,###đ" value="${cartItem.product.promotionalPrice * cartItem.quantity}"/></span>
                                    </td>
                                    <td>
                                        <button type="submit" name="action" value="edit" class="btn btn-sm edit" style="padding: 10px 16px; font-size: 18px; line-height: 1.3333333;">
                                            <i class="fas fa-edit mr-1"></i> Sửa
                                        </button>
                                        <button type="submit" name="action" value="delete" class="btn btn-sm trash" style="padding: 10px 16px; font-size: 18px; line-height: 1.3333333;">
                                            <i class="fas fa-trash-alt mr-1"></i> Xóa
                                        </button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <div class="row">
                <div class="col-xl-5 col-lg-7 offset-xl-7 offset-lg-5">
                    <div class="axil-orders-summery mt--80">
                        <div class="summery-table-wrap">
                            <table class="table summery-table mb--30">
                                <thead class="title fs-3">
                                    <tr><th>Đơn hàng</th></tr>
                                </thead>
                                <tbody>
                                    <tr class="orders-subtotal">
                                        <td>Tổng tiền sản phẩm</td>
                                        <td><fmt:formatNumber pattern="###,###đ" value="${subTotal}"/></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <a href='<c:url value="/check-out"/>' class="axil-btn btn-bg-primary checkout-btn">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Cart Area  -->