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
 * Servlet implementation class DeleteCourseControl
 */
@WebServlet(name="DeleteControl", urlPatterns={"/delete"})
public class DeleteCourseControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(DeleteCourseControl.class.getName());

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
        String courseIdRaw = request.getParameter("courseId");

        if (courseIdRaw == null || courseIdRaw.isEmpty()) {
            LOGGER.warning("Course ID parameter is missing or empty.");
            response.sendRedirect("/SWP391/errorPage.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(courseIdRaw);
            DAO dao = new DAO();
            dao.deleteCourseById(courseId);
            response.sendRedirect("manager");
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format: " + courseIdRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting course with ID: " + courseIdRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for deleting courses";
    }
}
