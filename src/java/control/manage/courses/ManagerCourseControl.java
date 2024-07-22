package control.manage.courses;

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
import model.Category;
import model.Course;

/**
 * Servlet implementation class ManagerCourseControl
 */
@WebServlet(name = "ManagerCourseControl", urlPatterns = {"/manager"})
public class ManagerCourseControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ManagerCourseControl.class.getName());

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

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                int roleId = account.getRoleID();
                DAO dao = new DAO();

                List<Course> userCourses = dao.getCourseByCreatedby(roleId);
                List<Category> categories = dao.getAllCaregories();
                List<Course> allCourses = dao.getAllCourse();
                List<Account> mentorDetails = dao.getMentorsDetails();

                request.setAttribute("listMentorDetails", mentorDetails);
                request.setAttribute("listC", categories);
                request.setAttribute("listCourse", userCourses);
                request.setAttribute("allCourses", allCourses); // Added for completeness

                request.getRequestDispatcher("managercourse.jsp").forward(request, response);
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error retrieving course management details", e);
                response.sendRedirect("/SWP391/errorPage.jsp");
            }
        } else {
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for managing courses";
    }
}
