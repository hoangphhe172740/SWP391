package model;

public class Quiz {

    private int quizId;
    private int lessonId;
    private String quizName;
    private String quizDescription;
    private int quizTime; // Time in minutes
    private int passScore;
    private boolean is_active;
    private boolean hasJoined;
    private int score;
    private boolean passed;

    public Quiz() {
    }

    public Quiz(int quizId, int lessonId, String quizName, String quizDescription, int quizTime, int passScore, boolean is_active) {
        this.quizId = quizId;
        this.lessonId = lessonId;
        this.quizName = quizName;
        this.quizDescription = quizDescription;
        this.quizTime = quizTime;
        this.passScore = passScore;
        this.is_active = is_active;
    }

    public Quiz(int quizId, int lessonId, String quizName, String quizDescription, int quizTime, int passScore) {
        this.quizId = quizId;
        this.lessonId = lessonId;
        this.quizName = quizName;
        this.quizDescription = quizDescription;
        this.quizTime = quizTime;
        this.passScore = passScore;
    }

    public boolean isHasJoined() {
        return hasJoined;
    }

    public void setHasJoined(boolean hasJoined) {
        this.hasJoined = hasJoined;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public boolean isPassed() {
        return passed;
    }

    public void setPassed(boolean passed) {
        this.passed = passed;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public String getQuizDescription() {
        return quizDescription;
    }

    public void setQuizDescription(String quizDescription) {
        this.quizDescription = quizDescription;
    }

    public int getQuizTime() {
        return quizTime;
    }

    public void setQuizTime(int quizTime) {
        this.quizTime = quizTime;
    }

    public int getPassScore() {
        return passScore;
    }

    public void setPassScore(int passScore) {
        this.passScore = passScore;
    }
}