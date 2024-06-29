<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lessons</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .container {
                max-width: 800px;
                margin: auto;
                padding: 20px;
                color: #333; /* Trung tính h?n so v?i màu tr?ng ho?c ?en c?ng */
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .lesson-item {
                background-color: #5a6268; /* Màu xám trung tính */
                color: white;
                padding: 10px 20px;
                margin-bottom: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
                border-radius: 5px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* Thêm bóng cho kh?i */
            }

            .lesson-item i {
                transition: transform 0.3s ease;
            }

            .lesson-item:hover {
                background-color: #495057; /* Sáng h?n m?t chút khi di */
                transform: translateY(-2px); /* Nh? nhàng nâng lên */
                box-shadow: 0 4px 10px rgba(0,0,0,0.3); /* Bóng ??m h?n */
            }

            .lesson-item:hover i {
                transform: rotate(90deg); /* Xoay icon khi hover */
            }

            .lesson-content {
                display: none;
                padding: 20px;
                border-left: 4px solid #adb5bd; /* Màu xám nh?t */
                margin-bottom: 10px;
                background-color: #f8f9fa;
                transition: all 0.4s ease-out; /* Chuy?n ??i m??t mà cho n?i dung */
            }

            button {
                background-color: #6c757d; /* Màu xám */
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.2s ease;
                outline: none;
            }

            button:hover {
                background-color: #5a6268; /* ??m h?n khi di chu?t qua */
                box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* Thêm bóng */
            }

            .video-content {
                margin-top: 20px;
                border-top: 2px solid #007bff; /* Màu xám nh?t */
                padding-top: 20px;
            }

            @media (min-width: 768px) {
                .container {
                    padding: 20px 40px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:forEach var="o" items="${Listlesson}">
                <div class="lesson-item" onclick="toggleSection(this)">
                    <span><i class="fas fa-chevron-down"></i> ${o.lesson_name}</span>                   
                </div>
                <div class="lesson-content">
                    <b>.</b><button onclick="toggleVideo(this)"> Xem Video</button>
                    <div class="video-content" style="display:none;">
                        <p>${o.lesson_video}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                        function toggleSection(element) {
                            const content = element.nextElementSibling;
                            const icon = element.querySelector('i');
                            if (content.style.display === "none" || !content.style.display) {
                                content.style.display = "block";
                                icon.classList.remove('fa-chevron-down');
                                icon.classList.add('fa-chevron-up');
                            } else {
                                content.style.display = "none";
                                icon.classList.remove('fa-chevron-up');
                                icon.classList.add('fa-chevron-down');
                            }
                        }

                        function toggleVideo(button) {
                            const videoContent = button.nextElementSibling;
                            videoContent.style.display = videoContent.style.display === "block" ? "none" : "block";
                        }
        </script>
    </body>
</html>