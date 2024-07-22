package control.mentee;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import model.Course;

/**
 * Servlet implementation class LoadHistoryJoin
 */
@WebServlet(name = "LoadHistoryJoin", urlPatterns = {"/load-historyjoin"})
public class LoadHistoryJoin extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            String courseIdRaw = request.getParameter("Courseid");
            if (courseIdRaw != null) {
                try {
                    int courseId = Integer.parseInt(courseIdRaw);
                    DAO dao = new DAO();
                    Course course = dao.getCourseById(courseId);

                    if (course != null) {
                        if (course.getMentorId() == account.getId()) {
                            response.sendRedirect("detail?Courseid=" + courseId + "&mess=You cannot study the course you are teaching");
                        } else {
                            request.setAttribute("listCourse", course);
                            request.getRequestDispatcher("confirm.jsp").forward(request, response);
                        }
                    } else {
                        response.sendRedirect("errorPage.jsp?message=Course not found");
                    }
                } catch (NumberFormatException e) {
                    System.err.println("Invalid course ID format: " + e.getMessage());
                    response.sendRedirect("errorPage.jsp?message=Invalid course ID format");
                } catch (Exception e) {
                    System.err.println("Error retrieving course: " + e.getMessage());
                    response.sendRedirect("errorPage.jsp?message=Error retrieving course");
                }
            } else {
                response.sendRedirect("errorPage.jsp?message=Course ID is missing");
            }
        } else {
            response.sendRedirect("Login");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet that handles course enrollment history and validation";
    }
}
