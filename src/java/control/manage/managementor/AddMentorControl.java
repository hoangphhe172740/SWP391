package control.manage.managementor;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 * Servlet implementation class AddMentorControl
 */
@WebServlet(name = "AddMentorControl", urlPatterns = {"/addmentor"})
public class AddMentorControl extends HttpServlet {

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
        String image = request.getParameter("image");
        String email = request.getParameter("email");
        String message;

        DAO dao = new DAO();
        try {
            if (dao.checkEmailMentorExist(email) || dao.checkNameMentorExist(name.toLowerCase())) {
                message = "Email or Name already exists";
                request.setAttribute("message", message);
                request.getRequestDispatcher("manageMentor").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                Account account = (Account) session.getAttribute("acc");
                if (account != null) {
                    dao.InsertMentor(name, email, image, 2);
                    response.sendRedirect("manageMentor");
                } else {
                    response.sendRedirect("Login");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding new mentors";
    }
}
