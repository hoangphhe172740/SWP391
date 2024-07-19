/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AnswerChoice;
import model.Question;

import model.Quiz;

public class QuizDAO extends DBContext {

    private Timer timer;
    private long duration; // Duration in milliseconds

    public QuizDAO() {
        this.duration = 30 * 60 * 1000; // 30 minutes in milliseconds
    }

    public void addQuiz(int moduleid, String quiz_name, String quiz_time, double passscore) {
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

//    public List<Question> getQuestionsByQuizID(int id) {
//        List<Question> questions = new ArrayList<>();
//        String sql = """
//                     SELECT [QuestionID]
//                           ,[Question_Number]
//                           ,[Quiz_id]
//                           ,[QuestionName]
//                       FROM [dbo].[Question] where Quiz_id = ?
//                     """;
//        PreparedStatement st;
//        try {
//            st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Question question = new Question();
//                question.setQuestion_number(rs.getInt(2));
//                question.setQuestionID(rs.getInt(1));
//                question.setQuestion_name(rs.getString(4));
//                question.setQuiz_id(rs.getInt(3));
//                question.setChoices(getQuestionChoiceByQuestionID(rs.getInt(1)));
//                questions.add(question);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return questions;
//    }
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

    public void addQuestion(String questionNumber, String Quizid, String questionName) {
        String sql = "INSERT INTO [dbo].[Question]\n"
                + "           ([Question_Number]\n"
                + "           ,[Quiz_id]\n"
                + "           ,[QuestionName])"
                + "VALUES (?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, questionNumber);
            st.setString(2, Quizid);
            st.setString(3, questionName);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addQuestionChoice(String questionID, String choice, boolean incorrect) {
        String sql = "INSERT INTO [dbo].[QuestionChoice] (QuestionID, Choices, inCorrect) VALUES (?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, questionID);
            st.setString(2, choice);
            st.setBoolean(3, incorrect);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            // Hoặc xử lý lỗi theo cách khác
        }
    }

//    public List<QuestionChoice> getQuestionChoiceByQuestionID(int questionID){
//        List<QuestionChoice> list = new ArrayList<>();
//        String sql = """
//                     SELECT [QuestionID]
//                           ,[Choices]
//                           ,[inCorrect]
//                           ,[id]
//                       FROM [dbo].[QuestionChoice] where QuestionID = ?
//                     """;
//        PreparedStatement st;
//        try {
//            st = connection.prepareStatement(sql);
//            st.setInt(1, questionID);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                QuestionChoice questionChoice = new QuestionChoice();
//                questionChoice.setId(rs.getInt(4));
//                questionChoice.setChoice(rs.getString(2));
//                questionChoice.setInCorrect(rs.getBoolean(3));
//                list.add(questionChoice);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    public static void main(String[] args) {
        QuizDAO d = new QuizDAO();
        try {
            System.out.println(d.isBooleanAnswerCorrect(20, "true"));
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to insert a quiz
    public int insertQuiz(int lessonId, String quizName, String quizDescription, int quizTime, int passScore) {
        String sql = "INSERT INTO Quiz (lesson_id, quiz_name, quiz_description, quiz_time, pass_score) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, lessonId);
            ps.setString(2, quizName);
            ps.setString(3, quizDescription);
            ps.setInt(4, quizTime);
            ps.setInt(5, passScore);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error inserting quiz: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    // Method to insert a question
    public int insertQuestion(int quizId, String questionText, String questionType) {
        String sql = "INSERT INTO Question (quiz_id, question_text, question_type) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, quizId);
            ps.setString(2, questionText);
            ps.setString(3, questionType);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Method to insert an answer choice
    public void insertAnswerChoice(int questionId, String answerChoiceText, boolean isCorrect) {
        String sql = "INSERT INTO AnswerChoice (question_id, answer_choice_text, is_correct) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, questionId);
            ps.setString(2, answerChoiceText);
            ps.setBoolean(3, isCorrect);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Quiz> getQuizzesByLessonId(int lessonId, int userId) {
        List<Quiz> quizzes = new ArrayList<>();
        String sql = "SELECT q.quiz_id, q.quiz_name, q.quiz_description, q.quiz_time, q.pass_score, "
                + "       CASE WHEN qu.user_id IS NOT NULL THEN 1 ELSE 0 END AS has_joined, "
                + "       ISNULL(qu.score, 0) AS score, "
                + "       ISNULL(qu.is_passed, 0) AS is_passed "
                + "FROM Quiz q "
                + "LEFT JOIN quiz_user qu ON q.quiz_id = qu.quiz_id AND qu.user_id = ? "
                + "WHERE q.lesson_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, lessonId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Quiz quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("quiz_id"));
                    quiz.setLessonId(lessonId); // Ensure lessonId is set
                    quiz.setQuizName(rs.getString("quiz_name"));
                    quiz.setQuizDescription(rs.getString("quiz_description"));
                    quiz.setQuizTime(rs.getInt("quiz_time"));
                    quiz.setPassScore(rs.getInt("pass_score"));
                    quiz.setHasJoined(rs.getBoolean("has_joined"));
                    quiz.setScore(rs.getInt("score"));
                    quiz.setPassed(rs.getBoolean("is_passed"));
                    quizzes.add(quiz);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizzes;
    }

    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT q.question_id, q.question_text, q.question_type, "
                + "a.answer_choice_id, a.answer_choice_text, a.is_correct "
                + "FROM Question q "
                + "LEFT JOIN AnswerChoice a ON q.question_id = a.question_id "
                + "WHERE q.quiz_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, quizId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int questionId = rs.getInt("question_id");
                    String questionText = rs.getString("question_text");
                    String questionType = rs.getString("question_type");
                    int answerId = rs.getInt("answer_choice_id");
                    String answerText = rs.getString("answer_choice_text");
                    boolean isCorrect = rs.getBoolean("is_correct");

                    // Tạo hoặc tìm câu hỏi tương ứng với id
                    Question question = findOrCreateQuestion(questions, questionId, questionText, questionType, quizId);

                    // Thêm các đáp án vào câu hỏi
                    if (answerId > 0) { // Chỉ thêm đáp án nếu có ID hợp lệ
                        question.addAnswer(new AnswerChoice(answerId, questionId, answerText, isCorrect));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    private Question findOrCreateQuestion(List<Question> questions, int id, String text, String type, int quizId) {
        for (Question question : questions) {
            if (question.getQuestionId() == id) {
                return question;
            }
        }
        Question newQuestion = new Question(id, quizId, text, type);
        questions.add(newQuestion);
        return newQuestion;
    }

    public Quiz getQuizById(int quizId) {
        Quiz quiz = null;
        String query = "SELECT quiz_id, lesson_id, quiz_name, quiz_description, quiz_time, pass_score "
                + "FROM Quiz "
                + "WHERE quiz_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quizId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("quiz_id"));
                    quiz.setLessonId(rs.getInt("lesson_id")); // Set lesson_id
                    quiz.setQuizName(rs.getString("quiz_name"));
                    quiz.setQuizDescription(rs.getString("quiz_description"));
                    quiz.setQuizTime(rs.getInt("quiz_time"));
                    quiz.setPassScore(rs.getInt("pass_score"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quiz;
    }

    public boolean isBooleanAnswerCorrect(int questionId, String userAnswer) throws SQLException {
        String query = "  SELECT is_correct FROM answerchoice WHERE question_id = ? AND answer_choice_text = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, questionId);
            ps.setString(2, userAnswer);
            try (ResultSet rs = ps.executeQuery()) {
                // Return true if there is an answer matching the user's answer and it is correct
                return rs.next();
            }
        }
    }

    public boolean areAnswersCorrect(int questionId, List<Integer> selectedAnswers) throws SQLException {
        String query = "SELECT answer_choice_id FROM answerchoice WHERE question_id = ? AND is_correct = 1";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, questionId);
            try (ResultSet rs = ps.executeQuery()) {
                Set<Integer> correctAnswers = new HashSet<>();
                while (rs.next()) {
                    correctAnswers.add(rs.getInt("answer_choice_id"));
                }
                return correctAnswers.equals(new HashSet<>(selectedAnswers));
            }
        }
    }

    public void insertQuizUser(int quizId, int userId) throws SQLException {
        String query = "INSERT INTO quiz_user (quiz_id, user_id) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, quizId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }

    public void updateQuizUser(int quizId, int userId, int score, boolean isPassed) throws SQLException {
        String query = "UPDATE quiz_user SET score = ?, is_passed = ? WHERE quiz_id = ? AND user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, score);
            ps.setBoolean(2, isPassed);
            ps.setInt(3, quizId);
            ps.setInt(4, userId);
            ps.executeUpdate();
        }
    }

    public int getTotalQuestions(int quizId) throws SQLException {
        String query = "SELECT COUNT(question_id) FROM question WHERE quiz_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                throw new SQLException("Questions not found");
            }
        }
    }

    public boolean isQuizUserExists(int quizId, int accountId) throws SQLException {
        String query = "SELECT COUNT(*) FROM quiz_user WHERE quiz_id = ? AND user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quizId);
            ps.setInt(2, accountId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

}
