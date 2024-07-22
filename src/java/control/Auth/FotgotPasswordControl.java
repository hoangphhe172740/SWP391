package control.Auth;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Email;
import util.generateOTP;

/**
 * Servlet implementation class FotgotPasswordControl
 */
@WebServlet(name = "FotgotPasswordControl", urlPatterns = {"/FotgotPassword"})
public class FotgotPasswordControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FotgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FotgotPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            DAO d = new DAO();
            if (d.checkEmailExist(email)) {
                generateOTP generate = new generateOTP();
                String otp = generate.generateOTP(6);
                Cookie cookieOtp = new Cookie("otp", otp);
                Cookie cookieEmail = new Cookie("cEmail", email);
                cookieOtp.setMaxAge(60 * 5);
                cookieEmail.setMaxAge(60 * 60);
                Email sendEmail = new Email();
                sendEmail.sendEmail(email, otp);
                response.addCookie(cookieOtp);
                response.addCookie(cookieEmail);
                response.sendRedirect("otpPassword");
            } else {
                request.setAttribute("error", "Email not exist");
                request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
