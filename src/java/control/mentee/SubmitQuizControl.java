/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.mentee;

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Quiz;

/**
 *
 * @author khanh
 */
@WebServlet(name = "SubmitQuizServlet", urlPatterns = {"/submitquiz"})
public class SubmitQuizControl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitQuizServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitQuizServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        response.sendRedirect("my-learning");
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
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        HttpSession session = request.getSession();
        // Process quiz submission and redirect to the result page
        Account account = (Account) session.getAttribute("acc");
        if (account
                != null) {
            Map<Integer, List<Integer>> userAnswers = new HashMap<>(); // Store user answers by questionId
            Map<Integer, Boolean> booleanAnswers = new HashMap<>(); // Store True/False answers by questionId

            // Retrieve all answers from request
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("question-")) {
                    int questionId = Integer.parseInt(paramName.substring(9));
                    String[] selectedAnswers = request.getParameterValues(paramName);
                    if (selectedAnswers != null) {
                        if (selectedAnswers.length == 1 && (selectedAnswers[0].equals("true") || selectedAnswers[0].equals("false"))) {
                            // Handle True/False questions
                            booleanAnswers.put(questionId, Boolean.parseBoolean(selectedAnswers[0]));
                        } else {
                            // Handle Multiple Choice and Single Choice questions
                            List<Integer> answers = new ArrayList<>();
                            for (String answerId : selectedAnswers) {
                                answers.add(Integer.parseInt(answerId));
                            }
                            userAnswers.put(questionId, answers);
                        }
                    }
                }
            }

            // Process user answers and calculate score
            int score;
            try {
                score = calculateScore(userAnswers, booleanAnswers, quizId);
                QuizDAO quizDAO = new QuizDAO();
                Quiz quiz = quizDAO.getQuizById(quizId);
                int passScore = quiz.getPassScore(); // Assume `getPassScore` method exists

                boolean isPassed = score >= passScore;
                quizDAO.updateQuizUser(quizId, account.getId(), score, isPassed);

                request.setAttribute("isPassed", isPassed);
                request.setAttribute("lessonId", quiz.getLessonId());
                request.setAttribute("score", score);
                request.setAttribute("passScore", passScore);
                request.setAttribute("quizId", quizId);
            } catch (SQLException ex) {
                Logger.getLogger(SubmitQuizControl.class.getName()).log(Level.SEVERE, null, ex);
            }
            // Forward to result page
            request.getRequestDispatcher("resultPage.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");
        }

    }

    private int calculateScore(Map<Integer, List<Integer>> userAnswers, Map<Integer, Boolean> booleanAnswers, int quizId) throws SQLException {
        int score = 0;
        QuizDAO quizDAO = new QuizDAO();
        int QuestionPoints = 100 / quizDAO.getTotalQuestions(quizId);
        for (Map.Entry<Integer, List<Integer>> entry : userAnswers.entrySet()) {
            int questionId = entry.getKey();
            List<Integer> answers = entry.getValue();
            if (quizDAO.areAnswersCorrect(questionId, answers)) {
                score += QuestionPoints;
            }
        }

        for (Map.Entry<Integer, Boolean> entry : booleanAnswers.entrySet()) {
            int questionId = entry.getKey();
            boolean userAnswer = entry.getValue();
            // Convert boolean to String for comparison
            String userAnswerString = Boolean.toString(userAnswer);
            if (quizDAO.isBooleanAnswerCorrect(questionId, userAnswerString)) {
                score += QuestionPoints;
            }
        }

        return score;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
