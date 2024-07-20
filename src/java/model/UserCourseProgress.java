package model;

public class UserCourseProgress {

    private int userCourseProgressId;
    private int userId;
    private int courseId;
    private int progress; // Percentage progress (0-100)
    private boolean isCompleted;
    private long lastUpdated; // Time in milliseconds since epoch

    public UserCourseProgress() {
    }

    public UserCourseProgress(int userCourseProgressId, int userId, int courseId, int progress, boolean isCompleted, long lastUpdated) {
        this.userCourseProgressId = userCourseProgressId;
        this.userId = userId;
        this.courseId = courseId;
        this.progress = progress;
        this.isCompleted = isCompleted;
        this.lastUpdated = lastUpdated;
    }

    public int getUserCourseProgressId() {
        return userCourseProgressId;
    }

    public void setUserCourseProgressId(int userCourseProgressId) {
        this.userCourseProgressId = userCourseProgressId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    public long getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(long lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
