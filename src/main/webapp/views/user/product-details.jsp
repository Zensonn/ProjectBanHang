<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Start Shop Area  -->
<div class="axil-single-product-area axil-section-gap pb--0 bg-color-white">
    <div class="single-product-thumb mb--40">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mb--40">
                    <!-- Chỉ đưa vào trang JSP một sản phẩm duy nhất -->


                    <div class="row">
                        <div class="col-lg-10 orders-lg-2">
                            <div class="single-product-thumbnail-wrap zoom-gallery">
                                <div class="single-product-thumbnail product-large-thumbnail-3 axil-product">
                                    <!-- Iterate over product images -->

                                        <div class="thumbnail">
                                            <a href='<c:url value="/image?fileName=product/${product.image!=null?product.image:'uploads/abc.jpg'}" var="imgProduct"/>' class="popup-zoom">
                                                <img src="${imgProduct}" alt="Product Images">
                                            </a>
                                        </div>

                                </div>
                                <div class="label-block">
                                    <div class="product-badget">${product.percentDiscount}% OFF</div>
                                </div>
                                <div class="product-quick-view position-view">
                                    <a href='<c:url value="/image?fileName=product/${product.image!=null?product.image:'uploads/abc.jpg'}" var="imgProduct"/>' class="popup-zoom">
                                        <i class="far fa-search-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Remaining HTML code for the left section... -->
                    </div>
                </div>
                <div class="col-lg-5 mb--40">
                    <div class="single-product-content">
                        <div class="inner">
                            <!-- Use JSTL to display product details -->
                            <h2 class="product-title">${product.name}</h2>

                            <c:if test="${product.percentDiscount > 0}">
                                <span class="price-amount text-decoration-line-through price old-price" style="opacity: 0.4;">
                                    <fmt:formatNumber pattern="###,###đ" value="${product.price}"/>
                                </span>
                                <span class=" price-amount price current-price"><fmt:formatNumber pattern="###,###đ" value="${product.promotionalPrice}"/></span>
                            </c:if>

                            <c:if test="${product.percentDiscount <= 0}">
                                <span class=" price-amount price current-price"><fmt:formatNumber pattern="###,###đ" value="${product.price}"/></span>
                            </c:if>
                            <div class="product-rating">
                                <div class="star-rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <div class="review-link">
                                    <a href="#">(<span>2</span> lượt đánh giá )</a>
                                </div>
                            </div>
                            <ul class="product-meta">
                                <li><i class="fal fa-check"></i>Còn hàng</li>
                                <li><i class="fal fa-check"></i>Giao hàng miễn phí khi mua 2 sản phẩm</li>
                                <li><i class="fal fa-check"></i>Giảm giá ${product.percentDiscount}% Mã sử dụng: MOTIVE30</li>
                            </ul>
                            <p class="description">${product.description}</p>
                            <div class="product-variations-wrapper">

                                <!-- Start Product Variation  -->
                                <div class="product-variation">
                                    <h6 class="title">Colors:</h6>
                                    <div class="color-variant-wrapper">
                                        <ul class="color-variant">
                                            <li class="color-extra-01 active"><span><span class="color"></span></span>
                                            </li>
                                            <li class="color-extra-02"><span><span class="color"></span></span>
                                            </li>
                                            <li class="color-extra-03"><span><span class="color"></span></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            <!-- Start Product Variation  -->
                            <div class="product-variation product-size-variation">
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


                            <!-- Remaining product details... -->

                            <!-- Start Product Action Wrapper  -->
                            <div class="product-action-wrapper d-flex-center">
                                <!-- Start Quantity Action  -->
                                <div class="pro-qty">
                                    <label for="quantity"></label>
                                    <input id="quantity" type="text" value="1">

                                </div>
                                <!-- End Quantity Action  -->

                                <!-- Start Product Action  -->
                                <ul class="product-action d-flex-center mb--0">
                                    <li class="add-to-cart">
                                        <a href='<c:url value="cart.jsp"/>' class="axil-btn btn-bg-primary">Add to Cart</a>
                                    </li>
                                    <li class="wishlist">
                                        <a href='<c:url value="wishlist.jsp"/>' class="axil-btn wishlist-btn">
                                            <i class="far fa-heart"></i>
                                        </a>
                                    </li>
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
    <!-- End .single-product-thumb -->

    <div class="woocommerce-tabs wc-tabs-wrapper bg-vista-white">
        <div class="container">
            <ul class="nav tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Shop Product</a>
                </li>
                <li class="nav-item " role="presentation">
                    <a id="additional-info-tab" data-bs-toggle="tab" href="#additional-info" role="tab" aria-controls="additional-info" aria-selected="false">Additional Information</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a id="reviews-tab" data-bs-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                    <div class="product-desc-wrapper">
                        <div class="row">
                            <div class="row row-cols-3">
                                <div class="shop_product">
                                    <div class="left">
                                        <img src="https://down-vn.img.susercontent.com/file/5bfa9b0f78f000687027f322b9ca2839_tn" class="rounded-circle" alt="Circular Image" >
                                    </div>
                                    <div class="right">
                                        <div class="Nhan_hang">TaiNgheShop</div>
                                        <div class="Trang_Thai_Hoat_Dong">
                                            <div class="zSXxlI">Online 5 phút trước</div>
                                        </div>
                                        <div class="button-container">
                                            <button class="button1">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
                                                    <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                                                    <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"></path>
                                                </svg>
                                                <span>Chat ngay</span>
                                            </button>
                                            <a href='<c:url value="shop-details.jsp"/>'>
                                                <button class="button2">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
                                                    <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"></path>
                                                </svg>
                                                <span>Xem shop</span>
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                                <div class="Information">
                                    <div class="top-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Đánh giá</label>
                                            <span class="Xkm22X">2,6k</span>
                                        </div>
                                    </div>
                                    <div class="mid-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Người theo dõi</label>
                                            <span class="Xkm22X">1,5k</span>
                                        </div>
                                    </div>
                                    <div class="bot-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Tỉ lệ phản hồi</label>
                                            <span class="Xkm22X">60%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="infomation1">
                                    <div class="top-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Tham gia</label>
                                            <span class="Xkm22X">18 tháng trước</span>
                                        </div>
                                    </div>
                                    <div class="mid-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Sản phẩm </label>
                                            <span class="Xkm22X">111</span>
                                        </div>
                                    </div>
                                    <div class="bot-row">
                                        <div class="R7Q8ES">
                                            <label class="siK1qW">Thời gian phản hồi</label>
                                            <span class="Xkm22X">trong vài giờ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End .col-lg-6 -->
                        </div>
                        <!-- End .row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <ul class="pro-des-features">
                                    <li class="single-features">
                                        <div class="icon">
                                            <img src='<c:url value="/templates/user/images/product/product-thumb/icon-3.png"/>' alt="icon">
                                        </div>
                                        Easy Returns
                                    </li>
                                    <li class="single-features">
                                        <div class="icon">
                                            <img src='<c:url value="/templates/user/images/product/product-thumb/icon-2.png"/>' alt="icon">
                                        </div>
                                        Quality Service
                                    </li>
                                    <li class="single-features">
                                        <div class="icon">
                                            <img  src='<c:url value="/templates/user/images/product/product-thumb/icon-1.png"/>' alt="icon">
                                        </div>
                                        Original Product
                                    </li>
                                </ul>
                                <!-- End .pro-des-features -->
                            </div>
                        </div>
                        <!-- End .row -->
                    </div>
                    <!-- End .product-desc-wrapper -->
                </div>
                <div class="tab-pane fade" id="additional-info" role="tabpanel" aria-labelledby="additional-info-tab">
                    <div class="product-additional-info">
                        <div class="table-responsive">
                            <table>
                                <tbody>
                                <tr>
                                    <th>Stand Up</th>
                                    <td>35″L x 24″W x 37-45″H(front to back wheel)</td>
                                </tr>
                                <tr>
                                    <th>Folded (w/o wheels) </th>
                                    <td>32.5″L x 18.5″W x 16.5″H</td>
                                </tr>
                                <tr>
                                    <th>Folded (w/ wheels) </th>
                                    <td>32.5″L x 24″W x 18.5″H</td>
                                </tr>
                                <tr>
                                    <th>Door Pass Through </th>
                                    <td>24</td>
                                </tr>
                                <tr>
                                    <th>Frame </th>
                                    <td>Aluminum</td>
                                </tr>
                                <tr>
                                    <th>Weight (w/o wheels) </th>
                                    <td>20 LBS</td>
                                </tr>
                                <tr>
                                    <th>Weight Capacity </th>
                                    <td>60 LBS</td>
                                </tr>
                                <tr>
                                    <th>Width</th>
                                    <td>24″</td>
                                </tr>
                                <tr>
                                    <th>Handle height (ground to handle) </th>
                                    <td>37-45″</td>
                                </tr>
                                <tr>
                                    <th>Wheels</th>
                                    <td>Aluminum</td>
                                </tr>
                                <tr>
                                    <th>Size</th>
                                    <td>S, M, X, XL</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                    <div class="reviews-wrapper">
                        <div class="row">
                            <div class="col-lg-6 mb--40">
                                <div class="axil-comment-area pro-desc-commnet-area">
                                    <h5 class="title">01 Review for this product</h5>
                                    <ul class="comment-list">
                                        <!-- Start Single Comment  -->
                                        <li class="comment">
                                            <div class="comment-body">
                                                <div class="single-comment">
                                                    <div class="comment-img">
                                                        <img src='<c:url value="/templates/user/images/blog/author-image-4.png"/>' alt="Author Images">
                                                    </div>
                                                    <div class="comment-inner">
                                                        <h6 class="commenter">
                                                            <a class="hover-flip-item-wrapper" href="#">
                                                                            <span class="hover-flip-item">
                                                                                <span data-text="Cameron Williamson">Eleanor Pena</span>
                                                                            </span>
                                                            </a>
                                                            <span class="commenter-rating ratiing-four-star">
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star empty-rating"></i></a>
                                                                        </span>
                                                        </h6>
                                                        <div class="comment-text">
                                                            <p>“We’ve created a full-stack structure for our working workflow processes, were from the funny the century initial all the made, have spare to negatives. ” </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- End Single Comment  -->

                                        <!-- Start Single Comment  -->
                                        <li class="comment">
                                            <div class="comment-body">
                                                <div class="single-comment">
                                                    <div class="comment-img">
                                                        <img src='<c:url value="/templates/user/images/blog/author-image-4.png"/>' alt="Author Images">
                                                    </div>
                                                    <div class="comment-inner">
                                                        <h6 class="commenter">
                                                            <a class="hover-flip-item-wrapper" href="#">
                                                                            <span class="hover-flip-item">
                                                                                <span data-text="Rahabi Khan">Courtney Henry</span>
                                                                            </span>
                                                            </a>
                                                            <span class="commenter-rating ratiing-four-star">
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                        </span>
                                                        </h6>
                                                        <div class="comment-text">
                                                            <p>“We’ve created a full-stack structure for our working workflow processes, were from the funny the century initial all the made, have spare to negatives. ”</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- End Single Comment  -->

                                        <!-- Start Single Comment  -->
                                        <li class="comment">
                                            <div class="comment-body">
                                                <div class="single-comment">
                                                    <div class="comment-img">
                                                        <img src='<c:url value="/templates/user/images/blog/author-image-5.png"/>' alt="Author Images">
                                                    </div>
                                                    <div class="comment-inner">
                                                        <h6 class="commenter">
                                                            <a class="hover-flip-item-wrapper" href="#">
                                                                            <span class="hover-flip-item">
                                                                                <span data-text="Rahabi Khan">Devon Lane</span>
                                                                            </span>
                                                            </a>
                                                            <span class="commenter-rating ratiing-four-star">
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                                        </span>
                                                        </h6>
                                                        <div class="comment-text">
                                                            <p>“We’ve created a full-stack structure for our working workflow processes, were from the funny the century initial all the made, have spare to negatives. ” </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- End Single Comment  -->
                                    </ul>
                                </div>
                                <!-- End .axil-commnet-area -->
                            </div>
                            <!-- End .col -->
                            <div class="col-lg-6 mb--40">
                                <!-- Start Comment Respond  -->
                                <div class="comment-respond pro-des-commend-respond mt--0">
                                    <h5 class="title mb--30">Add a Review</h5>
                                    <p>Your email address will not be published. Required fields are marked *</p>
                                    <div class="rating-wrapper d-flex-center mb--40">
                                        Your Rating <span class="require">*</span>
                                        <div class="reating-inner ml--20">
                                            <a href="#"><i class="fal fa-star"></i></a>
                                            <a href="#"><i class="fal fa-star"></i></a>
                                            <a href="#"><i class="fal fa-star"></i></a>
                                            <a href="#"><i class="fal fa-star"></i></a>
                                            <a href="#"><i class="fal fa-star"></i></a>
                                        </div>
                                    </div>

                                    <form action="#">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="message">Other Notes (optional)</label>
                                                    <textarea id="message" name="message" placeholder="Your Comment"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="name">Name <span class="require">*</span></label>
                                                    <input id="name" type="text">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="email">Email <span class="require">*</span> </label>
                                                    <input id="email" type="email">
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-submit">
                                                    <button type="submit" id="submit" class="axil-btn btn-bg-primary w-auto">Submit Comment</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- End Comment Respond  -->
                            </div>
                            <!-- End .col -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- woocommerce-tabs -->

</div>
<!-- End Shop Area  -->

<!-- Start Recently Viewed Product Area  -->
<div class="axil-product-area bg-color-white axil-section-gap pb--50 pb_sm--30">
    <div class="container">
        <div class="section-title-wrapper">
            <span class="title-highlighter highlighter-primary"><i class="far fa-shopping-basket"></i> Your Recently</span>
            <h2 class="title">Viewed Items</h2>
        </div>
        <div class="recent-product-activation slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide">
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-01.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">20% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="wishlist.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>3D™ wireless headset</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$30</span>
                                <span class="price current-price">$30</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-02.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">40% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>Media remote</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$80</span>
                                <span class="price current-price">$50</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-03.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">30% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>HD camera</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$60</span>
                                <span class="price current-price">$45</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-04.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">50% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>PS Remote Control</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$70</span>
                                <span class="price current-price">$35</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-05.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">25% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>PS Remote Control</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$50</span>
                                <span class="price current-price">$38</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-03.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">30% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>HD camera</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$60</span>
                                <span class="price current-price">$45</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-04.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">50% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="product-details.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>PS Remote Control</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$70</span>
                                <span class="price current-price">$35</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->
            <div class="slick-single-layout">
                <div class="axil-product">
                    <div class="thumbnail">
                        <a href='<c:url value="product-details.jsp"/>'>
                            <img src='<c:url value="/templates/user/images/product/electric/product-05.png"/>' alt="Product Images">
                        </a>
                        <div class="label-block label-right">
                            <div class="product-badget">25% OFF</div>
                        </div>
                        <div class="product-hover-action">
                            <ul class="cart-action">
                                <li class="wishlist"><a href='<c:url value="product-details.jsp"/>'><i class="far fa-heart"></i></a></li>
                                <li class="select-option"><a href='<c:url value="cart.jsp"/>'>Add to Cart</a></li>
                                <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="inner">
                            <h5 class="title"><a href='<c:url value="product-details.jsp"/>'>PS5 Remote Control</a></h5>
                            <div class="product-price-variant">
                                <span class="price old-price">$50</span>
                                <span class="price current-price">$38</span>
                            </div>
                            <div class="color-variant-wrapper">
                                <ul class="color-variant">
                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                    </li>
                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .slick-single-layout -->

        </div>
    </div>
</div>
<!-- End Recently Viewed Product Area  -->

<!-- Start Axil Newsletter Area  -->
<div class="axil-newsletter-area axil-section-gap pt--0">
    <div class="container">
        <div class="etrade-newsletter-wrapper bg_image bg_image--5">
            <div class="newsletter-content">
                <span class="title-highlighter highlighter-primary2"><i class="fas fa-envelope-open"></i>Newsletter</span>
                <h2 class="title mb--40 mb_sm--30">Get weekly update</h2>
                <div class="input-group newsletter-form">
                    <div class="position-relative newsletter-inner mb--15">
                        <label>
                            <input placeholder="example@gmail.com" type="text">
                        </label>
                    </div>
                    <button type="submit" class="axil-btn mb--15">Subscribe</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End .container -->
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Lấy tất cả các phần tử có class 'product-image-link'
        var productImageLinks = document.querySelectorAll('.product-image-link');

        // Gán sự kiện click cho mỗi phần tử
        productImageLinks.forEach(function (link) {
            link.addEventListener('click', function (event) {
                // Ngăn chặn hành vi mặc định của thẻ a
                event.preventDefault();

                // Lấy giá trị id từ thuộc tính data-product-id
                var productId = link.getAttribute('data-product-id');

                // Chuyển hướng đến trang chi tiết sản phẩm với id tương ứng
                window.location.href = '<c:url value="/views/user/product-details.jsp"/>?id=' + productId;
            });
        });
    });
</script>
<!-- End Axil Newsletter Area  -->