<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="modal" id="notificationModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông báo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>
                <c:if test="${not empty error}">
                    <p>${error}</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        // Kiểm tra điều kiện và hiển thị modal nếu cần
        const message = "${message}";
        const error = "${error}";

        if (message !== "" || error !== "") {
            const modal = new bootstrap.Modal(document.getElementById('notificationModal'));
            modal.show();
        }
    };
</script>
