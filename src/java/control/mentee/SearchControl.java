package control.mentee;

import dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Category;
import model.Course;

@WebServlet(name = "SearchControl", urlPatterns = {"/search"})
public class SearchControl extends HttpServlet {

    private boolean isCategorySelected(int categoryId, int[] selectedCategoryIds) {
        if (selectedCategoryIds == null) {
            return false;
        }
        for (int id : selectedCategoryIds) {
            if (id == categoryId) {
                return true;
            }
        }
        return false;
    }

    private List<Course> sortCourses(String sortOption, List<Course> courses) {
        switch (sortOption) {
            case "sortByName":
                courses.sort(Comparator.comparing(Course::getName));
                break;
            case "default":
            default:
                break;
        }
        return courses;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAO dao = new DAO();
        String categoryRaw = request.getParameter("cid");
        String[] selectedCategoryIdsRaw = request.getParameterValues("cidd");
        int categoryId = 0;
        List<Course> courses = new ArrayList<>();
        List<Course> allCourses = dao.getAllCourse();
        List<Category> categories = dao.getAllCaregories();

        if (categoryRaw != null) {
            categoryId = Integer.parseInt(categoryRaw);
            courses = dao.getCourseByCid(categoryId);
        }

        boolean[] categoryChecked = new boolean[categories.size() + 1];
        int[] selectedCategoryIds = null;

        if (selectedCategoryIdsRaw != null) {
            selectedCategoryIds = new int[selectedCategoryIdsRaw.length];
            for (int i = 0; i < selectedCategoryIds.length; i++) {
                selectedCategoryIds[i] = Integer.parseInt(selectedCategoryIdsRaw[i]);
            }
            courses = dao.searchByCheck(selectedCategoryIds);
        }

        if (categoryRaw == null) {
            categoryChecked[0] = true;
        }

        if (selectedCategoryIdsRaw != null) {
            for (int i = 1; i < categoryChecked.length; i++) {
                categoryChecked[i] = isCategorySelected(categories.get(i - 1).getCid(), selectedCategoryIds);
            }
        }

        int currentPage = 1;
        String sortOption = request.getParameter("sort") != null ? request.getParameter("sort") : "default";
        Course newCourse = dao.getNewCourse();

        String pageRaw = request.getParameter("page");
        if (pageRaw != null) {
            try {
                currentPage = Integer.parseInt(pageRaw);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                currentPage = 1; // Default to page 1 on error
            }
        }

        List<Course> sortedCourses = sortCourses(sortOption, courses.isEmpty() ? allCourses : courses);
        List<Course> paginatedCourses;

        try {
            int start = 9 * (currentPage - 1);
            int end = Math.min(start + 9, sortedCourses.size());
            paginatedCourses = sortedCourses.subList(start, end);
        } catch (Exception e) {
            e.printStackTrace();
            paginatedCourses = new ArrayList<>();
        }

        request.setAttribute("categoryChecked", categoryChecked);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("newCourse", newCourse);
        request.setAttribute("courses", paginatedCourses.isEmpty() ? null : paginatedCourses);
        request.setAttribute("categories", categories);
        request.setAttribute("sortOption", sortOption);

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
}
