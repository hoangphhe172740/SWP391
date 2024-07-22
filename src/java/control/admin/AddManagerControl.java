package control.admin;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;

/**
 * Servlet implementation class AddManagerControl
 */
@WebServlet(name = "AddManagerControl", urlPatterns = {"/admin/addmanager"})
public class AddManagerControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the JSP page to add a manager
        request.getRequestDispatcher("addAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("pass");

        DAO dao = new DAO();
        Account existingAccount = dao.checkAccount(email, name);

        if (existingAccount == null) {
            // Create new manager account with role ID 2
            dao.AddAccount(name, pass, email, 2);
            request.setAttribute("message", "Add Manager Success!");
        } else {
            request.setAttribute("error", "Manager already exists!");
        }

        // Forward to the JSP page with a status message
        request.getRequestDispatcher("addAccount.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle adding a new manager";
    }
}
