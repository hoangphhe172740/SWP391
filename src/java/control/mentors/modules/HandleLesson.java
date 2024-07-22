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
 * Servlet implementation class HandleLesson
 */
@WebServlet(name = "HandleLesson", urlPatterns = {"/lessons"})
public class HandleLesson extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(HandleLesson.class.getName());
    private final DAO dao = new DAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String moduleIdParam = request.getParameter("moduleId");
        String courseIdParam = request.getParameter("courseid");

        if (moduleIdParam == null || courseIdParam == null) {
            LOGGER.warning("Missing module ID or course ID parameter.");
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            int moduleId = Integer.parseInt(moduleIdParam);
            int courseId = Integer.parseInt(courseIdParam);

            List<Lesson> lessons = dao.getLessonsByModuleId(moduleId);
            List<Modules> modules = dao.getModulesByCourseId(courseId);

            request.setAttribute("modules", modules);
            request.setAttribute("lessons", lessons);
            request.setAttribute("selectedModuleId", moduleId);

            request.getRequestDispatcher("modulesAndLessons.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid number format for module ID or course ID.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing lessons request.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonIdParam = request.getParameter("lessonId");
        String courseIdParam = request.getParameter("courseid");
        String moduleIdParam = request.getParameter("moduleId");

        if (lessonIdParam == null || courseIdParam == null || moduleIdParam == null) {
            LOGGER.warning("Missing lesson ID, course ID, or module ID parameter.");
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            int lessonId = Integer.parseInt(lessonIdParam);
            int courseId = Integer.parseInt(courseIdParam);
            int moduleId = Integer.parseInt(moduleIdParam);

            dao.deleteLesson(lessonId);

            response.sendRedirect("lessons?moduleId=" + moduleId + "&courseid=" + courseId);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid number format for lesson ID, course ID, or module ID.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting lesson.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles requests for displaying and managing lessons.";
    }
}
