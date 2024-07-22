package control.admin;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class DashboardControl
 */
@WebServlet(name = "DashboardControl", urlPatterns = {"/admin/dashboard"})
public class DashboardControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();

        // Retrieve participation data for mentors and mentees
        Map<String, Integer> mentorData = dao.getCourseParticipationByDay(3);
        Map<String, Integer> menteeData = dao.getCourseParticipationByDay(4);

        // Set attributes to be used in the JSP page
        request.setAttribute("mentorData", mentorData);
        request.setAttribute("menteeData", menteeData);

        // Forward to the dashboard JSP page
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests by delegating to doGet
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle admin dashboard functionalities";
    }
}
