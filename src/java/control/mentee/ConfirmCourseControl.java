package control.mentee;

import dao.DAO;
import dao.LessonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ConfirmCourseControl
 */
@WebServlet(name = "ConfirmServlet", urlPatterns = {"/confirm-control"})
public class ConfirmCourseControl extends HttpServlet {

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

        String courseRaw = request.getParameter("courseID");
        String accRaw = request.getParameter("account");
        String email = request.getParameter("email");

        DAO dao = new DAO();
        LessonDAO lessonDao = new LessonDAO();

        try {
            if (dao.checkEmailExist(email)) {
                int accId = Integer.parseInt(accRaw);
                int courseId = Integer.parseInt(courseRaw);

                lessonDao.AddHistoryJoin(accId, email, courseId);
                response.sendRedirect("join-course?Courseid=" + courseRaw);
            } else {
                response.sendRedirect("Login");
            }
        } catch (NumberFormatException e) {
            System.out.println("Number format exception: " + e.getMessage());
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
            response.sendRedirect("/SWP391/errorPage.jsp");
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
        return "Servlet for confirming course enrollment";
    }
}
