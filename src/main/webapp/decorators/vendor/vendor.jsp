<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>cms dashboard
    </title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href='<c:url value="/templates/vendor/css/bootstrap.min.css"/>'>
    <!----css3---->
    <link rel="stylesheet" href='<c:url value="/templates/vendor/css/custom.css"/>'>
    <link rel="stylesheet" href='<c:url value="/templates/vendor/css/main.css"/>'>
    <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <!--google material icon-->
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
</head>
<body>

<div class="wrapper">
    <div class="body-overlay"></div>
    <%@ include file="/common/vendor/left.jsp" %>
    <div id="content">
        <%@ include file="/common/vendor/header.jsp" %>
        <div class="main-content">
            <decorator:body></decorator:body>
        </div>
    </div>
</div>

<script src='<c:url value="/templates/admin/js/jquery-3.3.1.slim.min.js"/>'></script>
<script src='<c:url value="/templates/admin/js/popper.min.js"/>'></script>
<script src='<c:url value="/templates/admin/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/templates/admin/js/jquery-3.3.1.min.js"/>'></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $('#content').toggleClass('active');
        });

        $('.more-button,.body-overlay').on('click', function () {
            $('#sidebar,.body-overlay').toggleClass('show-nav');
        });

    });
</script>
</body>
</html>
