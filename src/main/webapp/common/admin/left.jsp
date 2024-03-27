<%@ page contentType="text/html;charset=UTF-8"%>
<nav id="sidebar">
    <div class="sidebar-header">
        <h3><img src='<c:url value="/templates/admin/img/logo.png"/>' class="img-fluid" alt=""/><span>Quản Trị Viên</span></h3>
    </div>
    <ul class="list-unstyled components">
        <li class="active">
            <a href='<c:url value="/admin/user"/>' class="dashboard"><i class="material-icons">dashboard</i><span>Tổng Quan</span></a>
        </li>

        <div class="small-screen navbar-display">
            <li class="dropdown d-lg-none d-md-block d-xl-none d-sm-block">
                <a href="#homeSubmenu0" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">notifications</i><span> 4 notification</span></a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu0">
                    <li>
                        <a href="#">You have 5 new messages</a>
                    </li>
                    <li>
                        <a href="#">You're now friend with Mike</a>
                    </li>
                    <li>
                        <a href="#">Wish Mary on her birthday!</a>
                    </li>
                    <li>
                        <a href="#">5 warnings in Server Console</a>
                    </li>
                </ul>
            </li>

            <li class="d-lg-none d-md-block d-xl-none d-sm-block">
                <a href="#"><i class="material-icons">apps</i><span>apps</span></a>
            </li>

            <li class="d-lg-none d-md-block d-xl-none d-sm-block">
                <a href="#"><i class="material-icons">person</i><span>user</span></a>
            </li>

            <li class="d-lg-none d-md-block d-xl-none d-sm-block">
                <a href="#"><i class="material-icons">settings</i><span>setting</span></a>
            </li>
        </div>

        <li class="dropdown">
            <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="material-icons">aspect_ratio</i><span>Danh mục</span></a>
            <ul class="collapse list-unstyled menu" id="homeSubmenu1">
                <li>
                    <a href='<c:url value="/admin/category"/>'>Danh mục sản phẩm</a>
                </li>
                <li>
                    <a href='<c:url value="/admin/style"/>'>Thuộc tính sản phẩm</a>
                </li>
                <li>
                    <a href='<c:url value="/admin/style-value"/>'>Giá trị thuộc tính</a>
                </li>
            </ul>
        </li>

        <li class="">
            <a href='<c:url value="/admin/user"/>'><i class="material-icons">date_range</i><span>Người dùng</span></a>
        </li>
        <li class="">
            <a href='<c:url value="/user/logout"/>'><i class="material-icons">logout</i><span>Dăng Xuất</span></a>
        </li>
    </ul>
</nav>
