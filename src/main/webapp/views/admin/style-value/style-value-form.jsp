<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<caption>
    <h2>
        <c:if test="${styleValue != null}">
            Sửa giá trị
        </c:if>
        <c:if test="${styleValue == null}">
            Thêm giá trị
        </c:if>
    </h2>
</caption>
<c:if test="${styleValue != null}">
    <form action='<c:url value="/admin/style-value/update"/>' method="post" class="row g-3">
</c:if>
<c:if test="${styleValue == null}">
    <form action='<c:url value="/admin/style-value/create"/>' method="post" class="row g-3">
</c:if>
        <input type="hidden" value="${styleValue.id}" name="id"/>
        <div class="col-4">
            <label class="form-label" for="categorySelect">Tên danh mục: </label>
            <select class="form-control" id="categorySelect" name="category.id">
                <option value="0">Chọn thuộc tính</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}" <c:if test="${category.id eq styleValue.style.category.id}">selected</c:if>>
                            ${category.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-4">
            <label class="form-label" for="styleSelect">Tên thuộc tính: </label>
            <select  class="form-control" id="styleSelect" name="style.id">
                <option value="0">Chọn thuộc tính</option>
                <c:forEach items="${styles}" var="style">
                    <option value="${style.id}" data-category="${style.category.id}" <c:if test="${style.id eq styleValue.style.id}">selected</c:if>>
                            ${style.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-4">
            <label for="style-value" class="form-label">Giá trị: </label>
            <input id="style-value" class="form-control" type="text" value="${styleValue.name}" name="name">
        </div>
        <div class="col-12 mt-3">
            <button type="submit" class="btn btn-primary">Lưu lại</button>
        </div>
    </form>

<script>
    // Lấy thẻ categorySelect và styleSelect
    var categorySelect = document.getElementById("categorySelect");
    var styleSelect = document.getElementById("styleSelect");

    // Lưu các option trong styleSelect khi trang tải
    var defaultStyleOptions = styleSelect.innerHTML;

    // Lắng nghe sự kiện thay đổi trên thẻ categorySelect
    categorySelect.addEventListener("change", function() {
        // Xóa tất cả các option trong styleSelect
        styleSelect.innerHTML = defaultStyleOptions;

        var selectedCategoryId = this.value;

        // Nếu danh mục được chọn là "0" (giá trị mặc định), đặt giá trị styleSelect thành "0" (Chọn thuộc tính)
        if (selectedCategoryId === "0") {
            styleSelect.value = "0";
        }

        // Nếu danh mục được chọn không phải là "0," ẩn các option không phù hợp
        if (selectedCategoryId !== "0") {
            for (var i = 0; i < styleSelect.options.length; i++) {
                var option = styleSelect.options[i];
                var categoryAttribute = option.getAttribute("data-category");

                // Ẩn hoặc hiện option dựa trên danh mục đã chọn
                if (categoryAttribute !== selectedCategoryId) {
                    option.style.display = "none";
                } else {
                    option.style.display = "block";
                }
            }
        }
    });
</script>
