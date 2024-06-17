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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Category;
import model.Course;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

    public List<Course> sort(String opt, List<Course> list) {
        switch (opt) {
            case "sortByCreasePrice":
                Collections.sort(list, new Comparator<Course>() {
                    @Override
                    public int compare(Course o1, Course o2) {
                        if (o1.getPrice() > o2.getPrice()) {
                            return 1;
                        } else {
                            return -1;
                        }
                    }
                });
                break;
            case "sortByDecresePrice":
                Collections.sort(list, new Comparator<Course>() {
                    @Override
                    public int compare(Course o1, Course o2) {
                        return (int) (o2.getPrice() - o1.getPrice());
                    }
                });
                break;
            case "sortByName":
                Collections.sort(list, new Comparator<Course>() {
                    @Override
                    public int compare(Course o1, Course o2) {
                        return o1.getName().compareTo(o2.getName());
                    }
                });
                break;
            case "default":
                return list;
            default:
                return list;
        }
        return list;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
        int cid = 0;
        DAO d = new DAO();
        List<Course> courses = new ArrayList<>();
        if (cid_raw != null) {
            System.out.println(cid_raw);
            cid = Integer.parseInt(cid_raw);
            courses = d.getCourseByCid(cid);
        }
        List<Course> listcourse = d.getAllCourse();
        List<Category> listCate = d.getAllCaregories();
        boolean[] chid = new boolean[listCate.size() + 1];
        int[] cidd = null;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            courses = d.getCourseByCid(cid);
            if (cid == 0) {
                chid[0] = true;
            }
        }
        if (cidd_raw != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            courses = d.searchByCheck(cidd);
        }
        if (cid_raw == null) {
            chid[0] = true;
        }
        if ((cidd_raw != null) && (cidd[0] != 0)) {
            chid[0] = false;
            for (int i = 1; i < chid.length; i++) {
                if (isCheck(listCate.get(i - 1).getCid(), cidd)) {
                    chid[i] = true;
                } else {
                    chid[i] = false;
                }
            }
        }
        Course pnew = d.getNewCourse();
        int paging;
        String sort;
        sort = request.getParameter("sort") != null ? request.getParameter("sort") : "default";
        System.out.println(sort);
        String paging_raw = request.getParameter("page");
        
        if (paging_raw == null) {
            paging = 1;
        } else {
            paging = Integer.parseInt(paging_raw);
        }
        System.out.println(paging);
        
        List<Course> list = sort(sort, courses);
        List<Course> listPage = list.subList(9 * (paging - 1), (paging * 9) < list.size() ? paging * 9 : list.size());
        request.setAttribute("chid", chid);
        request.setAttribute("cidd", cidd);
        request.setAttribute("page", paging);
        request.setAttribute("listC", listCate);
        request.setAttribute("pnew", pnew);
        request.setAttribute("listc", listPage);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
        int cid = 0;
        List<Course> list = null;
        DAO d = new DAO();
        List<Course> courses = new ArrayList<>();
        List<Course> listcourse = d.getAllCourse();
        List<Category> listCate = d.getAllCaregories();
        if (cid_raw != null) {
            System.out.println(cid_raw);
            cid = Integer.parseInt(cid_raw);
            courses = d.getCourseByCid(cid);
        }
        boolean[] chid = new boolean[listCate.size() + 1];
        int[] cidd = null;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            courses = d.getCourseByCid(cid);
            if (cid == 0) {
                chid[0] = true;
            }
        }
        if (cidd_raw != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            courses = d.searchByCheck(cidd);
        }
        if (cid_raw == null) {
            chid[0] = true;
        }
        if ((cidd_raw != null) && (cidd[0] != 0)) {
            chid[0] = false;
            for (int i = 1; i < chid.length; i++) {
                if (isCheck(listCate.get(i - 1).getCid(), cidd)) {
                    chid[i] = true;
                } else {
                    chid[i] = false;
                }
            }
        }
        Course pnew = d.getNewCourse();
        request.setAttribute("cid", cid);
        request.setAttribute("pnew", pnew);
        request.setAttribute("chid", chid);
        request.setAttribute("listc", courses);
        request.setAttribute("listC", listCate);
        request.setAttribute("listc", list);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
