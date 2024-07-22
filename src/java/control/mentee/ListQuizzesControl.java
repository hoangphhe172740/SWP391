package control.mentee;

import dao.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Account;
import model.Quiz;

/**
 * Servlet implementation class ListQuizzesControl
 */
@WebServlet(name = "ListQuizzesControl", urlPatterns = {"/list-quizzes-client"})
public class ListQuizzesControl extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Existing code can be placed here if necessary for POST requests.
        } catch (Exception e) {
            System.err.println("Error in processRequest: " + e.getMessage());
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String lessonIdRaw = request.getParameter("lessonId");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null && lessonIdRaw != null) {
            try {
                int lessonId = Integer.parseInt(lessonIdRaw);
                QuizDAO quizDao = new QuizDAO();
                List<Quiz> quizzes = quizDao.getQuizzesByLessonClientId(lessonId, account.getId());
                
                request.setAttribute("lessons", quizzes);
                request.getRequestDispatcher("listQuizClient.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.err.println("Invalid lesson ID format: " + e.getMessage());
                response.sendRedirect("/SWP391/errorPage.jsp");
            } catch (Exception e) {
                System.err.println("Error retrieving quizzes: " + e.getMessage());
                response.sendRedirect("/SWP391/errorPage.jsp");
            }
        } else {
            response.sendRedirect("home");
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for listing quizzes based on lesson ID.";
    }
}
