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

@WebServlet(name = "AddQuizServlet", urlPatterns = {"/addquiz"})
public class AddQuizControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddQuizControl.class.getName());

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
            request.setAttribute("lessonId", lessonId);
            request.getRequestDispatcher("createQuiz.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid lesson ID format.", e);
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null && account.getRoleID() == 3) { // Ensure the user is a mentor
            try {
                int lessonId = Integer.parseInt(request.getParameter("lessonId"));
                String quizName = request.getParameter("quizName");
                String quizDescription = request.getParameter("quizDescription");
                int quizTime = Integer.parseInt(request.getParameter("quizTime"));
                int passScore = Integer.parseInt(request.getParameter("passScore"));
                int questionCount = Integer.parseInt(request.getParameter("questionCount"));

                QuizDAO dao = new QuizDAO();
                int quizId = dao.insertQuiz(lessonId, quizName, quizDescription, quizTime, passScore);

                if (quizId != -1) {
                    for (int i = 1; i <= questionCount; i++) {
                        String questionText = request.getParameter("questionText" + i);
                        String questionType = request.getParameter("questionType" + i);
                        int questionId = dao.insertQuestion(quizId, questionText, questionType);

                        int answerCount = 1;
                        while (true) {
                            String answerChoice = request.getParameter("answerChoice" + i + "-" + answerCount);
                            if (answerChoice == null || answerChoice.trim().isEmpty()) {
                                break;
                            }
                            boolean isCorrect = "true".equals(request.getParameter("isCorrect" + i + "-" + answerCount));
                            dao.insertAnswerChoice(questionId, answerChoice, isCorrect);
                            answerCount++;
                        }
                    }
                    response.sendRedirect("quizbylesson?lessonId=" + lessonId);
                } else {
                    LOGGER.log(Level.WARNING, "Failed to insert quiz for lesson ID: " + lessonId);
                    response.sendRedirect("errorPage.jsp");
                }
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid number format in quiz creation.", e);
                response.sendRedirect("errorPage.jsp");
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error processing quiz creation.", e);
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            response.sendRedirect("Login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles the creation of quizzes.";
    }
}
