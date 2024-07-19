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
@WebServlet(name = "CreateLessonControl", urlPatterns = {"/create-lesson"})
public class CreateLessonControl extends HttpServlet {

    DAO d = new DAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            try {
                String courseid = request.getParameter("id");
                String name = request.getParameter("name");
                String image = request.getParameter("image");
                String lesson_name = request.getParameter("lessonname");
                String lesson_video = request.getParameter("lessonvideo");
                String pmodule = request.getParameter("module");
                LessonDAO dao = new LessonDAO();
                dao.AddLesson(pmodule, lesson_name, lesson_video, a.getId());
                request.setAttribute("report", "Add New lesson Successfully!");
                //load lai form 
                Course list = d.getCourseById(Integer.parseInt(courseid));
                List<Modules> listModule = dao.getAllModule();
                List<Modules> module_id = dao.getAllModuleByCid(Integer.parseInt(courseid));
                System.out.println(module_id);
                request.setAttribute("module_id", module_id);
                request.setAttribute("listmodule", listModule);
                request.setAttribute("listCourse", list);
                request.getRequestDispatcher("CreateLesson.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Login");
            }
        } else {
            response.sendRedirect("home");
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
