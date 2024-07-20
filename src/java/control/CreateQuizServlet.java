/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

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

/**
 *
 * @author khanh
 */
@WebServlet(name="CreateQuizServlet", urlPatterns={"/cequiz"})
public class CreateQuizServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateQuizServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateQuizServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        request.getRequestDispatcher("createQuiz.jsp").forward(request, response);
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
        Account a = (Account) session.getAttribute("acc");

        if (a != null && a.getRoleID() == 3) { // Ensure the user is a mentor
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

                int questionIndex = 0;
                while (questionIndex < questionTexts.length) {
                    int questionId = dao.insertQuestion(quizId, questionTexts[questionIndex], questionTypes[questionIndex]);

                    String[] choices = request.getParameterValues("answerChoice" + questionIndex);
                    String[] corrects = request.getParameterValues("isCorrect" + questionIndex);

                    for (int i = 0; i < choices.length; i++) {
                        boolean isCorrect = corrects[i] != null;
                        dao.insertAnswerChoice(questionId, choices[i], isCorrect);
                    }
                    questionIndex++;
                }
            }

            response.sendRedirect("lessonDetails?lessonId=" + lessonId);
        } else {
            response.sendRedirect("login");
        }
    }
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
