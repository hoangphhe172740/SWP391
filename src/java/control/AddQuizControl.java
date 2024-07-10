/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.LessonDAO;
import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Quiz;
import java.sql.Time;
import java.util.Timer;

/**
 *
 * @author Admin
 */
@WebServlet(name="AddQuizControl", urlPatterns={"/add-quiz"})
public class AddQuizControl extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String quizName = request.getParameter("quizname");
            String quizTimeStr = request.getParameter("quiztime"); // Assuming quiztime is a string         
            double passScore = Double.parseDouble(request.getParameter("score"));
            int moduleId = Integer.parseInt(request.getParameter("module"));
            QuizDAO dao = new QuizDAO();
            dao.addQuiz(moduleId, quizName, quizTimeStr, passScore);
            response.sendRedirect("mentor-manager");
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}