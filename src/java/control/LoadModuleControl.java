/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Lesson;

/**
 *
 * @author Admin
 */
@WebServlet(name="LoadModuleControl", urlPatterns={"/load-module"})
public class LoadModuleControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String module_raw = request.getParameter("moduleID");
        int moduleid;
        try {
            moduleid = Integer.parseInt(module_raw);
            LessonDAO dao = new LessonDAO();
            List<Lesson> les =  dao.getLessonByModuleid(moduleid);
            System.out.println(les);
            request.setAttribute("Listlesson", les);
            request.getRequestDispatcher("joinCourse.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
