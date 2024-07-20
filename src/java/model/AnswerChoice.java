package model;

public class AnswerChoice {

    private int answerChoiceId;
    private int questionId;
    private String answerChoiceText;
    private boolean isCorrect;

    public AnswerChoice() {
    }

    public AnswerChoice(int answerChoiceId, int questionId, String answerChoiceText, boolean isCorrect) {
        this.answerChoiceId = answerChoiceId;
        this.questionId = questionId;
        this.answerChoiceText = answerChoiceText;
        this.isCorrect = isCorrect;
    }

    public int getAnswerChoiceId() {
        return answerChoiceId;
    }

    public void setAnswerChoiceId(int answerChoiceId) {
        this.answerChoiceId = answerChoiceId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getAnswerChoiceText() {
        return answerChoiceText;
    }

    public void setAnswerChoiceText(String answerChoiceText) {
        this.answerChoiceText = answerChoiceText;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }
}
