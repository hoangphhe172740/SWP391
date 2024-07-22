package control.mentors.modules;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Course;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class MentorManageCourseControl
 */
@WebServlet(name = "MentorManagerControl", urlPatterns = {"/mentor-manager"})
public class MentorManageCourseControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(MentorManageCourseControl.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                DAO dao = new DAO();
                List<Course> courses = dao.getCourseByMentor(account.getId());
                request.setAttribute("listCourse", courses);
                request.getRequestDispatcher("manager.jsp").forward(request, response);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error retrieving courses for mentor.", e);
                response.sendRedirect("errorPage.jsp");
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
        return "Handles requests for mentor-managed courses.";
    }
}
