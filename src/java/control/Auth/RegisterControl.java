package control.Auth;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;

/**
 * Servlet implementation class RegisterControl
 */
@WebServlet(name = "RegisterControl", urlPatterns = {"/Register"})
public class RegisterControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");
        String message;

        DAO dao = new DAO();

        if (!pass.equals(repass)) {
            message = "Password and confirm password do not match";
            request.setAttribute("mess", message);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (dao.checkEmailExist(email)) {
            message = "Email already exists";
            request.setAttribute("mess", message);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            Account newAccount = new Account(email, pass, user, 4);
            dao.SignUp(newAccount);
            response.sendRedirect("Login"); // Redirect to login page after successful registration
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for handling user registration";
    }
}
