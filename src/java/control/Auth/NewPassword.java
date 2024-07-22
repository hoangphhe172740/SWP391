package control.Auth;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet(name = "NewPassword", urlPatterns = {"/NewPassword"})
public class NewPassword extends HttpServlet {

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
        try {
            request.getRequestDispatcher("newpassword.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String pass = request.getParameter("password");
            String repass = request.getParameter("repass");
            String mess;
            String email = "";
            DAO d = new DAO();
            if (!pass.equals(repass)) {
                mess = "Password and Confirm password do not match";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("newpassword.jsp").forward(request, response);
                return; // Important to return to avoid further processing
            }

            Cookie[] cookies = request.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("cEmail")) {
                    email = c.getValue();
                    break;
                }
            }
            d.getNewPass(email, pass);
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }
}
