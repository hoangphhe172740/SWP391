package control.mentors.modules;

import dao.DAO;
import dao.LessonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Lesson;
import model.Modules;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class LoadLessonControl
 */
@WebServlet(name = "LoadLessonControl", urlPatterns = {"/load-lesson"})
public class LoadLessonControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LoadLessonControl.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String courseRaw = request.getParameter("courseid");
        if (courseRaw == null || courseRaw.isEmpty()) {
            LOGGER.warning("Missing or empty courseid parameter.");
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(courseRaw);

            DAO dao = new DAO();
            LessonDAO lessonDAO = new LessonDAO();

            Course course = dao.getCourseById(courseId);
            List<Modules> allModules = lessonDAO.getAllModule();
            List<Modules> modulesByCourseId = lessonDAO.getAllModuleByCid(courseId);

            request.setAttribute("module_id", modulesByCourseId);
            request.setAttribute("listmodule", allModules);
            request.setAttribute("listCourse", course);

            request.getRequestDispatcher("createLesson.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error loading lesson information.", e);
            response.sendRedirect("errorPage.jsp");
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
        return "Servlet to load lesson information by course ID.";
    }
}
