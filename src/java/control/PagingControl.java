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
import java.util.List;
import model.Course;

/**
 *
 * @author Admin
 */
@WebServlet(name="PagingControl", urlPatterns={"/paging"})
public class PagingControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String paging_raw = request.getParameter("paging");
        int paging;
        DAO d = new DAO();
        List<Course> list = null;
        if(paging_raw == null){
            paging = 1;
        }else{
            paging = Integer.parseInt(paging_raw);
        }
        list = d.getPaging(paging);
        System.out.println(list);
        request.setAttribute("Listc", list);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
