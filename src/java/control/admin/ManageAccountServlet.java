package control.admin;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.dto.AccountProfileDto;

/**
 * Servlet implementation class ManageAccountServlet
 */
@WebServlet(name = "ManageAccountServlet", urlPatterns = {"/admin/manageaccount"})
public class ManageAccountServlet extends HttpServlet {

    private DAO dao = new DAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int roleID = Integer.parseInt(request.getParameter("roleID"));

            // Retrieve the list of accounts by role ID
            List<AccountProfileDto> accountProfiles = dao.getAccountByRoleIdToMange(roleID);

            // Set attributes for the JSP page
            request.setAttribute("accountProfiles", accountProfiles);
            request.setAttribute("roleID", roleID);

            // Forward request to the JSP page for rendering
            request.getRequestDispatcher("AccountManage.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid roleID format
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int uID = Integer.parseInt(request.getParameter("uID"));
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            boolean isActive = Boolean.parseBoolean(request.getParameter("status"));

            // Update the status of the account
            dao.updateAccountStatus(uID, isActive);

            // Redirect back to the account management page
            response.sendRedirect("/SWP391/admin/manageaccount?roleID=" + roleID);
        } catch (NumberFormatException e) {
            // Handle invalid input format
            response.sendRedirect("/SWP391/errorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for managing accounts based on role ID";
    }
}
