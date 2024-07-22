package control.manage.courses;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class AddCourseServlet
 */
@WebServlet(name = "AddCourseServlet", urlPatterns = {"/add"})
public class AddCourseServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddCourseServlet.class.getName());

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
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String pcategory = request.getParameter("category");
        String mentorId = request.getParameter("mentor");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");

        if (a != null) {
            try {
                DAO dao = new DAO();
                dao.InsertCourse(name, description, image, title, 2, pcategory, mentorId);
                response.sendRedirect("manager");
            } catch (Exception e) {
                LOGGER.log(Level.SEVERE, "Error adding course: ", e);
                response.sendRedirect("/SWP391/errorPage.jsp");
            }
        } else {
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding new courses";
    }
}
