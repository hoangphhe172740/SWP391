/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author khanh
 */
@WebServlet(name = "AddToWishlistServlet", urlPatterns = {"/addToWishlist"})
public class AddToWishlistServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToWishlistServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToWishlistServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null && (a.getRoleID() == 3 || a.getRoleID() == 4)) {
            int id = a.getId();
            Cookie[] cookies = request.getCookies();
            Cookie wishlistCookie = null;
            boolean courseExists = false;

            // Find the wishlist cookie
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("wishlist")) {
                    wishlistCookie = cookie;
                    break;
                }
            }

            // Check if the courseId is already in the wishlist
            if (wishlistCookie != null) {
                String wishlistValue = wishlistCookie.getValue();
                String[] items = wishlistValue.split(":");
                for (String item : items) {
                    String[] parts = item.split("-");
                    if (parts.length == 2) {
                        try {
                            int existingCourseId = Integer.parseInt(parts[1]);
                            if (existingCourseId == courseId) {
                                courseExists = true;
                                break;
                            }
                        } catch (NumberFormatException e) {
                            System.err.println("Invalid number format in cookie: " + e.getMessage());
                        }
                    } else {
                        System.err.println("Unexpected item format: " + item);
                    }
                }
            }

            // If courseId does not exist, add it to the wishlist
            if (!courseExists) {
                if (wishlistCookie == null) {
                    wishlistCookie = new Cookie("wishlist", id + "-" + courseId);
                } else {
                    String wishlistValue = wishlistCookie.getValue();
                    wishlistValue += ":" + id + "-" + courseId;
                    wishlistCookie.setValue(wishlistValue);
                }

                wishlistCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                response.addCookie(wishlistCookie);
            }

            response.sendRedirect("wishlist");
        } else {
            response.sendRedirect("home");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            int id = a.getId();

            Cookie[] cookies = request.getCookies();
            Cookie wishlistCookie = null;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("wishlist")) {
                    wishlistCookie = cookie;
                    break;
                }
            }

            if (wishlistCookie != null) {
                String wishlistValue = wishlistCookie.getValue();

                String[] items = wishlistValue.split(":");
                StringBuilder newWishlist = new StringBuilder();
                for (String item : items) {
                    if (!item.equals(id + "-" + courseId)) {
                        if (newWishlist.length() > 0) {
                            newWishlist.append(":");
                        }
                        newWishlist.append(item);
                    }
                }
                wishlistCookie.setValue(newWishlist.toString());
                wishlistCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                response.addCookie(wishlistCookie);
            }

            response.sendRedirect("wishlist");
        } else {
            response.sendRedirect("home");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
