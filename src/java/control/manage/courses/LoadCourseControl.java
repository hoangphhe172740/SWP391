package control.manage.courses;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;
import model.Course;

/**
 * Servlet implementation class LoadCourseControl
 */
@WebServlet(name = "LoadCourseControl", urlPatterns = {"/loadCourse"})
public class LoadCourseControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LoadCourseControl.class.getName());

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

        String courseIdRaw = request.getParameter("courseid");

        if (courseIdRaw == null || courseIdRaw.isEmpty()) {
            LOGGER.warning("Course ID parameter is missing or empty.");
            response.sendRedirect("/SWP391/errorPage.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(courseIdRaw);
            DAO dao = new DAO();
            Course course = dao.getCourseById(courseId);
            List<Category> categories = dao.getAllCaregories();
            int categoryId = dao.getCategoryId(courseId);
            List<Course> allCourses = dao.getAllCourse();
            List<Account> mentorDetails = dao.getMentorsDetails();

            request.setAttribute("listMentorDetails", mentorDetails);
            request.setAttribute("category_id", categoryId);
            request.setAttribute("listC", categories);
            request.setAttribute("detail", course);

            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format: " + courseIdRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error loading course details", e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for loading course details for editing";
    }
}
