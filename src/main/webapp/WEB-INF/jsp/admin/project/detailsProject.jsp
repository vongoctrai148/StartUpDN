<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
================================================== -->
    <meta charset="utf-8" />
    <title>Project Tile</title>

    <!-- Mobile Specific Metas
================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Construction Html5 Template" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />

    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css" />
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css" />
    <!-- Animation -->
    <link rel="stylesheet" href="/plugins/animate-css/animate.css" />
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/plugins/slick/slick.css" />
    <link rel="stylesheet" href="/css/custom.css" />
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css" />
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css" />
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<div class="body-inner">

    <!--/ Header end -->
    <div id="banner-area" class="banner-area" style="background-image: url(/images/banner/banner1.jpg);">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Dự án</h1>
                            <nav aria-label="breadcrumb">
                                <!-- <ol class="breadcrumb justify-content-center">
                          <li class="breadcrumb-item"><a href="#">Home</a></li>
                          <li class="breadcrumb-item"><a href="#">News</a></li>
                          <li class="breadcrumb-item active" aria-current="page">News Right sidebar</li>
                        </ol> -->
                            </nav>
                        </div>
                    </div>
                    <!-- Col end -->
                </div>
                <!-- Row end -->
            </div>
            <!-- Container end -->
        </div>
        <!-- Banner text end -->
    </div>
    <!-- Banner area end -->

    <section id="main-container" class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg mb-5 mb-lg-0">
                    <div class="post-content post-single">
                        <h4><a href="#"> ${project.category.categoryname} > ${project.projectname}</a></h4>
                        <div class="post-media post-image">
                            <img loading="lazy" src="/images/projects/${project.imagepresent}" class="img-fluid" alt="post-image" />
                        </div>

                        <div class="post-body">
                            <div class="entry-header">
                                <div class="post-meta">
                                    <span class="post-author"> <i class="far fa-user"></i><a href="#">${project.user.fullname}</a> </span>

                                    <span class="post-meta-date"><i class="far fa-calendar"></i> Ngày đăng: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${project.postedday}" /> </span>
                                    <span class="post-comment"><i class="far fa-comment"></i> 03<a href="#" class="comments-link">Comments</a></span>
                                </div>
                                <h5>
                                    -> Mục đích dự án: ${project.title}
                                </h5>
                                <h4 style=" color: orange">Số vốn kêu gọi: <fmt:formatNumber value="${project.amountcalled}" maxFractionDigits="0" currencyCode="VND" type="currency" currencySymbol="VND"/></h4>
                                <blockquote>
                                    <p>Location: ${project.houseno} - ${project.subdistrict} - ${project.district}
                                        - ${project.province} - ${project.country}</p>
                                </blockquote>
                            </div>
                            <!-- header end -->

                            <div class="entry-content">
                                <textarea class="form-control" id="projectDetail" style="height: 100vh; color: black" readonly>${project.projectdetail}</textarea>
                            </div>
                            <div id="page-slider" class="page-slider" style="display: flex; justify-content: center; align-items: center;">
                                <c:forEach items="${imageOfProject}" var="image">
                                    <div class="item" style="text-align: center;">
                                        <img loading="lazy" class="img-fluid" src="/images/projectImages/${image.imagename}" />
                                    </div>
                                </c:forEach>
                            </div><!-- Page slider end -->

                        </div>
                        <!-- post-body end -->
                    </div>
                    <!-- post content end -->

                    <div style="display: flex ;justify-content: center">
                        <button  type="button" class="btn btn-danger"><a href="/admin/listProject/detailsProject/deny/${project.id}">Từ chối</a></button>
                        <button style="margin-left: 20%" type="button" class="btn btn-success"><a href="/admin/listProject/detailsProject/acept/${project.id}" >Đồng ý</a></button>
                    </div>
                    <!-- Author box end -->

                    <!-- Post comment start -->
                    <!-- Post comment end -->
                </div>

            </div>
            <!-- Main row end -->
        </div>
        <!-- Conatiner end -->
    </section>
    <!-- Main container end -->

    <!-- Footer end -->

    <!-- Javascript Files
================================================== -->
    <script>
        $(function() {
            $(".my-rating-9").starRating({
                initialRating: 5,
                disableAfterRate: false,
                onHover: function(currentIndex, currentRating, $el){
                    console.log('index: ', currentIndex, 'currentRating: ', currentRating, ' DOM element ', $el);
                    $('.live-rating').val(currentIndex);
                },
                onLeave: function(currentIndex, currentRating, $el){
                    console.log('index: ', currentIndex, 'currentRating: ', currentRating, ' DOM element ', $el);
                    $('.live-rating').val(currentRating);
                }
            });
        });
    </script>
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
    <script src="/js/star.js"></script>
    <!-- Template custom -->
    <script src="/js/script.js"></script>
</div>
<!-- Body inner end -->
</body>
</html>
