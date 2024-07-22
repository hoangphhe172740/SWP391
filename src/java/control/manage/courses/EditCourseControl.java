package control.manage.courses;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class EditCourseControl
 */
@WebServlet(name = "EditCourseControl", urlPatterns = {"/edit"})
public class EditCourseControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(EditCourseControl.class.getName());

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

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String courseIdRaw = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String mentorId = request.getParameter("mentor"); // Mentor ID

        if (courseIdRaw == null || courseIdRaw.isEmpty()) {
            LOGGER.warning("Course ID parameter is missing or empty.");
            response.sendRedirect("/SWP391/errorPage.jsp");
            return;
        }

        try {
            DAO dao = new DAO();
            dao.EditCourse(name, description, image, title, category, courseIdRaw, mentorId);
            response.sendRedirect("manager");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating course with ID: " + courseIdRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for editing course details";
    }
}
