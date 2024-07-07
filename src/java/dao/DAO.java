/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Course;
import model.Mentor;

public class DAO extends DBContext {

    public Account checkLogin(String email, String pass) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[email]\n"
                + "      ,[roleID]\n"
                + "  FROM [projectSWP].[dbo].[Account]"
                + " where [email] = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void getNewPass(String email, String pass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [pass] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Category> getAllCaregories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [cid]\n"
                + "      ,[cname]\n"
                + "  FROM [projectSWP].[dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> getCourseByCid(int cid) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[created_by]\n"
                + "      ,[category_id]\n"
                + "  FROM [projectSWP].[dbo].[Course]"
                + "where 1=1 ";
        if (cid != 0) {
            sql += " and category_id = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> searchByCheck(int[] cid) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[created_by]\n"
                + "      ,[category_id]\n"
                + "  FROM [projectSWP].[dbo].[Course]"
                + "where 1=1 ";
        if (cid != null && cid[0] != 0) {
            sql += " and category_id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> getListCourseSearch(String txtSearch) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[category_id]\n"
                + "  FROM [projectSWP].[dbo].[Course] where [name] like ? or [title] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public int getNumberPage() {
        String sql = "SELECT COUNT(*)\n"
                + "  FROM [projectSWP].[dbo].[Course]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Course getNewCourse() {
        String sql = "Select top 1 * from Course\n"
                + "order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Course> getPaging(int index) {
        String sql = "SELECT * FROM [dbo].[Course]\n"
                + "order by id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 6 ROWS ONLY";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int getCidById(int id) {
        int cid = 0;
        String sql = "select category_id from course where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cid = rs.getInt("category_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return cid;
    }

    public List<Course> getNewManyCourse() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT TOP (4) [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[created_by]\n"
                + "      ,[category_id]\n"
                + "  FROM [projectSWP].[dbo].[Course]\n"
                + "  order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void InsertCourse(String name, String description, String price, String image, String title, int createRole, String category) {
        String sql = "INSERT [dbo].[Course] "
                + "([name], [description], [price],"
                + " [image], [title], [created_by], [category_id]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, price);
            st.setString(4, image);
            st.setString(5, title);
            st.setInt(6, createRole);
            st.setString(7, category);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void InsertMentor(String name, String email, String image, int createRole) {
        String sql = "INSERT INTO [dbo].[Mentor]\n"
                + "           ([Mentor_name]\n"
                + "           ,[email]\n"
                + "           ,[image]\n"
                + "           ,[create_by])"
                + "VALUES (?,?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, image);
            st.setInt(4, createRole);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void SignUp(Account account) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([user]\n"
                    + "           ,[pass]\n"
                    + "           ,[email]\n"
                    + "           ,[roleID])\n"
                    + "           VALUES (?,?,?,?)"; // Sửa ở đây
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUser());
            st.setString(2, account.getPass());
            st.setString(3, account.getEmail());
            st.setInt(4, account.getRoleID());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteCourseById(int id) {
        try {
            String sql = "delete from course where id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteMentorById(int id) {
        try {
            String sql = "delete from [Mentor] where Mentor_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void EditCourse(String name, String description, String price, String image, String title, String category, String courseid) {
        String sql = "UPDATE [dbo].[Course]\n"
                + "   SET [name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[category_id] = ?\n"
                + " WHERE id = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, price);
            st.setString(4, image);
            st.setString(5, title);
            st.setString(6, category);
            st.setString(7, courseid);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getCategoryId(int id) {
        String sql = "SELECT \n"
                + "   [category_id]\n"
                + "  FROM [projectSWP].[dbo].[Course] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("category_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }

    public List<Mentor> getAllMentor() {
        List<Mentor> list = new ArrayList<>();
        String sql = "SELECT * from Mentor";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Mentor> getMentorByCreatedby(int roleID) {
        List<Mentor> list = new ArrayList<>();
        String sql = "SELECT [Mentor_id]\n"
                + "         ,[Mentor_name]\n"
                + "         ,[email]\n"
                + "         ,[image]\n"
                + "FROM [projectSWP].[dbo].[Mentor]"
                + "where create_by = ?"
                + " order by Mentor_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Course> getAllCourse() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * from Course";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[email]\n"
                + "      ,[roleID]\n"
                + "  FROM [projectSWP].[dbo].[Account]"
                + " where [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkEmailMentorExist(String email) {
        String sql = "SELECT [Mentor_id]\n"
                + "      ,[Mentor_name]\n"
                + "      ,[email]\n"
                + "      ,[image]\n"
                + "      ,[create_by]\n"
                + "  FROM [projectSWP].[dbo].[Mentor]"
                + " where [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean checkNameMentorExist(String name) {
        String sql = "SELECT [Mentor_id]\n"
                + "      ,[Mentor_name]\n"
                + "      ,[email]\n"
                + "      ,[image]\n"
                + "      ,[create_by]\n"
                + "  FROM [projectSWP].[dbo].[Mentor]"
                + " where [Mentor_name] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void AddAccount(String user, String pass, String email, int roleID) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([user]\n"
                + "           ,[pass]\n"
                + "           ,[email]\n"
                + "           ,[roleID])"
                + " VALUES(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, email);
            st.setInt(4, roleID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Course> getCourseByCreatedby(int roleID) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[title]\n"
                + "      ,[category_id]\n"
                + "FROM [projectSWP].[dbo].[Course]"
                + "where created_by = ?"
                + " order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Course getCourseById(int id) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from course where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(8));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Mentor getMentorByID(int mentorid) {
        List<Mentor> list = new ArrayList<>();
        String sql = "select * from mentor where Mentor_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mentorid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Mentor(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void EditMentor(String name, String email, String image, String mentorId) {
        String sql = "UPDATE [dbo].[Mentor]\n"
                + "     SET [Mentor_name] = ?\n"
                + "         ,[email] = ?\n"
                + "         ,[image] = ?\n"
                + "WHERE Mentor_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, image);
            st.setString(4, mentorId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account checkAccount(String email, String user) {
        String sql = "SELECT * FROM Account\n"
                + "where [email] = ? and user = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account u = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Course> getTopCoursesByCategory() {
        String sql = "SELECT id, name, description, price, image, title, category_id " +
                     "FROM (" +
                     "    SELECT id, name, description, price, image, title, category_id, " +
                     "           ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id) AS row_num " +
                     "    FROM Course" +
                     ") AS numbered_courses " +
                     "WHERE row_num <= 2"; // Thay đổi điều kiện row_num nếu cần thiết

        List<Course> courses = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                String image = rs.getString("image");
                String title = rs.getString("title");                
                int categoryId = rs.getInt("category_id");

                Course course = new Course(id, name, description, price, image, title, categoryId);
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return courses;
    }
    
    public List<Account> getAccountByRoleId(int roleID) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [uID], [user], [pass], [email], [roleID] "
                + "FROM [dbo].[Account] "
                + "WHERE roleID = ? ";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, roleID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    list.add(new Account(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5)));
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception while fetching accounts: " + e.getMessage());
        }
        return list;
    }
    public List<Account> getAccountById(int id) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [uID], [user], [pass], [email], [roleID] "
                + "FROM [dbo].[Account] "
                + "WHERE uID = ? ";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    list.add(new Account(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5)));
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception while fetching accounts: " + e.getMessage());
        }
        return list;
    }
    public static void main(String[] args) {
        DAO d = new DAO();
        System.out.println(d.getCourseById(9));
    }
}
