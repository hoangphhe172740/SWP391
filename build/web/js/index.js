/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Lấy tất cả các ô chủ đề
const topicBoxes = document.querySelectorAll('.single-list-topics-content');

// Thêm sự kiện click cho từng ô chủ đề
topicBoxes.forEach(box => {
    box.addEventListener('click', () => {
        // Loại bỏ class "active" khỏi tất cả các ô chủ đề
        topicBoxes.forEach(b => b.classList.remove('active'));
        
        // Thêm class "active" vào ô chủ đề được chọn
        box.classList.add('active');
    });
});