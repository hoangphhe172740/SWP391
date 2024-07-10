/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;
import model.Quiz;

public class QuizDAO extends DBContext {
    private Timer timer;
    private long duration; // Duration in milliseconds

    public QuizDAO() {
        this.duration = 30 * 60 * 1000; // 30 minutes in milliseconds
    }

    public void addQuiz(int moduleid,String quiz_name,String quiz_time,double passscore ) {
        String sql = "INSERT INTO [dbo].[Quizs]\n"
                + "           ([ModuleId]\n"
                + "           ,[quiz_name]\n"
                + "           ,[quiz_time]\n"
                + "           ,[PassScore])"
                + "VALUES(?,?,?,?)";
        PreparedStatement st;
        try {
            Time quizTime = Time.valueOf(quiz_time);
            st = connection.prepareStatement(sql);
            st.setInt(1, moduleid);
            st.setString(2, quiz_name);
            st.setTime(3, quizTime);
            st.setDouble(4, passscore);
            st.executeUpdate();
            
            // Start countdown after adding quiz
            startCountdown(quizTime);
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void startCountdown(Time quizTime) {
        long quizStartTime = System.currentTimeMillis();
        long endTime = quizStartTime + duration;
        timer = new Timer();

        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                long currentTime = System.currentTimeMillis();
                long remainingTime = endTime - currentTime;

                if (remainingTime <= 0) {
                    System.out.println("Time's up!");
                    timer.cancel();
                } else {
                    long minutes = TimeUnit.MILLISECONDS.toMinutes(remainingTime);
                    long seconds = TimeUnit.MILLISECONDS.toSeconds(remainingTime) % 60;
                    System.out.printf("Time remaining: %02d:%02d\n", minutes, seconds);
                }
            }
        }, 0, 1000); // Run task every second
    }

    public static void main(String[] args) {
//        QuizDAO dao = new QuizDAO();
//
//        // Example user input
//        int moduleId = 1;
//        String quizName = "haha";
//        Time quizTime = Time.valueOf("10:10:10");
//        double passScore = 100.0;
//
//        dao.addQuiz(moduleId, quizName, quizTime, passScore);
    }
}