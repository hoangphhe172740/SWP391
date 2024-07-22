package model;

import java.util.ArrayList;
import java.util.List;
import model.AnswerChoice;

public class Question {
    private int questionId;
    private int quizId;
    private String questionText;
    private String questionType;
    private List<AnswerChoice> answers;

    public Question() {
    }

    // Constructor
    public Question(int questionId, int quizId, String questionText, String questionType) {
        this.questionId = questionId;
        this.quizId = quizId;
        this.questionText = questionText;
        this.questionType = questionType;
        this.answers = new ArrayList<>(); // Khởi tạo danh sách answers
    }

    // Getters and setters
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public List<AnswerChoice> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AnswerChoice> answers) {
        this.answers = answers;
    }

    // Method to add an answer choice
    public void addAnswer(AnswerChoice answer) {
        if (this.answers == null) {
            this.answers = new ArrayList<>(); // Khởi tạo nếu danh sách answers là null
        }
        this.answers.add(answer);
    }
}
