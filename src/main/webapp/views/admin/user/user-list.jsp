<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <div class="row element-button">
                    <div class="col-sm-2">
                        <a class="btn btn-add btn-sm" title="Thêm"><i
                                class="fas fa-plus"></i>
                            Thêm giá trị thuộc tính</a>
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
                            <form action="<c:url value="/admin/user"/>" method="get">
                                <label for="keyword"></label>
                                <input type="text" placeholder="Tìm kiếm" id="keyword" name="keyword" value="${keyword}">
                                <button class="search__btn">
                                    <img src='<c:url value="/templates/admin/img/search.png"/>' alt="">
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <table class="table table-hover table-light table-bordered">
                    <thead class="text-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Tên người dùng</th>
                        <th scope="col">Quyền truy cập</th>
                        <th scope="col">Tính năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <th scope="row">${user.id}</th>
                            <th>${user.email}</th>
                            <td>${user.userName}</td>
                            <td>${user.role}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not user.emailActive}">
                                        <a type="button" class="btn btn-sm edit" href='<c:url value="/admin/unban-user?email=${user.email}"/>'>
                                            <i class="fas fa-unlock mr-1"></i> Bỏ chặn
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a type="button" class="btn btn-sm trash" href='<c:url value="/admin/ban-user?email=${user.email}"/>'>
                                            <i class="fas fa-times-circle mr-1"></i> Chặn
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
