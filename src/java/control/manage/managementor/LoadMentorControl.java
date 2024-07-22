package control.manage.managementor;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Mentor;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class LoadMentorControl
 */
@WebServlet(name = "LoadMentor", urlPatterns = {"/load-mentor"})
public class LoadMentorControl extends HttpServlet {

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
        String mentor_raw = request.getParameter("mentorID");
        int mentorId;
        DAO d = new DAO();
        try {
            mentorId = Integer.parseInt(mentor_raw);
            Mentor m = d.getMentorByID(mentorId);
            List<Mentor> list = d.getAllMentor(); // Optional, if you need a list of all mentors
            request.setAttribute("listM", m);
            request.getRequestDispatcher("editMentor.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println("Number format exception: " + e.getMessage());
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
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
        return "Loads and displays mentor details for editing";
    }
}
