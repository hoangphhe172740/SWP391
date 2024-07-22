package control.manage;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Mentor;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class LoadAccountControl
 */
@WebServlet(name = "LoadAccountControl", urlPatterns = {"/load-account"})
public class LoadAccountControl extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LoadAccountControl.class.getName());

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

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String mentorRaw = request.getParameter("MentorID");

        try {
            int mentorId = Integer.parseInt(mentorRaw);
            DAO dao = new DAO();
            Mentor mentor = dao.getMentorByID(mentorId);

            if (mentor != null) {
                request.setAttribute("listM", mentor);
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
            } else {
                response.sendRedirect("/SWP391/errorPage.jsp");
            }

        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid mentor ID format: " + mentorRaw, e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error loading mentor information.", e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for loading mentor account details";
    }
}
