/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.mentors.quizzes;

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.AnswerChoice;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quiz;

/**
 *
 * @author khanh
 */
@WebServlet(name = "EditQuestionServlet", urlPatterns = {"/editQuestion"})
public class EditQuestionServlet extends HttpServlet {

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
            out.println("<title>Servlet EditQuestionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuestionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private QuizDAO dao = new QuizDAO();

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
        try {
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            Quiz quiz = dao.getQuizDetails(quizId);

            if (quiz != null) {
                request.setAttribute("quiz", quiz);
                request.getRequestDispatcher("EditQuestion.jsp").forward(request, response);
            } else {
                response.sendRedirect("errorPage.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(ViewQuizDetailControl.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("errorPage.jsp");
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        String questionText = request.getParameter("questionText");

        // Debugging output
        System.out.println("Received Question ID: " + questionId);
        System.out.println("Received Question Text: " + questionText);
        
        String[] answerTexts = request.getParameterValues("answerText");
        String[] isCorrects = request.getParameterValues("isCorrect");

        // Debugging output
        System.out.println("Received Answer Texts: " + Arrays.toString(answerTexts));
        System.out.println("Received Is Corrects: " + Arrays.toString(isCorrects));

        if (answerTexts == null || answerTexts.length == 0) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Answer texts cannot be null or empty");
            return;
        }

        List<AnswerChoice> answers = new ArrayList<>();
        for (int i = 0; i < answerTexts.length; i++) {
            AnswerChoice answer = new AnswerChoice();
            answer.setAnswerChoiceText(answerTexts[i]);
            answer.setCorrect(isCorrects != null && Arrays.asList(isCorrects).contains(answerTexts[i]));
            answers.add(answer);
        }

        try {
            dao.updateQuestion(questionId, questionText, answers);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
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
