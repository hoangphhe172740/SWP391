package control.mentors.quizzes;

import dao.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Quiz;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "QuizByLessonServlet", urlPatterns = {"/quizbylesson"})
public class QuizByLessonServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(QuizByLessonServlet.class.getName());
    private QuizDAO dao = new QuizDAO();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null) {
                List<Quiz> quizzes = dao.getQuizzesByLessonId(lessonId, account.getId());

                request.setAttribute("quizzes", quizzes);
                request.setAttribute("lessonId", lessonId);

                request.getRequestDispatcher("quizbylesson.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid lesson ID format.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving quizzes.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Forward POST requests to the same handler as GET
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet that handles displaying quizzes for a specific lesson.";
    }
}
