package control.orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddToWishlistServlet", urlPatterns = {"/addToWishlist"})
public class AddToWishlistControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddToWishlistControl.class.getName());

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
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null && (account.getRoleID() == 3 || account.getRoleID() == 4)) {
                int userId = account.getId();
                Cookie[] cookies = request.getCookies();
                Cookie wishlistCookie = findCookie(cookies, "wishlist");

                if (wishlistCookie == null) {
                    wishlistCookie = new Cookie("wishlist", userId + "-" + courseId);
                } else {
                    if (!isCourseInWishlist(wishlistCookie.getValue(), courseId, userId)) {
                        String newValue = wishlistCookie.getValue() + ":" + userId + "-" + courseId;
                        wishlistCookie.setValue(newValue);
                    }
                }

                wishlistCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                response.addCookie(wishlistCookie);

                response.sendRedirect("wishlist");
            } else {
                response.sendRedirect("home");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format.", e);
            response.sendRedirect("errorPage.jsp");
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
        try {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null) {
                int userId = account.getId();
                Cookie[] cookies = request.getCookies();
                Cookie wishlistCookie = findCookie(cookies, "wishlist");

                if (wishlistCookie != null) {
                    String updatedValue = removeCourseFromWishlist(wishlistCookie.getValue(), courseId, userId);
                    wishlistCookie.setValue(updatedValue);
                    wishlistCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                    response.addCookie(wishlistCookie);
                }

                response.sendRedirect("wishlist");
            } else {
                response.sendRedirect("home");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid course ID format.", e);
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing wishlist update.", e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    private Cookie findCookie(Cookie[] cookies, String name) {
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }

    private boolean isCourseInWishlist(String wishlistValue, int courseId, int userId) {
        String[] items = wishlistValue.split(":");
        for (String item : items) {
            String[] parts = item.split("-");
            if (parts.length == 2) {
                try {
                    int existingCourseId = Integer.parseInt(parts[1]);
                    if (existingCourseId == courseId) {
                        return true;
                    }
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.WARNING, "Invalid number format in cookie item: " + item, e);
                }
            } else {
                LOGGER.log(Level.WARNING, "Unexpected item format in cookie: " + item);
            }
        }
        return false;
    }

    private String removeCourseFromWishlist(String wishlistValue, int courseId, int userId) {
        String[] items = wishlistValue.split(":");
        StringBuilder newWishlist = new StringBuilder();
        for (String item : items) {
            if (!item.equals(userId + "-" + courseId)) {
                if (newWishlist.length() > 0) {
                    newWishlist.append(":");
                }
                newWishlist.append(item);
            }
        }
        return newWishlist.toString();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles adding and removing items from the user's wishlist.";
    }
}
