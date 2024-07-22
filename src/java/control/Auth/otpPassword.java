package control.Auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class otpPassword
 */
@WebServlet(name = "otpPassword", urlPatterns = {"/otpPassword"})
public class otpPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("opt-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String otpInput = request.getParameter("otp");
        String otp = getOtpFromCookies(request.getCookies());

        if (otp != null && otp.equals(otpInput)) {
            response.sendRedirect("NewPassword");
        } else {
            request.setAttribute("error", "OTP not correct");
            request.getRequestDispatcher("opt-password.jsp").forward(request, response);
        }
    }

    private String getOtpFromCookies(Cookie[] cookies) {
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("otp".equals(c.getName())) {
                    return c.getValue();
                }
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Servlet for OTP password verification";
    }
}
