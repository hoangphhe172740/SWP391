package control.mentors.modules;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Lesson;
import model.Modules;

/**
 * Servlet implementation class EditLessonServlet
 */
@WebServlet(name = "EditLessonServlet", urlPatterns = {"/edit-lesson"})
public class EditLessonServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(EditLessonServlet.class.getName());
    private final DAO lessonDAO = new DAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonIdParam = request.getParameter("lessonid");
        String courseIdParam = request.getParameter("courseid");

        if (lessonIdParam == null || courseIdParam == null) {
            LOGGER.warning("Missing lesson ID or course ID parameter.");
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            int lessonId = Integer.parseInt(lessonIdParam);
            int courseId = Integer.parseInt(courseIdParam);

            Lesson lesson = lessonDAO.getLessonById(lessonId);
            List<Modules> modules = lessonDAO.getModulesByCourseId(courseId);

            request.setAttribute("modules", modules);
            if (lesson != null) {
                request.setAttribute("lesson", lesson);
                request.getRequestDispatcher("editlesson.jsp").forward(request, response);
            } else {
                LOGGER.warning("Lesson not found for ID: " + lessonId);
                response.sendRedirect("errorPage.jsp");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid lesson ID or course ID format.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing edit lesson request.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                int moduleId = Integer.parseInt(request.getParameter("module_id"));
                int lessonId = Integer.parseInt(request.getParameter("lesson_id"));
                String lessonName = request.getParameter("lesson_name");
                String lessonVideo = request.getParameter("lesson_video");
                int duration = Integer.parseInt(request.getParameter("duration"));
                boolean isActive = Boolean.parseBoolean(request.getParameter("status"));

                Lesson lesson = new Lesson(moduleId, lessonId, lessonName, lessonVideo, duration, account.getId(), isActive);

                lessonDAO.updateLesson(lesson);
                response.sendRedirect("edit-lesson?lessonid=" + lessonId + "&courseid=" + courseId);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid number format in lesson update.", e);
                response.sendRedirect("errorPage.jsp");
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error updating lesson.", e);
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles editing of lessons including retrieving and updating lesson details.";
    }
}
