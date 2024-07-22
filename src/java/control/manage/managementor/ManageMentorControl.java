package control.manage.managementor;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Account;
import model.Mentor;

/**
 * Servlet implementation class ManageMentorControl
 */
@WebServlet(name = "ManageMentorControl", urlPatterns = {"/manageMentor"})
public class ManageMentorControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account != null) {
            int id = account.getRoleID();
            DAO dao = new DAO();
            try {
                List<Mentor> mentorsCreatedByUser = dao.getMentorByCreatedby(id);
                List<Mentor> allMentors = dao.getAllMentor();
                request.setAttribute("listMentor", mentorsCreatedByUser);
                request.setAttribute("allMentors", allMentors);
                request.getRequestDispatcher("managerMentor.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error while processing mentors: " + e.getMessage());
                response.sendRedirect("/SWP391/errorPage.jsp");
            }
        } else {
            response.sendRedirect("home");
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
        return "Handles requests for managing mentors";
    }
}
