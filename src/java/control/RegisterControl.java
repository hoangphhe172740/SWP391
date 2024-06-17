/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.DAO;
import java.util.HashSet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterControl", urlPatterns = {"/Register"})
public class RegisterControl extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");
        String mess;
        
        DAO d = new DAO();
        if (!pass.equals(repass)) {
            mess = "Password and Confirm password not match";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (d.checkEmailExist(email)) {
            mess ="Email Exsit";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            d.SignUp(user, email, pass);
            response.sendRedirect("login");
        }
    }
}
