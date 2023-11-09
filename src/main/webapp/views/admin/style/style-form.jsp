<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<caption>
    <h2>
        <c:if test="${style != null}">
            Sửa thuộc tính
        </c:if>
        <c:if test="${style == null}">
            Thêm thuộc tính
        </c:if>
    </h2>
</caption>
<c:if test="${style != null}">
    <form action='<c:url value="/admin/style/update"/>' method="post" class="row g-3">
</c:if>
<c:if test="${style == null}">
    <form action='<c:url value="/admin/style/create"/>' method="post" class="row g-3">
</c:if>
        <input type="hidden" value="${style.id}" name="id"/>
        <div class="col-6">
            <label class="form-label" for="categorySelect">Tên danh mục: </label>
                <select  class="form-control" id="categorySelect" name="category.id">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}"  <c:if test="${category.id eq style.category.id}">selected</c:if>>
                            <c:out value="${category.name}"/>
                        </option>
                    </c:forEach>
                </select>
        </div>

        <div class="col-6">
            <label class="form-label">Tên thuộc tính: </label>
            <input class="form-control" type="text" value="${style.name}" name="name">
        </div>
        <div class="col-12 mt-3">
            <button type="submit" class="btn btn-primary">Lưu lại</button>
        </div>
    </form>
