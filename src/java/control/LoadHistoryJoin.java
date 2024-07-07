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
import model.Course;

/**
 *
 * @author Admin
 */
@WebServlet(name="LoadHistoryJoin", urlPatterns={"/load-historyjoin"})
public class LoadHistoryJoin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String course_raw = request.getParameter("Courseid");
        int courseid;
        
        HttpSession session =request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if(a != null ){
            DAO d = new DAO();
            courseid = Integer.parseInt(course_raw);
            Course co = d.getCourseById(courseid);            
            request.setAttribute("listCourse", co);
            request.getRequestDispatcher("confirm.jsp").forward(request, response);
        }else{
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
    }// </editor-fold>

}
