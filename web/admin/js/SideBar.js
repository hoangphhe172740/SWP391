/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener('DOMContentLoaded', function () {
    var subnavItems = document.querySelectorAll('.has-subnav > a');

    subnavItems.forEach(function (item) {
        item.addEventListener('click', function (event) {
            event.preventDefault();
            var parent = this.parentElement;
            var isActive = parent.classList.contains('active');

            // Close all other subnavs
            document.querySelectorAll('.has-subnav').forEach(function (el) {
                el.classList.remove('active');
            });

            // Toggle the clicked subnav
            if (!isActive) {
                parent.classList.add('active');
            }
        });
    });
});