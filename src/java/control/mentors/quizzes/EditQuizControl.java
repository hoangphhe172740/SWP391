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
import java.util.logging.Logger;
import model.Quiz;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khanh
 */
@WebServlet(name = "EditQuizControl", urlPatterns = {"/editquiz"})
public class EditQuizControl extends HttpServlet {
    
    private static final Logger LOGGER = Logger.getLogger(AddQuizControl.class.getName());

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
            out.println("<title>Servlet EditQuizControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuizControl at " + request.getContextPath() + "</h1>");
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
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        QuizDAO dao = new QuizDAO();
        Quiz quiz = dao.getQuizById(quizId);
        request.setAttribute("quiz", quiz);
        request.getRequestDispatcher("editquiz.jsp").forward(request, response);
        
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
        try {
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            String quizName = request.getParameter("quizName");
            String quizDescription = request.getParameter("quizDescription");
            int quizTime = Integer.parseInt(request.getParameter("quizTime"));
            int passScore = Integer.parseInt(request.getParameter("passScore"));
            boolean isActive = request.getParameter("isActive").equals("true");
            
            QuizDAO dao = new QuizDAO();
            dao.updateQuiz(quizId, quizName, quizDescription, quizTime, passScore, isActive);
            
            response.sendRedirect("editquiz?quizId=" + quizId); // Redirect to the list of quizzes after updating
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating quiz", e);
            response.sendRedirect("errorPage.jsp");
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
