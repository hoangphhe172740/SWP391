package control.manage.managementor;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class EditMentorControl
 */
@WebServlet(name="EditMentorControl", urlPatterns={"/edit-mentor"})
public class EditMentorControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String mentorid = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String email = request.getParameter("email");
        DAO d = new DAO();

        try {
            d.EditMentor(name, email, image, mentorid);
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("/SWP391/errorPage.jsp");
            return; // Ensure no further code execution after redirect
        }
        
        response.sendRedirect("manageMentor");
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for editing mentor information";
    }
}
