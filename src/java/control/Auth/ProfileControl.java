package control.Auth;

import dao.DAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;
import model.Profile;

/**
 * Servlet implementation class ProfileControl
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(name = "ProfileControl", urlPatterns = {"/profile"})
public class ProfileControl extends HttpServlet {

    private DAO userDAO = new DAO();

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a != null) {
                int id = a.getId();
                Profile profile = userDAO.getUserProfile(id);
                request.setAttribute("user", profile);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("/SWP391/home"); // Adjusted to absolute path
            }
        } catch (Exception e) {
            Logger.getLogger(ProfileControl.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("/SWP391/errorPage.jsp"); // Adjusted to absolute path
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
        try {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a != null) {
                int id = a.getId();
                Profile profile = userDAO.getUserProfile(id);
                // Retrieve form data
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("eMail");
                Boolean gender = request.getParameter("gender").equals("male");

                String nation = request.getParameter("nation");
                Part imagePart = request.getPart("image");
                String fileName = imagePart.getSubmittedFileName();
                String img;

                if (fileName == null || fileName.trim().isEmpty()) {
                    img = profile.getAvatar();
                } else {
                    String savePath = getServletContext().getRealPath("/") + "images"; // Use real path for file saving
                    String filePath = savePath + File.separator + fileName;
                    File saveDir = new File(savePath);
                    if (!saveDir.exists()) {
                        saveDir.mkdir();
                    }
                    imagePart.write(filePath);
                    img = "images/" + fileName;
                }

                // Update profile in database
                Profile updatedProfile = new Profile(profile.getProfileId(), fullName, gender, email, nation, img);
                userDAO.updateUserProfile(updatedProfile);
                response.sendRedirect("/SWP391/profile"); // Adjusted to absolute path
            } else {
                response.sendRedirect("/SWP391/home"); // Adjusted to absolute path
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProfileControl.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/SWP391/errorPage.jsp"); // Adjusted to absolute path
        } catch (Exception e) {
            Logger.getLogger(ProfileControl.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("/SWP391/errorPage.jsp"); // Adjusted to absolute path
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Profile Control Servlet";
    }
}
