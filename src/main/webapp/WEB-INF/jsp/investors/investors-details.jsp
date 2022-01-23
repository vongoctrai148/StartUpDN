<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
================================================== -->
    <meta charset="utf-8"/>
    <title>Project Tile</title>

    <!-- Mobile Specific Metas
================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="Construction Html5 Template"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0"/>

    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="/images/favicon.png"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css"/>
    <!-- Animation -->
    <link rel="stylesheet" href="/plugins/animate-css/animate.css"/>
    <!-- slick Carousel -->
    <link rel="stylesheet" href="/plugins/slick/slick.css"/>
    <link rel="stylesheet" href="/css/custom.css"/>
    <link rel="stylesheet" href="/plugins/slick/slick-theme.css"/>
    <!-- Colorbox -->
    <link rel="stylesheet" href="/plugins/colorbox/colorbox.css"/>
    <!-- Template styles-->
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="body-inner">
    <!--/ Topbar end -->
    <!-- Header start -->
    <!--/ Header end -->
    <div id="banner-area" class="banner-area" style="background-image: url(/images/banner/banner1.jpg);">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Doanh nghiệp</h1>
                            <nav aria-label="breadcrumb">

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
                    <div class="navigation"><a href="#"><i class="fas fa-home"></i>Trang chủ</a><a href="#"> > Nhà đầu
                        tư</a><a href="#"> > ${details.investorsname}</a></div>

                    <div class="post-content post-single">
                        <div class="post-body">
                            <div class="entry-header">
                                <h3 class="entry-title">
                                    Tên Đơn vị: ${details.investorsname}
                                </h3>
                            </div>
                            <div class="entry-header">
                                <h4 class="entry-title">
                                    Tên viết tắt: ${details.abbreviations}
                                </h4>
                            </div>
                            <div class="row no-gutters">
                                <div class="col-2"><strong>Logo:</strong></div>
                                <div class="col-10 logo_supporter"><img height="180" width="180" src="/ndt/images/nhadautu/${details.logo}"
                                                                        alt="Quỹ đổi mới công nghệ quốc gia"></div>
                            </div>

                            <!-- header end -->
                            <div class=""><strong>Nôi dung:</strong></div>
                            <div class="entry-content">

                                <textarea class="form-control" id="details" style="height: 150vh; color: black"
                                          readonly>${details.content}</textarea>
                            </div>
                            <div id="page-slider" class="page-slider">
                            </div><!-- Page slider end -->

                        </div>
                        <!-- post-body end -->
                    </div>
                    <!-- post content end -->
                    <div class="author-box d-nlock d-sm-flex">
                        <div class="author-img mb-4 mb-md-0">
                            <img loading="lazy" src="/images/userImages/${details.user.avataruser}" alt="author"/>
                        </div>
                        <div class="author-info">
                            <h3>Thông tin liên hệ</h3>
                            <h3>${details.user.fullname}<span>${details.user.job}</span></h3>
                            <p class="mb-2"><strong>Địa chỉ:</strong> ${details.houseno} - ${details.subdistrict}
                                - ${details.district} - ${details.province} - ${details.country}</p>
                            <p class="mb-2"><strong>Điện thoại:</strong> ${details.sdt}</p>
                            <p class="mb-2"><strong>Email:</strong>${details.user.email}</p>
                            <button type="button" class="btn btn-primary" href="#"><i class="fas fa-envelope"></i>Liên
                                hệ với ${details.user.email}</button>
                        </div>
                    </div>
                    <!-- Author box end -->


                    <!-- Post comment start -->

                    <!-- Post comment end -->
                </div>
                <!-- Content Col end -->

            </div>
        </div>
            <!-- Main row end -->
        </div>
        <!-- Conatiner end -->
    </section>

    <script>
        $(function () {
            $(".my-rating-9").starRating({
                initialRating: 5,
                disableAfterRate: false,
                onHover: function (currentIndex, currentRating, $el) {
                    console.log('index: ', currentIndex, 'currentRating: ', currentRating, ' DOM element ', $el);
                    $('.live-rating').val(currentIndex);
                },
                onLeave: function (currentIndex, currentRating, $el) {
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
