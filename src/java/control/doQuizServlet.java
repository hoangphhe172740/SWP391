/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Question;

/**
 *
 * @author admin
 */
public class doQuizServlet extends HttpServlet {

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
//            String id = request.getParameter("id");
//            QuizDAO quizDAO = new QuizDAO();
//            List<Question> list = quizDAO.getQuestionsByQuizID(Integer.parseInt(id));
//            request.setAttribute("list", list);
//            request.setAttribute("id", id);
//            request.getRequestDispatcher("doQuiz.jsp").forward(request, response);
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
//        String url = "";
//        try {
//            int correct = 0;
//            String[] questionIds = request.getParameterValues("questionId");
//            HttpSession session = request.getSession();
//            Account account = (Account) session.getAttribute("acc");
//            QuizDAO quizDAO = new QuizDAO();
//            if (account == null) {
//                url = "login.jsp";
//            } else {
//                float pointForEachQuestion = (float) 10 / questionIds.length;
//                for (String questionId : questionIds) {
//                    if (request.getParameter("answer_" + questionId) == null) {
//                    } else {
//                        int userAns = Integer.parseInt(request.getParameter("answer_" + questionId) );
//                        List<QuestionChoice> list = quizDAO.getQuestionChoiceByQuestionID(Integer.parseInt(questionId));
//                        long count = list.stream().filter((t) -> !t.isInCorrect() && t.getId() == userAns).count();
//                        if(count > 0){
//                            correct++;
//                        }
//                    }
//                }
//                float point = pointForEachQuestion * correct;
//                request.setAttribute("SCORE", point);
//                url = "scorePage.jsp";
//            }
//
//        } catch (NumberFormatException e) {
//        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
//        }
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
        processRequest(request, response);
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
