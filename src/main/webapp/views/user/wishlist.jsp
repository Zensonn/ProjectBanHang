<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Wishlist Area  -->
<div class="axil-wishlist-area axil-section-gap">
    <div class="container">
        <div class="product-table-heading">
            <h4 class="title">My Wish List on eTrade</h4>
        </div>
        <div class="table-responsive">
            <table class="table axil-product-table axil-wishlist-table">
                <thead>
                <tr>
                    <th scope="col" class="product-remove"></th>
                    <th scope="col" class="product-thumbnail">Product</th>
                    <th scope="col" class="product-title"></th>
                    <th scope="col" class="product-price">Unit Price</th>
                    <th scope="col" class="product-stock-status">Stock Status</th>
                    <th scope="col" class="product-add-cart"></th>
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
                    <td class="product-stock-status" data-title="Status">
                        In Stock
                    </td>
                    <td class="product-add-cart">
                        <a href='<c:url value="cart.jsp"/>' class="axil-btn btn-outline">Add to Cart</a>
                    </td>
                </tr>
                <tr>
                    <td class="product-remove">
                        <a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a>
                    </td>
                    <td class="product-thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-02.png"/>' alt="Digital Product">
                        </a>
                    </td>
                    <td class="product-title">
                        <a href='<c:url value="product-details.jsp"/>'>Gradient Light Keyboard</a>
                    </td>
                    <td class="product-price" data-title="Price">
                        <span class="currency-symbol">$</span>124.00
                    </td>
                    <td class="product-stock-status" data-title="Status">
                        In Stock
                    </td>
                    <td class="product-add-cart">
                        <a href='<c:url value="cart.jsp"/>' class="axil-btn btn-outline">Add to Cart</a>
                    </td>
                </tr>
                <tr>
                    <td class="product-remove">
                        <a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a>
                    </td>
                    <td class="product-thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-03.png"/>' alt="Digital Product">
                        </a>
                    </td>
                    <td class="product-title">
                        <a href='<c:url value="product-details.jsp"/>'>HD CC Camera</a>
                    </td>
                    <td class="product-price" data-title="Price">
                        <span class="currency-symbol">$</span>124.00
                    </td>
                    <td class="product-stock-status" data-title="Status">
                        In Stock
                    </td>
                    <td class="product-add-cart">
                        <a href='<c:url value="cart.jsp"/>' class="axil-btn btn-outline">Add to Cart</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End Wishlist Area  -->