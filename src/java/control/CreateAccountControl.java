/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Mentor;
/**
 *
 * @author Admin
 */
@WebServlet(name="CreateAccountControl", urlPatterns={"/create-account"})
public class CreateAccountControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String mentorid = request.getParameter("id");        
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        DAO d = new DAO();
        Account a = d.checkAccount(email, name);
        if(a == null){
            d.AddAccount(name, pass, email, 3);
            response.sendRedirect("manageMentor");
        }else{
            request.getRequestDispatcher("manageMentor.jsp").forward(request, response);
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
