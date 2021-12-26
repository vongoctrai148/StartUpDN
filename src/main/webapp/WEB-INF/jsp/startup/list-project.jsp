<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Projects</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="/image/png" href="/images/favicon.png">

    <!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="/plugins/animate-css/animate.css">
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/plugins/slick/slick.css">
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css">
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">

</head>
<body>
<div class="body-inner">
    <!--/ Header end -->
    <div id="banner-area" class="banner-area" style="background-image:url(/images/banner/banner1.jpg)">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Dự án</h1>
<%--                            <nav aria-label="breadcrumb">--%>
<%--                                <ol class="breadcrumb justify-content-center">--%>
<%--                                    <li class="breadcrumb-item"><a href="#">Home</a></li>--%>
<%--                                    <li class="breadcrumb-item"><a href="#">company</a></li>--%>
<%--                                    <li class="breadcrumb-item active" aria-current="page">Our Team</li>--%>
<%--                                </ol>--%>
<%--                            </nav>--%>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->
    <h5 style="margin-top: 3%; margin-left: 5%">Tìm kiếm theo danh mục cho các dự án: </h5>
    <form action="/startup/listProject" method="post" class="form-inline" style="margin-top: 2%; margin-left: 5%">
        <div class="input-group">
            <div class="form-outline">
                <select id="category" class="form-control" name="categoryId">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.categoryname}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </form>
    <section id="main-container" class="main-container pb-4">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-12">
                    <h3 class="section-sub-title">Các dự án</h3>
                </div>
            </div>
            <!--/ Title row end -->
            <div class="row">
                <c:forEach items="${listProjects}" var="project">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-5">
                        <div class="ts-team-wrapper">
                            <div class="team-img-wrapper">
                                <a href="/startup/projectDetail/${project.id}"><img loading="lazy" src="https://app.subsocial.network/ipfs/ipfs/Qmew3pMQhbC1uFEwfb6XF84C8VQAD1ZvmNmJvFaeLmU96x"
                                                                 style="height: 300px; width: 300px;"  class="img-fluid" alt="team-img"></a>
                            </div>
                            <div class="ts-team-content-classic">
                                <a href="/startup/projectDetail/${project.id}"><h3 class="ts-name">${project.projectname}</h3></a>
                                <p class="ts-designation">Được đánh giá: ${project.totalvoted}</p>
                                <a href="/startup/projectDetail/${project.id}"><p class="ts-description">${project.projectdetail}</p></a>
                                <div class="team-social-icons">
                                    <a href="/startup/projectDetail/${project.id}">Xem chi tiết</a>
                                </div>
                                <!--/ social-icons-->
                            </div>
                        </div>
                        <!--/ Team wrapper 3 end -->
                    </div><!-- Col end -->
                </c:forEach>
            </div><!-- Content row end -->
            <nav aria-label="...">
                <ul class="pagination pagination-lg">
                    <%-- Dưới đây là phân trang cho sản phẩm--%>
                    <c:forEach begin="1" end="${pageSize}" varStatus="index">
                        <li class="page-item"><a  class="page-link" href="/startup/listProject?page=${index.index}">${index.index}</a></li>
                    </c:forEach>
                </ul>
            </nav>
        </div><!-- Container end -->
    </section><!-- Main container end -->

    <!-- Javascript Files
    ================================================== -->

    <!-- initialize jQuery Library -->
    <script src="/plugins/jQuery/jquery.min.js"></script>
    <!-- Bootstrap jQuery -->
    <script src="/plugins/bootstrap/bootstrap.min.js" defer></script>
    <!-- Slick Carousel -->
    <script src="/plugins/slick/slick.min.js"></script>
    <script src="/plugins/slick/slick-animation.min.js"></script>
    <!-- Color box -->
    <script src="/plugins/colorbox/jquery.colorbox.js"></script>
    <!-- shuffle -->
    <script src="/plugins/shuffle/shuffle.min.js" defer></script>


    <!-- Google Map API Key-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
    <!-- Google Map Plugin-->
    <script src="/plugins/google-map/map.js" defer></script>

    <!-- Template custom -->
    <script src="/js/script.js"></script>

</div><!-- Body inner end -->
</body>

</html>