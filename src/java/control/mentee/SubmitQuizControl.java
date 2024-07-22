package control.mentee;

import dao.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Quiz;

@WebServlet(name = "SubmitQuizServlet", urlPatterns = {"/submitquiz"})
public class SubmitQuizControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("my-learning");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null) {
            try {
                Map<Integer, List<Integer>> userAnswers = extractUserAnswers(request);
                Map<Integer, Boolean> booleanAnswers = extractBooleanAnswers(request);

                int score = calculateScore(userAnswers, booleanAnswers, quizId);
                QuizDAO quizDAO = new QuizDAO();
                Quiz quiz = quizDAO.getQuizById(quizId);
                int passScore = quiz.getPassScore();

                boolean isPassed = score >= passScore;
                quizDAO.updateQuizUser(quizId, account.getId(), score, isPassed);

                forwardToResultPage(request, response, isPassed, quiz.getLessonId(), score, passScore, quizId);
            } catch (Exception e) {
                Logger.getLogger(SubmitQuizControl.class.getName()).log(Level.SEVERE, "Error processing quiz submission", e);
                response.sendRedirect("/SWP391/errorPage.jsp"); // Redirect to an error page
            }
        } else {
            response.sendRedirect("Login");
        }
    }

    private Map<Integer, List<Integer>> extractUserAnswers(HttpServletRequest request) {
        Map<Integer, List<Integer>> userAnswers = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();

        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("question-")) {
                int questionId = Integer.parseInt(paramName.substring(9));
                String[] selectedAnswers = request.getParameterValues(paramName);
                if (selectedAnswers != null) {
                    List<Integer> answers = new ArrayList<>();
                    for (String answerId : selectedAnswers) {
                        answers.add(Integer.parseInt(answerId));
                    }
                    userAnswers.put(questionId, answers);
                }
            }
        }
        return userAnswers;
    }

    private Map<Integer, Boolean> extractBooleanAnswers(HttpServletRequest request) {
        Map<Integer, Boolean> booleanAnswers = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();

        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("question-")) {
                int questionId = Integer.parseInt(paramName.substring(9));
                String[] selectedAnswers = request.getParameterValues(paramName);
                if (selectedAnswers != null && selectedAnswers.length == 1) {
                    booleanAnswers.put(questionId, Boolean.parseBoolean(selectedAnswers[0]));
                }
            }
        }
        return booleanAnswers;
    }

    private int calculateScore(Map<Integer, List<Integer>> userAnswers, Map<Integer, Boolean> booleanAnswers, int quizId) throws Exception {
        int score = 0;
        QuizDAO quizDAO = new QuizDAO();
        int questionPoints = 100 / quizDAO.getTotalQuestions(quizId);

        for (Map.Entry<Integer, List<Integer>> entry : userAnswers.entrySet()) {
            int questionId = entry.getKey();
            List<Integer> answers = entry.getValue();
            if (quizDAO.areAnswersCorrect(questionId, answers)) {
                score += questionPoints;
            }
        }

        for (Map.Entry<Integer, Boolean> entry : booleanAnswers.entrySet()) {
            int questionId = entry.getKey();
            boolean userAnswer = entry.getValue();
            if (quizDAO.isBooleanAnswerCorrect(questionId, Boolean.toString(userAnswer))) {
                score += questionPoints;
            }
        }

        return score;
    }

    private void forwardToResultPage(HttpServletRequest request, HttpServletResponse response,
                                     boolean isPassed, int lessonId, int score, int passScore, int quizId)
            throws ServletException, IOException {
        request.setAttribute("isPassed", isPassed);
        request.setAttribute("lessonId", lessonId);
        request.setAttribute("score", score);
        request.setAttribute("passScore", passScore);
        request.setAttribute("quizId", quizId);
        request.getRequestDispatcher("resultPage.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles quiz submissions and calculates scores.";
    }
}
