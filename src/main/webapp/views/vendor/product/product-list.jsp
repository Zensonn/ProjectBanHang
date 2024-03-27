<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>

<div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
        <li class="breadcrumb-item active"><b>Tổng số sản phẩm hiện có là: ${productCount}</b></li>
    </ul>
    <div id="clock"></div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <div class="row element-button">
                    <div class="col-sm-2">
                        <a class="btn btn-add btn-sm" href='<c:url value="/vendor/product/new"/>' title="Thêm"><i
                                class="fas fa-plus"></i>
                            Tạo mới sản phẩm</a>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập"><i
                                class="fas fa-file-upload"></i> Tải từ file</a>
                    </div>

                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm print-file" type="button" title="In"><i
                                class="fas fa-print"></i> In dữ liệu</a>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button" title="Sao chép"><i
                                class="fas fa-copy"></i> Sao chép</a>
                    </div>

                    <div class="col-sm-2">
                        <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm pdf-file" type="button" title="In)"><i
                                class="fas fa-file-pdf"></i> Xuất PDF</a>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm" type="button" title="Xóa"><i
                                class="fas fa-trash-alt"></i> Xóa tất cả </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="text-sm-left d-flex align-items-center">
                            <label>
                                Hiện
                                <select id="pageSizeSelect" aria-controls="sampleTable" class="form-select">
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                </select>
                                danh mục
                            </label>
                        </div>
                    </div>

                    <!-- Form tìm kiếm -->
                    <div class="col-sm-12 col-md-6">
                        <div class="text-sm-right">
                            <form action="<c:url value="/vendor/product"/>" method="get">
                                <label for="keyword"></label>
                                <input type="text" placeholder="Tìm kiếm" id="keyword" name="keyword" value="${keyword}">
                                <button class="search__btn">
                                    <img src='<c:url value="/templates/vendor/img/search.png"/>' alt="">
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <table class="table table-hover table-light table-bordered">
                    <thead class="text-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Giá gốc</th>
                        <th scope="col">Giá giảm</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Đã bán</th>
                        <th scope="col">Danh mục</th>
                        <th scope="col">Tính năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <th scope="row">${product.id}</th>
                            <td>
                                <c:url value="/image?fileName=product/${product.image != null ? product.image : 'uploads/abc.jpg'}" var="imgUrl"/>
                                <img height="50px" width="50px" src="${imgUrl}" alt="">
                            </td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.promotionalPrice}</td>
                            <td>${product.quantity}</td>
                            <td>${product.sold}</td>
                            <td>${product.category.name}</td>
                            <td>
                                <a type="button" class="btn btn-sm edit" href='<c:url value="/vendor/product/edit?id=${product.id}"/>'>
                                    <i class="fas fa-edit mr-1"></i> Sửa
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a type="button" class="btn btn-sm trash" href='<c:url value="/vendor/product/delete?id=${product.id}"/>'>
                                    <i class="fas fa-trash-alt mr-1"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Nút điều hướng trang -->
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-end">
        <li class="page-item">
            <a class="page-link" href="?page=<c:out value='${currentPage - 1}'/>&pageSize=<c:out value='${pageSize}&keyword=${keyword}'/>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <c:forEach begin="1" end="${totalPage}" var="page">
            <li class="page-item">
                <a class="page-link" href="?page=<c:out value='${page}'/>&pageSize=<c:out value='${pageSize}&keyword=${keyword}'/>"><c:out value="${page}"/></a>
            </li>
        </c:forEach>
        <li class="page-item">
            <a class="page-link" href="?page=<c:out value='${currentPage + 1}'/>&pageSize=<c:out value='${pageSize}&keyword=${keyword}'/>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        const pageSizeSelect = document.getElementById("pageSizeSelect");
        const urlParams = new URLSearchParams(window.location.search);
        const pageSizeParam = urlParams.get("pageSize");

        if (pageSizeParam) {
            pageSizeSelect.value = pageSizeParam;
        }

        pageSizeSelect.addEventListener("change", function() {
            const currentPage = urlParams.get("page") || 1;
            const selectedPageSize = this.value;
            window.location.href = window.location.pathname + "?page=" + currentPage + "&pageSize=" + selectedPageSize;
        });
    });
</script>


<!-- Placeholder for displaying data -->
<div id="dataContainer"></div>

<script>
    function loadData() {
        // Lấy giá trị của select
        var selectedValue = document.getElementById("pageSizeSelect").value;

        // Gửi yêu cầu đến server để lấy dữ liệu tương ứng từ cơ sở dữ liệu
        // Ở đây, bạn có thể sử dụng AJAX hoặc Fetch API

        // Sau khi nhận được dữ liệu, cập nhật nội dung trong #dataContainer
        // Dưới đây là một ví dụ giả sử dữ liệu là một mảng các dòng
        var data = [
            { id: 1, content: "Dòng 1" },
            { id: 2, content: "Dòng 2" },
            // ... thêm dữ liệu tương ứng từ cơ sở dữ liệu
        ];

        var dataContainer = document.getElementById("dataContainer");
        dataContainer.innerHTML = ""; // Xóa nội dung cũ

        // Hiển thị các dòng tương ứng trong #dataContainer
        data.forEach(function (item) {
            var row = document.createElement("div");
            row.innerHTML = "ID: " + item.id + " - " + item.content;
            dataContainer.appendChild(row);
        });
    }
</script>