/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class QuestionChoice {
    
    private String choice;
    private boolean inCorrect;

    public QuestionChoice() {
    }

    public QuestionChoice(String choice, boolean inCorrect) {
        this.choice = choice;
        this.inCorrect = inCorrect;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public boolean isInCorrect() {
        return inCorrect;
    }

    public void setInCorrect(boolean inCorrect) {
        this.inCorrect = inCorrect;
    }   
}
