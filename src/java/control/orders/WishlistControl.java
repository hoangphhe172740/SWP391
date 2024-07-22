package control.orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Course;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "WishlistServlet", urlPatterns = {"/wishlist"})
public class WishlistControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(WishlistControl.class.getName());
    private dao.DAO dao = new dao.DAO();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null) {
                int userId = account.getId();
                Cookie[] cookies = request.getCookies();
                List<Course> wishlist = new ArrayList<>();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("wishlist".equals(cookie.getName())) {
                            String[] items = cookie.getValue().split(":");
                            for (String item : items) {
                                String[] parts = item.split("-");
                                if (parts.length == 2) {
                                    try {
                                        int cookieUserId = Integer.parseInt(parts[0]);
                                        int courseId = Integer.parseInt(parts[1]);
                                        if (cookieUserId == userId) {
                                            Course course = dao.getCourseWishListById(courseId);
                                            if (course != null) {
                                                wishlist.add(course);
                                            }
                                        }
                                    } catch (NumberFormatException e) {
                                        LOGGER.log(Level.WARNING, "Invalid number format in cookie: " + item, e);
                                    }
                                } else {
                                    LOGGER.log(Level.WARNING, "Unexpected item format in cookie: " + item);
                                }
                            }
                            break;
                        }
                    }
                }

                request.setAttribute("wishlist", wishlist);
                request.getRequestDispatcher("wishlist.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing wishlist.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles displaying the user's wishlist.";
    }
}
