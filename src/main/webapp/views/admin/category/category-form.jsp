<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ include file="/common/taglib.jsp" %>
<caption>
  <h2>
    <c:if test="${category != null}">
      Sửa danh mục
    </c:if>
    <c:if test="${category == null}">
      Thêm danh mục
    </c:if>
  </h2>
</caption>
<c:if test="${category != null}">
  <form action='<c:url value="/admin/category/update"/>' method="post" enctype="multipart/form-data" class="row g-3"></c:if>
<c:if test="${category == null}">
  <form action='<c:url value="/admin/category/create"/>' method="post" enctype="multipart/form-data" class="row g-3"></c:if>
    <input type="hidden" value="${category.id}" name="id"/>
    <div class="col-6">
      <label class="form-label">Tên danh mục: </label>
      <input class="form-control" type="text" value="${category.name}" name="name">
    </div>
    <div class="col-6">
      <label class="form-label">Icon</label>
      <input class="form-control" type="file" value="${category.image}" name="image">
    </div>
    <div class="col-12 mt-3">
      <button type="submit" class="btn btn-primary">Lưu lại</button>
    </div>
  </form>