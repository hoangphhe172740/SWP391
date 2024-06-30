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
import java.util.List;
import model.Course;
import model.Lesson;
import model.Modules;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoadLessonControl", urlPatterns = {"/load-lesson"})
public class LoadLessonControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String course_raw = request.getParameter("courseid");
        int courseid;
        try {
            courseid = Integer.parseInt(course_raw);
            DAO d = new DAO();
            LessonDAO dao = new LessonDAO();
            Course list = d.getCourseById(courseid);
            List<Modules> listModule = dao.getAllModule();
            List<Modules> module_id = dao.getAllModuleByCid(courseid);
            System.out.println(module_id);
            request.setAttribute("module_id", module_id);
            request.setAttribute("listmodule", listModule);
            request.setAttribute("listCourse", list);
           request.getRequestDispatcher("createLesson.jsp").forward(request, response);
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
