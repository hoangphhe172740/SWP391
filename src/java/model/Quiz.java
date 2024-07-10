/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

public class Quiz {
    private int module_id;
    private String quiz_name;
    private Time quiz_time;
    private double passScore;

    public Quiz() {
    }

    public Quiz(int module_id, String quiz_name, Time quiz_time, double passScore) {
        this.module_id = module_id;
        this.quiz_name = quiz_name;
        this.quiz_time = quiz_time;
        this.passScore = passScore;
    }

    public int getModule_id() {
        return module_id;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public String getQuiz_name() {
        return quiz_name;
    }

    public void setQuiz_name(String quiz_name) {
        this.quiz_name = quiz_name;
    }

    public Time getQuiz_time() {
        return quiz_time;
    }

    public void setQuiz_time(Time quiz_time) {
        this.quiz_time = quiz_time;
    }

    public double getPassScore() {
        return passScore;
    }

    public void setPassScore(double passScore) {
        this.passScore = passScore;
    }
}