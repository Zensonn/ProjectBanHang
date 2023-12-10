<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
        <li class="breadcrumb-item active"><b>Tổng số đơn hàng hiện có là: ${ordersCount}</b></li>
    </ul>
    <div id="clock"></div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <div class="row element-button">
                    <div class="col-sm-2">
                        <a class="btn btn-add btn-sm" href='<c:url value="/vendor/orders"/>' title="Thêm"><i
                                class="fas fa-plus"></i>
                            Tải lại</a>
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
                </div>

                <table class="table table-hover table-light table-bordered">
                    <thead class="text-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Sản phẩm</th>
                        <th scope="col">Giá trị</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Tính năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${ordersList}">
                        <tr>
                            <th scope="row">${order.id}</th>
                            <td>
                                <c:forEach var="orderItem" items="${order.orderItems}">
                                    ${orderItem.product.name}
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="orderItem" items="${order.orderItems}">
                                    <fmt:formatNumber pattern="###,###đ" value="${orderItem.product.price}"/>
                                </c:forEach>
                            </td>
<%--                            <td>${order.paid ? 'Đã thanh toán' : 'Chưa thanh toán'}</td>--%>
                            <td>${order.user.fullName}</td>
                            <td>${order.status}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.status == 'COMPLETED'}">
                                        <a type="button" class="btn btn-sm view" href='<c:url value="/vendor/view-order?id=${order.id}"/>'>
                                            <i class="fas fa-eye mr-1"></i> Xem đơn
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a type="button" class="btn btn-sm view" href='<c:url value="/vendor/view-order?id=${order.id}"/>'>
                                            <i class="fas fa-eye mr-1"></i> Xem đơn
                                        </a>
                                        <a type="button" class="btn btn-sm edit" href='<c:url value="/vendor/accept-order?id=${order.id}"/>'>
                                            <i class="fas fa-edit mr-1"></i> Nhận đơn
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a type="button" class="btn btn-sm trash" href='<c:url value="/vendor/cancel-order?id=${order.id}"/>'>
                                            <i class="fas fa-trash-alt mr-1"></i> Hủy đơn
                                        </a>
                                    </c:otherwise>
                                </c:choose>
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