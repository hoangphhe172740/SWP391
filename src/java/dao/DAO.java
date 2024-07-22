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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Category;
import model.Comment;
import model.Course;
import model.Lesson;
import model.Mentor;
import model.Modules;
import model.Profile;
import model.dto.AccountProfileDto;

public class DAO extends DBContext {

    public Account checkLogin(String email, String pass) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[email]\n"
                + "      ,[roleID]\n"
                + "  FROM [projectSWP].[dbo].[Account]"
                + " where [email] = ? and pass = ? AND isActive = 1";
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

    public Account getUserByID(int id) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[email]\n"
                + "      ,[roleID]\n"
                + "  FROM [projectSWP].[dbo].[Account]"
                + " where [uID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
        String sql = "SELECT [id], [name], [description], [image], [title], [created_by], [category_id], [mentor_id] "
                + "FROM [projectSWP].[dbo].[Course] WHERE 1=1 ";
        if (cid != 0) {
            sql += " AND category_id = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> searchByCheck(int[] cid) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [created_by], [category_id], [mentor_id] "
                + "FROM [projectSWP].[dbo].[Course] WHERE 1=1 ";
        if (cid != null && cid.length > 0) {
            sql += " AND category_id IN (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i];
                if (i < cid.length - 1) {
                    sql += ",";
                }
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> getListCourseSearch(String txtSearch) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] "
                + "FROM [projectSWP].[dbo].[Course] WHERE [name] LIKE ? OR [title] LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
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
        String sql = "SELECT TOP 1 [id], [name], [description], [image], [title], [category_id], [mentor_id] "
                + "FROM [Course] ORDER BY id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Course> getPaging(int index) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] "
                + "FROM [dbo].[Course] ORDER BY id OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
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
        String sql = "SELECT TOP (6) [id], [name], [description], [image], [title], [created_by], [category_id], [mentor_id] "
                + "FROM [projectSWP].[dbo].[Course] ORDER BY id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void InsertCourse(String name, String description, String image, String title, int createRole, String categoryId, String mentorId) {
        String sql = "INSERT INTO [dbo].[Course] ([name], [description], [image], [title], [created_by], [category_id], [mentor_id]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, image);
            st.setString(4, title);
            st.setInt(5, createRole);
            st.setString(6, categoryId);
            st.setString(7, mentorId);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void EditCourse(String name, String description, String image, String title, String category, String courseid, String mentorId) {
        String sql = "UPDATE [dbo].[Course] "
                + "SET [name] = ?, [description] = ?, [image] = ?, [title] = ?, [category_id] = ?, [mentor_id] = ? "
                + "WHERE [id] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, image);
            st.setString(4, title);
            st.setString(5, category);
            st.setString(6, mentorId);
            st.setString(7, courseid);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Course> getAllCourse() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] FROM Course";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> getCourseByCreatedby(int roleID) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] FROM Course WHERE created_by = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Course getCourseById(int id) {
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] FROM [course] WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Course course = new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id"));
                return course;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Course> getCourseByMentor(int id) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id], [mentor_id] FROM [projectSWP].[dbo].[Course] WHERE mentor_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getInt("category_id"),
                        rs.getInt("mentor_id")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Course getCourseWishListById(int courseId) {
        String query = "SELECT [id], [name], [image], [title], [mentor_id] FROM Course WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int mentorId = rs.getInt("mentor_id");
                Profile mentorProfile = getProfileByuId(mentorId);
                String mentorFullName = (mentorProfile != null) ? mentorProfile.getFullName() : "Unknown Mentor";

                return new Course(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getString("title"),
                        mentorFullName
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
            connection.setAutoCommit(false);
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
                String sql1 = "SELECT TOP (1) [uID] FROM [Account] order by [uID] desc";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                ResultSet rs = st1.executeQuery();
                if (rs.next()) {
                    int uid = rs.getInt(1);

                    // Insert into Profile table
                    String sqlProfile = "INSERT INTO [dbo].[Profile] (uid) VALUES (?)";
                    PreparedStatement stProfile = connection.prepareStatement(sqlProfile);
                    stProfile.setInt(1, uid);
                    stProfile.executeUpdate();
                }
                connection.commit(); // Xác nhận giao dịch
            } catch (SQLException e) {
                connection.rollback(); // Hủy bỏ giao dịch nếu có lỗi
            }
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
        String sql = "SELECT [Mentor_id], [Mentor_name], [email], [image], [create_by] FROM [dbo].[Mentor]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(
                        rs.getInt("Mentor_id"),
                        rs.getString("Mentor_name"),
                        rs.getString("email"),
                        rs.getString("image")
                ));
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
        try {
            connection.setAutoCommit(false);
            try {
                // Insert into Account table
                String sqlAccount = "INSERT INTO [dbo].[Account]\n"
                        + "           ([user]\n"
                        + "           ,[pass]\n"
                        + "           ,[email]\n"
                        + "           ,[roleID])\n"
                        + "           VALUES (?,?,?,?)";
                PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
                stAccount.setString(1, user);
                stAccount.setString(2, pass);
                stAccount.setString(3, email);
                stAccount.setInt(4, roleID);
                stAccount.executeUpdate();

                // Retrieve the generated uid
                String sqlRetrieveUID = "SELECT TOP (1) [uID] FROM [Account] ORDER BY [uID] DESC";
                PreparedStatement stRetrieveUID = connection.prepareStatement(sqlRetrieveUID);
                ResultSet rs = stRetrieveUID.executeQuery();
                if (rs.next()) {
                    int uid = rs.getInt(1);

                    // Insert into Profile table
                    String sqlProfile = "INSERT INTO [dbo].[Profile] (uid) VALUES (?)";
                    PreparedStatement stProfile = connection.prepareStatement(sqlProfile);
                    stProfile.setInt(1, uid);
                    stProfile.executeUpdate();
                }

                connection.commit(); // Commit transaction
            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction if there's an error
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Comment> getCommentsByCourseID(int courseID) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[courseID]\n"
                + "      ,[content]\n"
                + "      ,[userID]\n"
                + "      ,[createdDate]\n"
                + "  FROM [projectSWP].[dbo].[Comment] where courseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt(1));
                c.setContent(rs.getString(3));
                c.setUser(getUserByID(rs.getInt(4)));
                c.setCreatedDate(rs.getTimestamp(5).toLocalDateTime());
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
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
                + "where [email] = ? or user = ?";
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
        String sql = "SELECT [id], [name], [description], [image], [title], [category_id] "
                + "FROM ( "
                + "    SELECT [id], [name], [description], [image], [title], [category_id], "
                + "           ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id) AS row_num "
                + "    FROM [Course] "
                + ") AS numbered_courses "
                + "WHERE row_num <= 2"; // Thay đổi điều kiện row_num nếu cần thiết

        List<Course> courses = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                String title = rs.getString("title");
                int categoryId = rs.getInt("category_id");

                Course course = new Course(id, name, description, image, title, categoryId);
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
        for (Course arg : d.getTopCoursesByCategory()) {
            System.out.println(arg.getId());

        }

    }

    public void insertModule(String name, String courseID) {
        String sql = """
                     INSERT INTO [dbo].[Module]
                                ([course_id]
                                ,[module_name])
                          VALUES
                                (?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(courseID));
            st.setString(2, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    // Method to fetch modules by course ID

    public List<Modules> getModulesByCourseId(int courseId) {
        List<Modules> modules = new ArrayList<>();
        String sql = "SELECT * FROM Module WHERE course_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Modules module = new Modules();
                module.setModule_id(rs.getInt("module_id"));
                module.setModule_name(rs.getString("module_name"));
                module.setCourse_id(rs.getInt("course_id"));
                // Set other properties if needed
                modules.add(module);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return modules;
    }

// Method to fetch lessons by module ID
    public List<Lesson> getLessonsByModuleId(int moduleId) {
        List<Lesson> lessons = new ArrayList<>();
        String sql = "SELECT * FROM Lesson WHERE module_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, moduleId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setLesson_name(rs.getString("lesson_name"));
                lesson.setModule_id(rs.getInt("module_id"));
                lesson.setCreate_by(rs.getInt("create_by"));
                lesson.setIsActive(rs.getBoolean("isActive"));
                // Set other properties if needed
                lessons.add(lesson);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessons;
    }

    public Profile getUserProfile(int userId) {
        Profile profile = null;
        String sql = "SELECT profile_id, fullname, gender, email, nation, uid, avatar FROM Profile WHERE uid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                profile = new Profile(rs.getInt("profile_id"), rs.getString("fullname"), rs.getBoolean("gender"),
                        rs.getString("email"), rs.getString("nation"), rs.getInt("uid"), rs.getString("avatar"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return profile;
    }

    public void updateUserProfile(Profile profile) throws SQLException {
        String sql = "UPDATE Profile SET fullName=?, email=?, gender=?, nation=?, avatar=? WHERE profile_Id=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, profile.getFullName());
            statement.setString(2, profile.getEmail());
            statement.setBoolean(3, profile.isGender());
            statement.setString(4, profile.getNation());
            statement.setString(5, profile.getAvatar());
            statement.setInt(6, profile.getProfileId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new SQLException("Error updating user profile: " + ex.getMessage());
        }
    }

    public Profile getProfileByuId(int mentorid) {
        String sql = "select * from profile where uId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mentorid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Profile(
                        rs.getInt("profile_id"),
                        rs.getString("fullname"),
                        rs.getBoolean("gender"),
                        rs.getString("email"),
                        rs.getString("nation"),
                        rs.getInt("uid"),
                        rs.getString("avatar")
                );
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Lesson getLessonById(int lessonId) {
        String sql = "SELECT * FROM lesson WHERE lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Lesson(
                        rs.getInt("module_id"),
                        rs.getInt("lesson_id"),
                        rs.getString("lesson_name"),
                        rs.getString("lesson_video"),
                        rs.getInt("duration"),
                        rs.getInt("create_by"),
                        rs.getBoolean("isActive")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateLesson(Lesson lesson) {
        String sql = "UPDATE lesson SET lesson_name = ?, lesson_video = ?, duration = ?, create_by = ?, module_id = ?, isActive = ? WHERE lesson_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, lesson.getLesson_name());
            statement.setString(2, lesson.getLesson_video());
            statement.setInt(3, lesson.getDuration());
            statement.setInt(4, lesson.getCreate_by());
            statement.setInt(5, lesson.getModule_id());
            statement.setBoolean(6, lesson.isIsActive());
            statement.setInt(7, lesson.getLesson_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteLesson(int lessonId) {
        String sql = "DELETE FROM lesson WHERE lesson_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, lessonId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Account> getMentorsDetails() {
        List<Account> mentors = new ArrayList<>();
        String sql = "SELECT A.uid, p.fullname, A.roleID, P.avatar AS image "
                + "FROM Account A "
                + "INNER JOIN Profile P ON A.uid = P.uid "
                + "WHERE A.roleID = 3"; // Điều kiện roleID = 3 tương ứng với mentor

        try (
                PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("uid");
                String fullName = rs.getString("fullname");
                int roleID = rs.getInt("roleID");
                String image = rs.getString("image");

                Account mentor = new Account(id, null, null, fullName, roleID, image); // Tạo đối tượng Mentor từ ResultSet
                mentors.add(mentor); // Thêm Mentor vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mentors;
    }

    //admin
    public Map<String, Integer> getCourseParticipationByDay(int roleID) {
        Map<String, Integer> data = new HashMap<>();
        String sql = "SELECT DATENAME(WEEKDAY, JoinDate) as DayOfWeek, COUNT(*) as Count "
                + "FROM CourseEnrollment ce "
                + "JOIN Account a ON ce.AccountID = a.uID "
                + "WHERE a.roleID = ? "
                + "GROUP BY DATENAME(WEEKDAY, JoinDate)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                data.put(rs.getString("DayOfWeek"), rs.getInt("Count"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }
//

    public List<AccountProfileDto> getAccountByRoleIdToMange(int roleID) {
        List<AccountProfileDto> list = new ArrayList<>();
        String sql = "SELECT a.uID, p.avatar, p.fullname, a.isActive, p.nation, a.email, p.gender "
                + "FROM Account a "
                + "JOIN Profile p ON a.uID = p.uID "
                + "WHERE a.roleID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, roleID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    AccountProfileDto ap = new AccountProfileDto(
                            rs.getInt("uID"),
                            rs.getString("avatar"),
                            rs.getString("fullname"),
                            rs.getBoolean("isActive"),
                            rs.getString("nation"),
                            rs.getString("email"),
                            rs.getBoolean("gender")
                    );
                    list.add(ap);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception while fetching accounts: " + e.getMessage());
        }
        return list;
    }

    public boolean updateAccountStatus(int uID, boolean isActive) {
        String sql = "UPDATE Account SET isActive = ? WHERE uID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setBoolean(1, isActive);
            st.setInt(2, uID);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.err.println("SQL Exception while updating account status: " + e.getMessage());
            return false;
        }
    }
}
