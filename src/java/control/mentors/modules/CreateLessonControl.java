package control.mentors.modules;

import dao.DAO;
import dao.LessonDAO;
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
import model.Course;
import model.Modules;

/**
 * Servlet implementation class CreateLessonControl
 */
@WebServlet(name = "CreateLessonControl", urlPatterns = {"/create-lesson"})
public class CreateLessonControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateLessonControl.class.getName());
    private final DAO dao = new DAO();

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

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                String courseIdStr = request.getParameter("id");
                String lessonName = request.getParameter("lessonname");
                String lessonVideo = request.getParameter("lessonvideo");
                String moduleIdStr = request.getParameter("module");

                if (courseIdStr == null || lessonName == null || lessonVideo == null || moduleIdStr == null) {
                    throw new IllegalArgumentException("Required parameters are missing.");
                }

                int courseId = Integer.parseInt(courseIdStr);

                LessonDAO lessonDAO = new LessonDAO();
                lessonDAO.AddLesson(moduleIdStr, lessonName, lessonVideo, account.getId());

                request.setAttribute("report", "Add New Lesson Successfully!");

                // Reload the form
                Course course = dao.getCourseById(courseId);
                List<Modules> allModules = lessonDAO.getAllModule();
                List<Modules> moduleByCourseId = lessonDAO.getAllModuleByCid(courseId);

                request.setAttribute("module_id", moduleByCourseId);
                request.setAttribute("listmodule", allModules);
                request.setAttribute("listCourse", course);

                request.getRequestDispatcher("createLesson.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid number format in parameters", e);
                request.setAttribute("error", "Invalid number format in parameters.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            } catch (IllegalArgumentException e) {
                LOGGER.log(Level.WARNING, e.getMessage(), e);
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error processing lesson creation", e);
                request.setAttribute("error", "An error occurred while creating the lesson.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles lesson creation and form reload.";
    }
}
