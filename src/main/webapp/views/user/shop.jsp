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
                        <li class="axil-breadcrumb-item active" aria-current="page">Mua sắm</li>
                    </ul>
                    <h1 class="title">Khám phá tất cả sản phẩm</h1>
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

<!-- Start Shop Area  -->
<div class="axil-shop-area axil-section-gap bg-color-white">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="axil-shop-sidebar">
                    <div class="d-lg-none">
                        <button class="sidebar-close filter-close-btn"><i class="fas fa-times"></i></button>
                    </div>
                    <div class="toggle-list product-categories active">
                        <h6 class="title">Danh Mục</h6>
                        <div class="shop-submenu">
                            <ul>
                                <li>
                                    <input type="radio" id="allProductsRadio" name="category" value="All" checked>
                                    <label for="allProductsRadio">Tất cả sản phẩm</label>
                                </li>
                                <c:forEach items="${categories}" var="category">
                                    <li>
                                        <input type="radio" id="${category.id}Radio" name="category" value="${category.id}">
                                        <label for="${category.id}Radio">${category.name}</label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                    <div class="toggle-list product-size active">
                        <h6 class="title">SIZE</h6>
                        <div class="shop-submenu">
                            <ul>
                                <li class="chosen"><a href="#">XS</a></li>
                                <li><a href="#">S</a></li>
                                <li><a href="#">M</a></li>
                                <li><a href="#">L</a></li>
                                <li><a href="#">XL</a></li>
                                <li><a href="#">XXL</a></li>
                                <li><a href="#">3XL</a></li>
                                <li><a href="#">4XL</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="toggle-list product-price-range active">
                        <h6 class="title">PRICE</h6>
                        <div class="shop-submenu">
                            <ul>
                                <li class="chosen"><a href="#">30</a></li>
                                <li><a href="#">5000</a></li>
                            </ul>
                            <form action="#" class="mt--25">
                                <div id="slider-range"></div>
                                <div class="flex-center mt--20">
                                    <span class="input-range">Price: </span>
                                    <label for="amount"></label>
                                    <input type="text" id="amount" class="amount-range" readonly>
                                </div>
                            </form>
                        </div>
                    </div>
                    <button class="axil-btn btn-bg-primary">All Reset</button>
                </div>
                <!-- End .axil-shop-sidebar -->
            </div>
            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="axil-shop-top mb--40">
                            <div class="category-select align-items-center justify-content-lg-end justify-content-between">
                                <!-- Start Single Select  -->
                                <span class="filter-results">Hiển thị sản phẩm</span>
                                <label>
                                    <select class="single-select">32`<q>`1</q>
                                        <option>Mới nhất</option>
                                        <option>Cũ nhất</option>
                                        <option>Theo Tên</option>
                                        <option>Theo Giá</option>
                                    </select>
                                </label>
                                <!-- End Single Select  -->
                            </div>
                            <div class="d-lg-none">
                                <button class="product-filter-mobile filter-toggle"><i class="fas fa-filter"></i> FILTER</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End .row -->
                <div class="row row--15">
                    <c:forEach items="${products}" var="product">

                            <div class="col-xl-4 col-sm-6" >
                                <div class="axil-product product-style-one mb--30" >
                                    <div class="thumbnail">
                                        <a href='<c:url value="/product-detail?id=${product.id}"/>'>
                                            <c:url value="/image?fileName=product/${product.image!=null?product.image:'uploads/abc.jpg'}" var="imgProduct"/>
                                            <img src="${imgProduct}" alt="Product Images">
                                        </a>
                                        <div class="label-block label-right">
                                           <c:if test="${product.percentDiscount > 0}">
                                               <div class="product-badget">${product.percentDiscount}%</div>
                                           </c:if>
                                        </div>
                                        <div class="product-hover-action">
                                            <ul class="cart-action">
                                                <li class="wishlist"><a href='<c:url value="wishlist.jsp"/>'><i class="far fa-heart" style="line-height: inherit"></i></a></li>
                                                <li class="select-option"><a href='<c:url value="/add-to-cart?id=${product.id}"/>'>Thêm vào giỏ</a></li>
                                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye" style="line-height: inherit"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="inner">
                                            <input type="hidden" value="${product.id}" name="id"/>
                                            <h5 class="title"><a href='<c:url value="/product-detail?id=${product.id}"/>'><c:out value="${product.name}"/></a></h5>
                                            <div class="product-price-variant">
                                                <c:if test="${product.percentDiscount > 0}">
                                                    <span class="price old-price"><fmt:formatNumber pattern="###,###đ" value="${product.price}"/></span>
                                                    <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${product.promotionalPrice}"/></span>
                                                </c:if>

                                                <c:if test="${product.percentDiscount <= 0}">
                                                <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${product.price}"/></span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </c:forEach>
                </div>
                <div class="text-center pt--20">
                    <a href="#" class="axil-btn btn-bg-lighter btn-load-more">Load more</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End .container -->
</div>
<!-- End Shop Area  -->

<!-- Product Quick View Modal Start -->
<div class="modal fade quick-view-product" id="quick-view-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="far fa-times"></i></button>
            </div>
            <div class="modal-body">
                <div class="single-product-thumb">
                    <div class="row">
                        <div class="col-lg-7 mb--40">
                            <div class="row">
                                <div class="col-lg-10 orders-lg-2">
                                    <div class="single-product-thumbnail product-large-thumbnail axil-product thumbnail-badge zoom-gallery">
                                        <div class="thumbnail">
                                            <img src='<c:url value="/templates/user/images/product/product-big-01.png"/>' alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href='<c:url value="/templates/user/images/product/product-big-01.png"/>' class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="thumbnail">
                                            <img src='<c:url value="/templates/user/images/product/product-big-02.png"/>' alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href='<c:url value="/templates/user/images/product/product-big-02.png"/>' class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="thumbnail">
                                            <img src='<c:url value="/templates/user/images/product/product-big-03.png"/>' alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href='<c:url value="/templates/user/images/product/product-big-03.png"/>' class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 orders-lg-1">
                                    <div class="product-small-thumb small-thumb-wrapper">
                                        <div class="small-thumb-img">
                                            <img src='<c:url value="/templates/user/images/product/product-thumb/thumb-07.png"/>' alt="thumb image">
                                        </div>
                                        <div class="small-thumb-img">
                                            <img src='<c:url value="/templates/user/images/product/product-thumb/thumb-08.png"/>' alt="thumb image">
                                        </div>
                                        <div class="small-thumb-img">
                                            <img src='<c:url value="/templates/user/images/product/product-thumb/thumb-09.png"/>' alt="thumb image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 mb--40">
                            <div class="single-product-content">
                                <div class="inner">
                                    <div class="product-rating">
                                        <div class="star-rating">
                                            <img src='<c:url value="/templates/user/images/icons/rate.png"/>' alt="Rate Images">
                                        </div>
                                        <div class="review-link">
                                            <a href="#">(<span>1</span> customer reviews)</a>
                                        </div>
                                    </div>
                                    <h3 class="product-title">Serif Coffee Table</h3>
                                    <span class="price-amount">$155.00 - $255.00</span>
                                    <ul class="product-meta">
                                        <li><i class="fal fa-check"></i>In stock</li>
                                        <li><i class="fal fa-check"></i>Free delivery available</li>
                                        <li><i class="fal fa-check"></i>Sales 30% Off Use Code: MOTIVE30</li>
                                    </ul>
                                    <p class="description">In ornate lorem ut est paribus, ut incident nisei premium. Integer ante est, elementum egret magna. Interpellates sagittal dictum libero, eu dissimilar tells.</p>

                                    <div class="product-variations-wrapper">

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation">
                                            <h6 class="title">Colors:</h6>
                                            <div class="color-variant-wrapper">
                                                <ul class="color-variant mt--0">
                                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                                    </li>
                                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                                    </li>
                                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- End Product Variation  -->

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation">
                                            <h6 class="title">Size:</h6>
                                            <ul class="range-variant">
                                                <li>xs</li>
                                                <li>s</li>
                                                <li>m</li>
                                                <li>l</li>
                                                <li>xl</li>
                                            </ul>
                                        </div>
                                        <!-- End Product Variation  -->

                                    </div>

                                    <!-- Start Product Action Wrapper  -->
                                    <div class="product-action-wrapper d-flex-center">
                                        <!-- Start Quantity Action  -->
                                        <div class="pro-qty">
                                            <label><input type="text" value="1"></label>
                                        </div>
                                        <!-- End Quantity Action  -->

                                        <!-- Start Product Action  -->
                                        <ul class="product-action d-flex-center mb--0">
                                            <li class="add-to-cart"><a href='<c:url value="cart.jsp"/>' class="axil-btn btn-bg-primary">Add to Cart</a></li>
                                            <li class="wishlist"><a href='<c:url value="wishlist.jsp"/>' class="axil-btn wishlist-btn"><i class="far fa-heart" style="line-height: inherit"></i></a></li>
                                        </ul>
                                        <!-- End Product Action  -->

                                    </div>
                                    <!-- End Product Action Wrapper  -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product Quick View Modal End -->

<!-- Cart View Modal Start -->
<div class="cart-dropdown" id="cart-dropdown">
    <div class="cart-content-wrap">
        <div class="cart-header">
            <h2 class="header-title">Cart review</h2>
            <button class="cart-close sidebar-close"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-body">
            <ul class="cart-item-list">
                <c:forEach items="${cartItems}" var="cartItem">
                    <li class="cart-item">
                        <div class="item-img">
                            <a href='<c:url value="/product-detail?id=${cartItem.product.id}"/>'>
                                <c:url value="/image?fileName=product/${cartItem.product.image!=null?cartItem.product.image:'uploads/abc.jpg'}" var="imgProduct"/>
                                <img src="${imgProduct}" alt="Product Images">
                            </a>
                            <button class="close-btn"><i class="fas fa-times"></i></button>
                        </div>
                        <div class="item-content">
                            <div class="product-rating">
                                <span class="icon">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
							</span>
                            </div>
                            <h3 class="item-title"><a href='<c:url value="/product-detail?id=${cartItem.product.id}"/>'>${cartItem.product.name}</a></h3>
                            <div class="item-price"><span class="currency-symbol">
                                <c:if test="${cartItem.product.percentDiscount > 0}">
                                            <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${cartItem.product.promotionalPrice}"/></span>
                                    </c:if>
                                    <c:if test="${cartItem.product.percentDiscount <= 0}">
                                            <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${cartItem.product.price}"/></span>
                                    </c:if>
                            </div>
                        </div>
                    </li>
                </c:forEach>

            </ul>
        </div>
        <div class="cart-footer">
            <h3 class="cart-subtotal">
                <span class="subtotal-title">Tổng cộng:</span>
                <span class="subtotal-amount"><fmt:formatNumber pattern="###,###đ" value="${cart.totalMoney}"/></span>
            </h3>
            <div class="group-btn">
                <a href='<c:url value="/view-cart"/>' class="axil-btn btn-bg-primary viewcart-btn">Xem giỏ hàng</a>
                <a href='<c:url value="/check-out"/>' class="axil-btn btn-bg-secondary checkout-btn">Thanh toán</a>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var categoryRadios = document.querySelectorAll('input[name="category"]');
        categoryRadios.forEach(function(radio) {
            radio.addEventListener('change', function() {
                if (this.checked) {
                    var categoryId = this.value;
                    var url = categoryId === 'All' ? 'shop' : 'shop?categoryId=' + categoryId;
                    window.location.href = url;
                }
            });
        });

        function updateRadioButtons() {
            var currentUrl = new URL(window.location.href);
            var categoryId = currentUrl.searchParams.get('categoryId');
            if (categoryId) {
                var selectedRadio = document.querySelector('input[name="category"][value="' + categoryId + '"]');
                if (selectedRadio) {
                    selectedRadio.checked = true;
                }
            } else {
                // Nếu không có tham số categoryId, chọn radio button "Tất cả sản phẩm"
                var allProductsRadio = document.querySelector('input[name="category"][value="All"]');
                if (allProductsRadio) {
                    allProductsRadio.checked = true;
                }
            }
        }

        window.addEventListener('popstate', function() {
            updateRadioButtons();
        });

        updateRadioButtons();
    });
</script>

<!-- Cart View Modal Start -->

