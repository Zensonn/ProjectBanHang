<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Start Slider Area -->
<div class="axil-main-slider-area main-slider-style-2 main-slider-style-8">
    <div class="container">
        <div class="slider-offset-left">
            <div class="row row--20">
                <div class="col-lg-9">
                    <div class="slider-box-wrap">
                        <div class="slider-activation-one axil-slick-dots">
                            <div class="single-slide slick-slide">
                                <div class="main-slider-content">
                                    <span class="subtitle"><i class="fal fa-badge-percent"></i> Mega Deal</span>
                                    <h1 class="title">Up to 60% off Sale</h1>
                                    <div class="shop-btn">
                                        <a href='<c:url value="/shop"/>' class="axil-btn">Shop Now <i class="fal fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="main-slider-thumb">
                                    <img src='<c:url value="/templates/user/images/product/product-9.png"/>' alt="Product">
                                </div>
                            </div>
                            <div class="single-slide slick-slide">
                                <div class="main-slider-content">
                                    <span class="subtitle"><i class="fal fa-fire"></i> Hot Deal</span>
                                    <h1 class="title">Up to 60% off Voucher</h1>
                                    <div class="shop-btn">
                                        <a href='<c:url value="/shop"/>' class="axil-btn">Shop Now <i class="fal fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="main-slider-thumb">
                                    <img src='<c:url value="/templates/user/images/product/product-8.png"/>' alt="Product">
                                </div>
                            </div>
                            <div class="single-slide slick-slide">
                                <div class="main-slider-content">
                                    <span class="subtitle"><i class="far fa-mobile"></i> Smartphone</span>
                                    <h1 class="title">Up to 60% off Voucher</h1>
                                    <div class="shop-btn">
                                        <a href='<c:url value="/shop"/>' class="axil-btn">Shop Now <i class="fal fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="main-slider-thumb">
                                    <img src='<c:url value="/templates/user/images/product/product-7.png"/>' alt="Product">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="slider-product-box">
                        <div class="product-thumb">
                            <a href='<c:url value="/views/user/product-details.jsp"/>'>
                                <img src='<c:url value="/templates/user/images/product/product-41.png"/>' alt="Product">
                            </a>
                        </div>
                        <h6 class="title"><a href='<c:url value="/views/user/product-details.jsp"/>'>Stylish Leather Bag</a></h6>
                        <span class="price">$29.99</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Slider Area -->

<!-- Start Flash Sale Area  -->
<div class="axil-new-arrivals-product-area fullwidth-container flash-sale-area bg-color-white axil-section-gap pb--0">
    <div class="container ml--xxl-0">
        <div class="product-area pb--50">
            <div class="d-md-flex align-items-end flash-sale-section">
                <div class="section-title-wrapper">
                    <span class="title-highlighter highlighter-primary"><i class="fas fa-fire"></i> Hôm nay </span>
                    <h2 class="title">Flash Sales</h2>
                </div>
                <div class="sale-countdown countdown"></div>
            </div>
            <div class="new-arrivals-product-activation slick-layout-wrapper--15 axil-slick-arrow  arrow-top-slide">

                <c:forEach items="${products}" var="product">
                    <div class="slick-single-layout" style="height: inherit">
                        <div class="axil-product product-style-four">
                            <div class="thumbnail">
                                <a href='<c:url value="/views/user/product-details.jsp"/>'>
                                    <c:url value="/image?fileName=product/${product.image!=null?product.image:'uploads/abc.jpg'}" var="imgProduct"/>
                                    <img src="${imgProduct}" alt="Product Images" >
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
        </div>
    </div>
</div>
<!-- End Flash Sale Area  -->

<!-- Start Categorie Area  -->
<div class="axil-categorie-area bg-color-white axil-section-gapcommon">
    <div class="container">
        <div class="section-title-wrapper">
            <span class="title-highlighter highlighter-secondary"> <i class="far fa-tags"></i> Danh Mục</span>
            <h2 class="title">Tìm kiếm bằng danh mục</h2>
        </div>
        <div class="categrie-product-activation slick-layout-wrapper--15 axil-slick-arrow  arrow-top-slide">
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="200" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-4.png"/>' alt="product categorie">
                        <h6 class="cat-title">Điện Thoại</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="300" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-5.png" />' alt="product categorie">
                        <h6 class="cat-title">Máy Tính</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="400" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-11.png" />' alt="product categorie">
                        <h6 class="cat-title">Phụ Kiện</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="500" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-6.png" />' alt="product categorie">
                        <h6 class="cat-title">Laptops</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="600" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-2.png" />' alt="product categorie">
                        <h6 class="cat-title">Màn Hình</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="700" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-7.png" />' alt="product categorie">
                        <h6 class="cat-title">Mạng</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product" data-sal="zoom-out" data-sal-delay="800" data-sal-duration="500">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-8.png"/>' alt="product categorie">
                        <h6 class="cat-title">PC Gaming</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-1.png" />' alt="product categorie">
                        <h6 class="cat-title">Đồng Hồ Thông Minh</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-9.png" />' alt="product categorie">
                        <h6 class="cat-title">Tai Nghe</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-10.png"/>' alt="product categorie">
                        <h6 class="cat-title">Camera & Photo</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-8.png" />' alt="product categorie">
                        <h6 class="cat-title">Video Games</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout" style="height: inherit">
                <div class="categrie-product">
                    <a href="#">
                        <img class="img-fluid" src='<c:url value="/templates/user/images/product/categories/elec-1.png" />' alt="product categorie">
                        <h6 class="cat-title">Thể Thao</h6>
                    </a>
                </div>
                <!-- End .categrie-product -->
            </div>
        </div>
    </div>
</div>
<!-- End Categorie Area  -->

<!-- Start Best Sellers Product Area  -->
<div class="axil-best-seller-product-area bg-color-white axil-section-gap pt--0">
    <div class="container">
        <div class="product-area pb--50">
            <div class="section-title-wrapper">
                <span class="title-highlighter highlighter-primary"> <i class="far fa-shopping-basket"></i>Tháng Hiện Tại</span>
                <h2 class="title">Các Sản Phẩm Bán Chạy Nhất</h2>
            </div>
            <div class="new-arrivals-product-activation-2 slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide product-slide-mobile">
                <c:forEach items="${selling}" var="productSelling">
                    <div class="slick-single-layout">
                        <div class="axil-product product-style-three">
                            <div class="thumbnail">
                                <a href='<c:url value="/views/user/product-details.jsp"/>'>
                                    <c:url value="/image?fileName=product/${productSelling.image!=null?productSelling.image:'uploads/abc.jpg'}" var="imgProduct"/>
                                    <img src="${imgProduct}" alt="Product Images">
                                </a>
                                <div class="product-hover-action">
                                    <ul class="cart-action">
                                        <li class="wishlist"><a href='<c:url value="wishlist.jsp"/>'><i class="far fa-heart" style="line-height: inherit"></i></a></li>
                                        <li class="select-option"><a href='<c:url value="/add-to-cart?id=${productSelling.id}"/>'>Thêm vào giỏ</a></li>
                                        <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye" style="line-height: inherit"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-content">
                                <div class="inner">
                                    <input type="hidden" value="${productSelling.id}" name="id"/>
                                    <h5 class="title"><a href='<c:url value="/product-detail?id=${productSelling.id}"/>'><c:out value="${productSelling.name}"/></a></h5>
                                    <div class="product-price-variant">
                                        <c:if test="${productSelling.percentDiscount > 0}">
                                            <span class="price old-price"><fmt:formatNumber pattern="###,###đ" value="${productSelling.price}"/></span>
                                            <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${productSelling.promotionalPrice}"/></span>
                                        </c:if>

                                        <c:if test="${productSelling.percentDiscount <= 0}">
                                            <span class="price current-price"><fmt:formatNumber pattern="###,###đ" value="${productSelling.price}"/></span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- End .slick-single-layout -->
            </div>
        </div>
    </div>
</div>
<!-- End  Best Sellers Product Area  -->

<!-- Start Testimonila Area  -->
<div class="axil-testimoial-area axil-section-gap bg-vista-white">
    <div class="container">
        <div class="section-title-wrapper">
            <span class="title-highlighter highlighter-secondary"> <i class="fal fa-quote-left"></i>Nhận Xét</span>
            <h2 class="title">Đánh Giá Của Khách Hàng</h2>
        </div>
        <!-- End .section-title -->
        <div class="testimonial-slick-activation testimonial-style-one-wrapper slick-layout-wrapper--20 axil-slick-arrow arrow-top-slide">
            <div class="slick-single-layout testimonial-style-one">
                <div class="review-speech">
                    <p>“ It’s amazing how much easier it has been to
                        meet new people and create instantly non
                        connections. I have the exact same personal
                        the only thing that has changed is my mind
                        set and a few behaviors. “</p>
                </div>
                <div class="media">
                    <div class="thumbnail">
                        <img src='<c:url value="/templates/user/images/testimonial/image-1.png" />' alt="testimonial image">
                    </div>
                    <div class="media-body">
                        <span class="designation">Head Of Idea</span>
                        <h6 class="title">James C. Anderson</h6>
                    </div>
                </div>
                <!-- End .thumbnail -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout testimonial-style-one">
                <div class="review-speech">
                    <p>“ It’s amazing how much easier it has been to
                        meet new people and create instantly non
                        connections. I have the exact same personal
                        the only thing that has changed is my mind
                        set and a few behaviors. “</p>
                </div>
                <div class="media">
                    <div class="thumbnail">
                        <img src='<c:url value="/templates/user/images/testimonial/image-2.png" />' alt="testimonial image">
                    </div>
                    <div class="media-body">
                        <span class="designation">Head Of Idea</span>
                        <h6 class="title">James C. Anderson</h6>
                    </div>
                </div>
                <!-- End .thumbnail -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout testimonial-style-one">
                <div class="review-speech">
                    <p>“ It’s amazing how much easier it has been to
                        meet new people and create instantly non
                        connections. I have the exact same personal
                        the only thing that has changed is my mind
                        set and a few behaviors. “</p>
                </div>
                <div class="media">
                    <div class="thumbnail">
                        <img src='<c:url value="/templates/user/images/testimonial/image-3.png" />' alt="testimonial image">
                    </div>
                    <div class="media-body">
                        <span class="designation">Head Of Idea</span>
                        <h6 class="title">James C. Anderson</h6>
                    </div>
                </div>
                <!-- End .thumbnail -->
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout testimonial-style-one">
                <div class="review-speech">
                    <p>“ It’s amazing how much easier it has been to
                        meet new people and create instantly non
                        connections. I have the exact same personal
                        the only thing that has changed is my mind
                        set and a few behaviors. “</p>
                </div>
                <div class="media">
                    <div class="thumbnail">
                        <img src='<c:url value="/templates/user/images/testimonial/image-2.png" />' alt="testimonial image">
                    </div>
                    <div class="media-body">
                        <span class="designation">Head Of Idea</span>
                        <h6 class="title">James C. Anderson</h6>
                    </div>
                </div>
                <!-- End .thumbnail -->
            </div>
            <!-- End .slick-single-layout -->

        </div>
    </div>
</div>
<!-- End Testimonila Area  -->

<div class="service-area">
    <div class="container">
        <div class="row row-cols-xl-4 row-cols-sm-2 row-cols-1 row--20">
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src='<c:url value="/templates/user/images/icons/service1.png"/>' alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Fast &amp; Secure Delivery</h6>
                        <p>Tell about your service.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src='<c:url value="/templates/user/images/icons/service2.png"/>' alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Money Back Guarantee</h6>
                        <p>Within 10 days.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src='<c:url value="/templates/user/images/icons/service3.png"/>' alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">24 Hour Return Policy</h6>
                        <p>No question ask.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src='<c:url value="/templates/user/images/icons/service4.png"/>' alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Pro Quality Support</h6>
                        <p>24/7 Live support.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
                                            <li class="add-to-cart"><a href='<c:url value="/views/user/cart.jsp"/>' class="axil-btn btn-bg-primary">Add to Cart</a></li>
                                            <li class="wishlist"><a href='<c:url value="/views/user/wishlist.jsp"/>' class="axil-btn wishlist-btn"><i class="far fa-heart" style="line-height: inherit"></i></a></li>
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
                            <a href='<c:url value="product-details.jsp"/>'>
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
                                <span class="rating-number">(10)</span>
                            </div>
                            <h3 class="item-title"><a href='<c:url value="product-details.jsp"/>'>${cartItem.product.name}</a></h3>
                            <div class="item-price"><span class="currency-symbol">$</span>${cartItem.product.promotionalPrice}</div>
                            <div class="pro-qty item-quantity">
                                <label>
                                    <input type="number" class="quantity-input" value="15">
                                </label>
                            </div>
                        </div>
                    </li>
                </c:forEach>

            </ul>
        </div>
        <div class="cart-footer">
            <h3 class="cart-subtotal">
                <span class="subtotal-title">Subtotal:</span>
                <span class="subtotal-amount">$610.00</span>
            </h3>
            <div class="group-btn">
                <a href='<c:url value="/view-cart"/>' class="axil-btn btn-bg-primary viewcart-btn">View Cart</a>
                <a href='<c:url value="checkout.jsp"/>' class="axil-btn btn-bg-secondary checkout-btn">Checkout</a>
            </div>
        </div>
    </div>
</div>
<!-- Cart View Modal Start -->