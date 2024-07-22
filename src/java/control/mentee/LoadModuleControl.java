package control.mentee;

import dao.LessonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Lesson;

/**
 * Servlet implementation class LoadModuleControl
 */
@WebServlet(name = "LoadModuleControl", urlPatterns = {"/load-module"})
public class LoadModuleControl extends HttpServlet {

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
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String moduleIdRaw = request.getParameter("moduleId");
        
        if (moduleIdRaw != null) {
            try {
                int moduleId = Integer.parseInt(moduleIdRaw);
                LessonDAO dao = new LessonDAO();
                List<Lesson> lessons = dao.getLessonByModuleid(moduleId);
                request.setAttribute("Listlesson", lessons);
                request.getRequestDispatcher("listLesson.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.err.println("Invalid module ID format: " + e.getMessage());
                response.sendRedirect("errorPage.jsp?message=Invalid module ID format");
            } catch (Exception e) {
                System.err.println("Error retrieving lessons: " + e.getMessage());
                response.sendRedirect("errorPage.jsp?message=Error retrieving lessons");
            }
        } else {
            response.sendRedirect("errorPage.jsp?message=Module ID is missing");
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet that handles loading lessons by module ID";
    }
}
