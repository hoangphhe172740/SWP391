package model;

public class QuizUser {

    private int userQuizId;
    private int userId;
    private int quizId;
    private int score;
    private boolean is_passed;

    public QuizUser() {
    }

    public QuizUser(int userQuizId, int userId, int quizId, int score, boolean is_passed) {
        this.userQuizId = userQuizId;
        this.userId = userId;
        this.quizId = quizId;
        this.score = score;
        this.is_passed = is_passed;
    }

    public boolean isIs_passed() {
        return is_passed;
    }

    public void setIs_passed(boolean is_passed) {
        this.is_passed = is_passed;
    }

    public int getUserQuizId() {
        return userQuizId;
    }

    public void setUserQuizId(int userQuizId) {
        this.userQuizId = userQuizId;
    }

    public int getUserId() {
        return userId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
