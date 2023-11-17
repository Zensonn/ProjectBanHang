<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<caption>
    <h2>
        <c:if test="${orders != null}">
            Sửa đơn hàng
        </c:if>
        <c:if test="${orders == null}">
            Thêm đơn hàng
        </c:if>
    </h2>
</caption>
<c:if test="${orders != null}">
    <form action='<c:url value="/vendor/order/update"/>' method="post" class="row g-3">
</c:if>
<c:if test="${orders == null}">
    <form action='<c:url value="/vendor/order/create"/>' method="post" class="row g-3">
</c:if>
<input type="hidden" value="${orders.id}" name="id"/>


<div class="col-6">
    <label class="form-label">Số điện thoại: </label>
    <input class="form-control" type="text" value="${orders.phone}" name="phone">
</div>
<div class="col-6">
    <label class="form-label">Địa chỉ: </label>
    <input class="form-control" type="text" value="${orders.address}" name="address">
</div>
<div class="col-6">
    <label class="form-label">Trạng thái: </label>
    <input class="form-control" type="text" value="${orders.status}" name="status">
</div>
<div class="col-6">
    <label class="form-label">Giá tiền: </label>
    <input class="form-control" type="text" value="${orders.amountFromStore}" name="amountFromStore">
</div>
<div class="col-6">
    <label class="form-label">Đã thu: </label>
    <input class="form-control" type="text" value="${orders.amountFromUser}" name="amountFromUser">
</div>
<div class="col-6">
    <label class="form-label">Thanh toán qua: </label>
    <input class="form-control" type="text" value="${orders.isPaid}" name="isPaid">
</div>
<div class="col-12 mt-3">
    <button type="submit" class="btn btn-primary">Lưu lại</button>
</div>
</form>
