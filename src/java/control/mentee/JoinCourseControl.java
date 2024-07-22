package control.mentee;

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
import model.Account;
import model.Course;
import model.Modules;

/**
 * Servlet implementation class JoinCourseControl
 */
@WebServlet(name = "JoinCourseControl", urlPatterns = {"/join-course"})
public class JoinCourseControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String courseRaw = request.getParameter("Courseid");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                int courseId = Integer.parseInt(courseRaw);
                DAO dao = new DAO();
                LessonDAO lessonDao = new LessonDAO();

                Course course = dao.getCourseById(courseId);
                List<Modules> modulesList = lessonDao.getAllModuleByCid(courseId);

                request.setAttribute("listModule", modulesList);
                request.setAttribute("listc", course);
                request.getRequestDispatcher("joinCourse.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.err.println("Invalid course ID format: " + e.getMessage());
                response.sendRedirect("/SWP391/errorPage.jsp");
            } catch (Exception e) {
                System.err.println("Error retrieving course or modules: " + e.getMessage());
                response.sendRedirect("/SWP391/errorPage.jsp");
            }
        } else {
            response.sendRedirect("Login");
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
        return "Servlet for handling course joining requests";
    }
}
