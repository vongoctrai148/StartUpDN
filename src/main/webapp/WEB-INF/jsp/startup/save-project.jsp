
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Constra - Construction Html5 Template</title>

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
    <style>
        figure{
            width: 45%;
        }
        img {

            width: 100%;
        }
    </style>
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
                            <!-- <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                                  <li class="breadcrumb-item"><a href="#">News</a></li>
                                  <li class="breadcrumb-item active" aria-current="page">News Right sidebar</li>
                                </ol>
                            </nav> -->
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="main-container" class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <h1 style="margin-bottom: 10%">Dự án của bạn</h1>
                    <form:form action="/startup/saveProject" method="POST" modelAttribute="projectForm" enctype="multipart/form-data">
                        <form:hidden path="id"/>
                        <div class="form-group">
                            <label for="categoryId">Danh mục dự án</label>
                            <form:select class="form-control" id="categoryId" path="categoryId">
                                <form:options items="${categories}" itemLabel="categoryname" itemValue="id"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="projectname">Tên dự án</label>
                            <form:input path="projectname" class="form-control" id="projectname"  placeholder="Enter project name"/>
                        </div>
                        <div class="form-group">
                            <label for="title">Tiêu đề cho dự án (Mục đích)</label>
                            <form:input path="title" class="form-control" id="title"/>
                        </div>
                        <div class="form-group">
                            <label for="amountcalled">Số tiền muốn kêu gọi</label>
                            <form:input path="amountcalled" class="form-control" id="amountcalled" />
                        </div>
                        <div class="form-group">
                            <label for="projectdetail">Mô tả chi tiết dự án</label>
                            <form:textarea path="projectdetail" class="form-control"  id="projectdetail" style="height: 60vh; color: black" ></form:textarea>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ dự án:</label>
                        </div>
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="country">Country: </label>
                                <form:select class="form-control" id="country" path="country">
                                    <option value="Việt Nam">Việt Nam</option>
                                </form:select>
                            </div>
                            <div class="form-group col">
                                <label for="provinceId">Tỉnh/Thành phố: </label>
                                <form:select class="form-control" id="provinceId" path="province">
                                    <form:options items="${provinces}" itemLabel="name" itemValue="id"/>
                                </form:select>
                            </div>
                            <div class="form-group col">
                                <label for="districtId">Quận/Huyện: </label>
                                <form:select class="form-control" id="districtId" path="district">
                                    <option selected value="">Chọn Quận Huyện</option>
                                </form:select>
                            </div>
                            <div class="form-group col">
                                <label for="subdistrictId">Xã/Phường: </label>
                                <form:select class="form-control" id="subdistrictId" path="subdistrict">
                                    <option selected value="">Chọn Xã Phường</option>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="housenoId">Địa chỉ nhà - Đường/Thôn</label>
                            <form:input type="text" class="form-control" id="housenoId" path="houseno"/>
                        </div>
                        <label>Lưu ý: </label>
                        <div class="form-group">
                            <label>Chọn ảnh cho dự án</label>
                            <input type="file" multiple id="imageOfProject" name="imageofproject" onchange="preview()" style="display: none;">
                            <label for="imageOfProject" style="background-color: orange; cursor: pointer; padding: 10px; margin-top: 2%;">
                                <i class="fas fa-upload"></i>Chọn ảnh
                            </label>
                            <div id="images" style="display: flex;"></div>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng dự án</button>
                    </form:form>
                </div><!-- Content Col end -->

                <div class="col-lg-4">
                    <div class="sidebar sidebar-right">
                        <div class="widget">
                            <h3 class="widget-title">Categories</h3>
                            <ul class="arrow nav nav-tabs">
                                <li><a href="#">Construction</a></li>
                                <li><a href="#">Commercial</a></li>
                                <li><a href="#">Building</a></li>
                                <li><a href="#">Safety</a></li>
                                <li><a href="#">Structure</a></li>
                            </ul>
                        </div><!-- Categories end -->

                        <div class="widget">
                            <h3 class="widget-title">Archives </h3>
                            <ul class="arrow nav nav-tabs">
                                <li><a href="#">Feburay 2016</a></li>
                                <li><a href="#">January 2016</a></li>
                                <li><a href="#">December 2015</a></li>
                                <li><a href="#">November 2015</a></li>
                                <li><a href="#">October 2015</a></li>
                            </ul>
                        </div><!-- Archives end -->

                        <div class="widget widget-tags">
                            <h3 class="widget-title">Tags </h3>

                            <ul class="list-unstyled">
                                <li><a href="#">Construction</a></li>
                                <li><a href="#">Design</a></li>
                                <li><a href="#">Project</a></li>
                                <li><a href="#">Building</a></li>
                                <li><a href="#">Finance</a></li>
                                <li><a href="#">Safety</a></li>
                                <li><a href="#">Contracting</a></li>
                                <li><a href="#">Planning</a></li>
                            </ul>
                        </div><!-- Tags end -->


                    </div><!-- Sidebar end -->
                </div><!-- Sidebar Col end -->

            </div><!-- Main row end -->

        </div><!-- Container end -->
    </section><!-- Main container end -->

    <footer id="footer" class="footer bg-overlay">
        <div class="footer-main">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-4 col-md-6 footer-widget footer-about">
                        <h3 class="widget-title">About Us</h3>
                        <img loading="lazy" width="200px" class="footer-logo" src="/images/footer-logo.png" alt="Constra">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor inci done idunt ut
                            labore et dolore magna aliqua.</p>
                        <div class="footer-social">
                            <ul>
                                <li><a href="https://facebook.com/themefisher" aria-label="Facebook"><i
                                        class="fab fa-facebook-f"></i></a></li>
                                <li><a href="https://twitter.com/themefisher" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                                </li>
                                <li><a href="https://instagram.com/themefisher" aria-label="Instagram"><i
                                        class="fab fa-instagram"></i></a></li>
                                <li><a href="https://github.com/themefisher" aria-label="Github"><i class="fab fa-github"></i></a></li>
                            </ul>
                        </div><!-- Footer social end -->
                    </div><!-- Col end -->

                    <div class="col-lg-4 col-md-6 footer-widget mt-5 mt-md-0">
                        <h3 class="widget-title">Working Hours</h3>
                        <div class="working-hours">
                            We work 7 days a week, every day excluding major holidays. Contact us if you have an emergency, with our
                            Hotline and Contact form.
                            <br><br> Monday - Friday: <span class="text-right">10:00 - 16:00 </span>
                            <br> Saturday: <span class="text-right">12:00 - 15:00</span>
                            <br> Sunday and holidays: <span class="text-right">09:00 - 12:00</span>
                        </div>
                    </div><!-- Col end -->

                    <div class="col-lg-3 col-md-6 mt-5 mt-lg-0 footer-widget">
                        <h3 class="widget-title">Services</h3>
                        <ul class="list-arrow">
                            <li><a href="service-single.html">Pre-Construction</a></li>
                            <li><a href="service-single.html">General Contracting</a></li>
                            <li><a href="service-single.html">Construction Management</a></li>
                            <li><a href="service-single.html">Design and Build</a></li>
                            <li><a href="service-single.html">Self-Perform Construction</a></li>
                        </ul>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Footer main end -->

        <div class="copyright">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="copyright-info text-center text-md-left">
              <span>Copyright &copy; <script>
                  document.write(new Date().getFullYear())
                </script>, Designed &amp; Developed by <a href="https://themefisher.com">Themefisher</a></span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="footer-menu text-center text-md-right">
                            <ul class="list-unstyled">
                                <li><a href="about.html">About</a></li>
                                <li><a href="team.html">Our people</a></li>
                                <li><a href="faq.html">Faq</a></li>
                                <li><a href="news-left-sidebar.html">Blog</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!-- Row end -->

                <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
                    <button class="btn btn-primary" title="Back to Top">
                        <i class="fa fa-angle-double-up"></i>
                    </button>
                </div>

            </div><!-- Container end -->
        </div><!-- Copyright end -->
    </footer><!-- Footer end -->


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
    <script src="/js/multipleImageJS.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#provinceId').on('change',function(){
                var provinceId = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: "/province/" + provinceId,
                    success: function(result) {
                        var result = JSON.parse(result);
                        var s = '';
                        for(var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#districtId').html(s);
                    }
                });
            });
            $('#districtId').on('change',function(){
                var districtId = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: "/district/" + districtId,
                    success: function(result) {
                        var result = JSON.parse(result);
                        var s = '';
                        for(var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#subdistrictId').html(s);
                    }
                });
            });
        });
    </script>

</div><!-- Body inner end -->
</body>

</html>