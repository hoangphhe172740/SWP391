/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Course;
import model.Modules;

/**
 *
 * @author Admin
 */
@WebServlet(name = "JoinServlet", urlPatterns = {"/join-course"})
public class JoinServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String course_raw = request.getParameter("Courseid");
        int courseid;
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            DAO d = new DAO();
            LessonDAO dao = new LessonDAO();
            courseid = Integer.parseInt(course_raw);           
            Course listc = d.getCourseById(courseid); 
            List<Modules> listModule = dao.getAllModuleByCid(courseid);
            System.out.println(listModule);
            request.setAttribute("listModule", listModule);
            request.setAttribute("listc", listc);
            request.getRequestDispatcher("joinCourse.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
