package control.Auth;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/Login"})
public class LoginControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String rem = request.getParameter("remember");

            Cookie ce = new Cookie("cemail", email);
            Cookie cp = new Cookie("cpass", pass);
            Cookie cr = new Cookie("crem", rem);
            if (rem != null) {
                ce.setMaxAge(7 * 60 * 60 * 24);
                cp.setMaxAge(7 * 60 * 60 * 24);
                cr.setMaxAge(7 * 60 * 60 * 24);
            } else {
                ce.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(ce);
            response.addCookie(cp);
            response.addCookie(cr);

            DAO dao = new DAO();
            Account a = dao.checkLogin(email, pass);
            if (a == null) {
                request.setAttribute("mess", "Wrong email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (a.getRoleID() == 1 || a.getRoleID() == 2) {
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                response.sendRedirect("admin/dashboard");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }
}
