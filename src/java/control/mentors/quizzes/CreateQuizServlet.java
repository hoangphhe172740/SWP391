package control.mentors.quizzes;

import dao.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "CreateQuizServlet", urlPatterns = {"/cequiz"})
public class CreateQuizServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateQuizServlet.class.getName());

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
        request.getRequestDispatcher("createQuiz.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null && account.getRoleID() == 3) { // Ensure the user is a mentor
            try {
                int lessonId = Integer.parseInt(request.getParameter("lessonId"));
                String quizName = request.getParameter("quizName");
                String quizDescription = request.getParameter("quizDescription");
                int quizTime = Integer.parseInt(request.getParameter("quizTime"));
                int passScore = Integer.parseInt(request.getParameter("passScore"));

                QuizDAO dao = new QuizDAO();
                int quizId = dao.insertQuiz(lessonId, quizName, quizDescription, quizTime, passScore);

                if (quizId != -1) {
                    String[] questionTexts = request.getParameterValues("questionText");
                    String[] questionTypes = request.getParameterValues("questionType");

                    if (questionTexts != null && questionTypes != null) {
                        for (int i = 0; i < questionTexts.length; i++) {
                            int questionId = dao.insertQuestion(quizId, questionTexts[i], questionTypes[i]);

                            String[] answerChoices = request.getParameterValues("answerChoice" + i);
                            String[] corrects = request.getParameterValues("isCorrect" + i);

                            if (answerChoices != null && corrects != null) {
                                for (int j = 0; j < answerChoices.length; j++) {
                                    boolean isCorrect = "true".equals(corrects[j]);
                                    dao.insertAnswerChoice(questionId, answerChoices[j], isCorrect);
                                }
                            }
                        }
                    }
                    response.sendRedirect("lessonDetails?lessonId=" + lessonId);
                } else {
                    LOGGER.log(Level.WARNING, "Failed to create quiz with lesson ID: " + lessonId);
                    response.sendRedirect("errorPage.jsp");
                }
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Number format exception during quiz creation.", e);
                response.sendRedirect("errorPage.jsp");
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Exception during quiz creation.", e);
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for creating quizzes.";
    }
}
