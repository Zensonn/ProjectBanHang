<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/common/taglib.jsp" %>
<caption>
    <h2>
        <c:if test="${product != null}">
            Sửa danh mục
        </c:if>
        <c:if test="${product == null}">
            Thêm danh mục
        </c:if>
    </h2>
</caption>
<c:if test="${product != null}">
    <form action='<c:url value="/vendor/product/update"/>' method="post" enctype="multipart/form-data" class="row g-3"></c:if>
<c:if test="${product == null}">
    <form action='<c:url value="/vendor/product/create"/>' method="post" enctype="multipart/form-data" class="row g-3"></c:if>
<input type="hidden" value="${product.id}" name="id"/>
<div class="col-6">
    <label class="form-label">Tên sản phẩm </label>
    <input class="form-control" type="text" value="${product.name}" name="name">
</div>
<div class="col-6">
    <label class="form-label">Hình ảnh</label>
    <input class="form-control" type="file" value="${product.image}" name="image">
</div>
<div class="col-6">
    <label class="form-label">Giá bán</label>
    <input class="form-control" type="text" value="${product.price}" name="price">
</div>
<div class="col-6">
    <label class="form-label">Giảm giá (%)</label>
    <input class="form-control" type="text" value="${product.percentDiscount}" name="percentDiscount">
</div>
<div class="col-6">
    <label class="form-label">Mô tả</label>
    <input class="form-control" type="text" value="${product.description}" name="description">
</div>
<div class="col-6">
    <label class="form-label">Số lượng</label>
    <input class="form-control" type="text" value="${product.quantity}" name="quantity">
</div>
<div class="col-6">
    <label class="form-label" for="categorySelect">Tên danh mục: </label>
    <select  class="form-control" id="categorySelect" name="category.id">
        <c:forEach items="${categories}" var="category">
            <option value="${category.id}"  <c:if test="${category.id eq product.category.id}">selected</c:if>>
                <c:out value="${category.name}"/>
            </option>
        </c:forEach>
    </select>
</div>
<div class="col-12 mt-3">
    <button type="submit" class="btn btn-primary">Lưu lại</button>
</div>
</form>
