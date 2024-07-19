/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddServlet", urlPatterns = {"/add"})
public class AddServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String image = request.getParameter("image");
            String title = request.getParameter("title");
            String pcategory = request.getParameter("category");
            String mentorId = request.getParameter("mentor"); // Lấy giá trị mentor
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a != null) {
                DAO d = new DAO();
                d.InsertCourse(name, description, price, image, title, 2, pcategory, mentorId); // Truyền giá trị mentor
                response.sendRedirect("manager");

            }
        } catch (NumberFormatException e) {
            System.out.println(e);
            response.sendRedirect("Login");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
