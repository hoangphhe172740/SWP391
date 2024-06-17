/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Course;

/**
 *
 * @author Admin
 */
@WebServlet(name="DetailServlet", urlPatterns={"/detail"})
public class DetailServlet extends HttpServlet {
   
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
        String id_raw = request.getParameter("Courseid");
        HttpSession session = request.getSession();
        String url = request.getRequestURI() + "?Courseid=" + id_raw;
        session.setAttribute("prevPage", url);
        Course c = null;
        DAO d = new DAO();
        int id = 0;
        try{
            id = Integer.parseInt(id_raw);
            c = d.getCourseById(id);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        System.out.println(c);
        List<Course> listcourse = d.getAllCourse();
        List<Category> listCate = d.getAllCaregories();
        Course pnew = d.getNewCourse();
        int cid = d.getCidById(id);
        List<Course> listProductByCide = d.getCourseByCid(cid);
        request.setAttribute("cCate", listProductByCide);
        request.setAttribute("tag", cid);
        request.setAttribute("pnew", pnew);
        request.setAttribute("listC", listCate);
        request.setAttribute("detail", c);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        return "Short description";
    }

}
