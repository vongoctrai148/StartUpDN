
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" href="css/customLogin.css">
    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card register">
            <div class="card-body">
                <h2 style="color: white">Sign up</h2>
                <form action="" class="formRegister" >
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="UserName *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Full Name *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="CCCD *" value="" />
                            </div>
                            <div class="form-group">
                                <label for="birthday" style="color: white">Ngày sinh</label>
                                <input type="date" maxlength="10" minlength="10" id="birthday" placeholder="birthday" class="form-control" value="" />
                            </div>
                            <%--Gender--%>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="man" checked>
                                <label class="form-check-label" for="man" style="color: white">
                                    Man
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="woman">
                                <label class="form-check-label" for="woman" style="color: white">
                                    Woman
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h5 style="color: white">Địa chỉ của bạn:</h5>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>Country</option>
                                    <option>Việt Nam</option>
                                    <option>America</option>
                                    <option>England</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>Province</option>
                                    <option>Việt Nam</option>
                                    <option>America</option>
                                    <option>England</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>District</option>
                                    <option>Việt Nam</option>
                                    <option>America</option>
                                    <option>England</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>Sub District</option>
                                    <option>Việt Nam</option>
                                    <option>America</option>
                                    <option>England</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="House no" value="" />
                            </div>
                            <input type="submit" class="btn btn-warning"  value="Register"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
</body>
</html>