/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Profile;

/**
 *
 * @author Admin
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
            /* TODO output your page here. You may use following sample code. */
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            int id = a.getId();
            Profile profile = userDAO.getUserProfile(id);
            request.setAttribute("user", profile);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            int id = a.getId();
            Profile profile = userDAO.getUserProfile(id);
            // Retrieve form data
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("eMail");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String nation = request.getParameter("nation");
            Part imagePart = request.getPart("image");
            // Lấy tên của file ảnh
            String fileName = imagePart.getSubmittedFileName();
            // Lấy đối tượng Part theo tên của input kiểu file
            String img;
            if (fileName.trim() == null || fileName.trim().length() == 0) {
                img = profile.getAvatar();
            } else {
                String savePath = "E:\\dao load\\SWP391-master\\SWP391-master\\web\\images"; // Giả sử có một thư mục images trên server
                String filePath = savePath + File.separator + fileName;
                // Kiểm tra xem thư mục images có tồn tại hay không và tạo nếu cần
                File saveDir = new File(savePath);
                if (!saveDir.exists()) {
                    saveDir.mkdir();
                }
                // Lưu file ảnh vào thư mục images trên server
                imagePart.write(filePath);
                img = "images/" + fileName;
            }

            // Update profile in database
            Profile updatedProfile = new Profile(profile.getProfileId(), fullName, gender, email, nation, img);
            try {
                userDAO.updateUserProfile(updatedProfile);
                response.sendRedirect("profile"); // Chuyển hướng sau khi cập nhật thành công
            } catch (SQLException ex) {
                Logger.getLogger(ProfileControl.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            response.sendRedirect("home"); // Redirect to home if session is invalid
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
