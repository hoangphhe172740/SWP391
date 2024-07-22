package control.mentee;

import dao.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Question;
import model.Quiz;

/**
 * Servlet implementation class TakeQuizControl
 */
@WebServlet(name = "TakeQuizServlet", urlPatterns = {"/takequiz"})
public class TakeQuizControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(TakeQuizControl.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String quizIdRaw = request.getParameter("quizId");
        if (quizIdRaw == null || quizIdRaw.isEmpty()) {
            LOGGER.warning("Quiz ID parameter is missing or empty.");
            response.sendRedirect("/SWP391/errorPage.jsp");
            return;
        }

        try {
            int quizId = Integer.parseInt(quizIdRaw);
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null) {
                QuizDAO quizDAO = new QuizDAO();
                List<Question> questions = quizDAO.getQuestionsByQuizId(quizId);
                Quiz quiz = quizDAO.getQuizById(quizId);

                if (!quizDAO.isQuizUserExists(quizId, account.getId())) {
                    quizDAO.insertQuizUser(quizId, account.getId());
                }

                request.setAttribute("timeLimit", quiz.getQuizTime()); // quizTime is the time limit in seconds
                request.setAttribute("quizId", quizId);
                request.setAttribute("questions", questions);
                request.getRequestDispatcher("takequiz.jsp").forward(request, response);
            } else {
                response.sendRedirect("Login");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid quiz ID format: " + quizIdRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error accessing quiz data", e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST method is not implemented, redirecting to the GET method.
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for initiating and displaying quiz for the user.";
    }
}
