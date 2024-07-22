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
import jakarta.servlet.http.HttpSession;
import model.Account;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;

/**
 *
 * @author khanh
 */
@WebServlet(name = "AddQuestionControl", urlPatterns = {"/addquestion"})
public class AddQuestionControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddQuestionControl.class.getName());

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
            out.println("<title>Servlet AddQuestionControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuestionControl at " + request.getContextPath() + "</h1>");
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
        try {
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            request.setAttribute("lessonId", lessonId);
            request.setAttribute("quizId", quizId);
            request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid lesson ID format.", e);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account != null && account.getRoleID() == 3) { // Ensure the user is a mentor
            try {
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                int lessonId = Integer.parseInt(request.getParameter("lessonId"));
                request.setAttribute("lessonId", lessonId);
                int questionCount = Integer.parseInt(request.getParameter("questionCount"));

                QuizDAO dao = new QuizDAO();

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
                response.sendRedirect("addquestion?quizId=" + quizId + "lessonId" + lessonId);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid number format in question addition.", e);
                response.sendRedirect("errorPage.jsp");
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error processing question addition.", e);
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            response.sendRedirect("Login");
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
