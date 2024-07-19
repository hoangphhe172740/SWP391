<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <style>
            body {
                margin: 0;
                padding-top: 40px;
                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }
            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }
            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }
            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }
            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }
            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }
            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }
            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }
            .account-settings .about p {
                font-size: 0.825rem;
            }
            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }

        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <form action="profile" method="post" enctype="multipart/form-data">
                    <div class="row gutters">
                        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                            <!-- Left Panel with User Info -->
                            <div class="card h-100">
                                <div class="card-body">

                                    <!-- User Profile Info -->
                                    <div class="account-settings">
                                        <div class="user-profile">
                                            <div class="user-avatar">
                                                <img id="preview" src="${user.avatar}" alt="${user.fullName}">
                                        </div>
                                        <h5 class="user-name">${user.fullName}</h5>
                                        <h6 class="user-email">${user.email}</h6>
                                    </div>
                                    <div class="about">
                                        <h5>About</h5>
                                        <p>I'm ${user.fullName}. Full Stack Designer. I enjoy creating user-centric, delightful, and human experiences.</p>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="image">Avatar</label>
                                                <input type="file" class="form-control-file" id="image" name="image" onchange="showImage(this);">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <!-- Right Panel with Update Form -->
                        <div class="card h-100">
                            <div class="card-body">
                                <!-- Form for Updating Profile -->

                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                    </div>
                                    <!-- Input Fields for Profile Details -->
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Email</label>
                                            <input type="email" class="form-control" id="eMail" name="eMail" value="${user.email}" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="gender">Gender</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gender" name="gender" value="true" ${user.gender ? 'checked' : ''}>
                                                <label class="form-check-label" for="gender">
                                                    Male
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="nation">Nation</label>
                                            <input type="text" class="form-control" id="nation" name="nation" value="${user.nation}" required>
                                        </div>
                                    </div>

                                </div>
                                <!-- Submit Button -->
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
<script>
    // Hàm này sẽ được gọi khi người dùng chọn file ảnh
    function showImage(input) {
        // Kiểm tra xem input có chứa file hay không
        if (input.files && input.files[0]) {
            // Tạo một đối tượng FileReader để đọc nội dung của file
            var reader = new FileReader();
            // Định nghĩa hàm onload cho đối tượng FileReader
            reader.onload = function (e) {
                // Lấy đối tượng img theo id
                var img = document.getElementById("preview");
                // Gán nội dung của file cho thuộc tính src của img
                img.src = e.target.result;
                // Thay đổi kích thước của img nếu cần
                img.width = 245;
                img.height = 160;
                var fileName = input.files[0].name;
                document.getElementById("filename").value = "images/" + fileName;

            };
            // Đọc nội dung của file dưới dạng URL
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>