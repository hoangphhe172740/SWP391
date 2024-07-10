/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import context.DBContext;
import java.sql.Timestamp;
import java.util.Date;
import model.Course;
import model.CourseEnrollment;
import model.Lesson;
import model.Modules;

public class LessonDAO extends DBContext {

    public List<Modules> getAllModule() {
        List<Modules> list = new ArrayList<>();
        String sql = "SELECT [course_id]\n"
                + "      ,[module_id]\n"
                + "      ,[module_name]\n"
                + "  FROM [dbo].[Module]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Modules(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Modules> getAllModuleByCid(int course_id) {
        List<Modules> list = new ArrayList<>();
        String sql = "SELECT [course_id], [module_id], [module_name] "
                + "FROM [dbo].[Module] "
                + "WHERE [course_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Modules(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Lesson> getLessonByModuleid(int module_id) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT [module_id]\n"
                + "      ,[lesson_Id]\n"
                + "      ,[lesson_name]\n"
                + "      ,[lesson_video]\n"
                + "      ,[duration]\n"
                + "      ,[create_by]\n"
                + "  FROM [dbo].[Lesson]"
                + "where [module_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, module_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void AddLesson(String module, String lesson_name, String lesson_video, int createRole) {
        String sql = "INSERT INTO [dbo].[Lesson]\n"
                + "           ([module_id]\n"
                + "           ,[lesson_name]\n"
                + "           ,[lesson_video]\n"
                + "           ,[create_by])"
                + "VALUES (?,?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, module);
            st.setString(2, lesson_name);
            st.setString(3, lesson_video);
            st.setInt(4, createRole);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void AddHistoryJoin(int account_id, String email, int course_id) {
        Date date = new Date();
        System.out.println(date);
        Timestamp timestamp = new Timestamp(date.getTime());
        String sql = "INSERT INTO [dbo].[CourseEnrollment]\n"
                + "           ([AccountID]\n"
                + "           ,[Email]\n"
                + "           ,[CourseID]\n"
                + "           ,[JoinDate])"
                + "VALUES (?,?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.setString(2, email);
            st.setInt(3, course_id);
            st.setTimestamp(4, timestamp);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public boolean checkEnrollExist(int Accountid, String Courseid) {
        String sql = "SELECT [EnrollmentID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Email]\n"
                + "      ,[CourseID]\n"
                + "      ,[JoinDate]\n"
                + "  FROM [dbo].[CourseEnrollment] "
                + "where [AccountID] = ? and [CourseID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Accountid);
            st.setString(2, Courseid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<CourseEnrollment> getCourseidByAccId(int id) {
        List<CourseEnrollment> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "      [AccountID]\n"
                + "      ,[Email]\n"
                + "      ,[CourseID]\n"
                + "      ,[JoinDate]\n"
                + "  FROM [dbo].[CourseEnrollment]\n"
                + "  where AccountID = ?\n"
                + "  order by CourseID desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new CourseEnrollment(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<CourseEnrollment> getMycoursebyAccID(int id) {
        List<CourseEnrollment> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "  FROM [dbo].[CourseEnrollment] ce\n"
                + "  join Course c on c.id = ce.CourseID\n"
                + "  where AccountID = ?\n"
                + "  order by ce.CourseID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CourseEnrollment courseEn = new CourseEnrollment();
                courseEn.setAccountID(rs.getInt(2));
                courseEn.setCourseID(rs.getInt(4));
                courseEn.setCourseName(rs.getString(7));
                courseEn.setCourseImage(rs.getString(10));
                courseEn.setJoindate(rs.getString(5));
                list.add(courseEn);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        LessonDAO d = new LessonDAO();
        System.out.println(d.getMycoursebyAccID(2));
    }
}
