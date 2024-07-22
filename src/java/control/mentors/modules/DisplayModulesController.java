package control.mentors.modules;

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
import model.Lesson;
import model.Modules;

/**
 * Servlet implementation class DisplayModulesController
 */
@WebServlet(name = "DisplayModulesController", urlPatterns = {"/display-modules"})
public class DisplayModulesController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(DisplayModulesController.class.getName());
    private final DAO dao = new DAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseIdRaw = request.getParameter("courseid");

        if (courseIdRaw == null || courseIdRaw.isEmpty()) {
            LOGGER.warning("Course ID parameter is missing or empty.");
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(courseIdRaw);
            List<Modules> modules = dao.getModulesByCourseId(courseId);
            
            if (modules.isEmpty()) {
                LOGGER.warning("No modules found for course ID: " + courseId);
            }

            request.setAttribute("modules", modules);

            if (!modules.isEmpty()) {
                int moduleId = modules.get(0).getModule_id();
                List<Lesson> lessons = dao.getLessonsByModuleId(moduleId);
                request.setAttribute("lessons", lessons);
                request.setAttribute("selectedModuleId", moduleId);
            }

            request.getRequestDispatcher("modulesAndLessons.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format: " + courseIdRaw, e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving modules and lessons", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST requests to GET method
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles displaying modules and lessons for a given course.";
    }
}
