/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Lesson {

    private int module_id;
    private int lesson_id;
    private String lesson_name;
    private String lesson_video;
    private int duration;
    private int create_by;
    private boolean isActive;

    public Lesson() {
    }

    public Lesson(int module_id, int lesson_id, String lesson_name, String lesson_video, int duration, int create_by) {
        this.module_id = module_id;
        this.lesson_id = lesson_id;
        this.lesson_name = lesson_name;
        this.lesson_video = lesson_video;
        this.duration = duration;
        this.create_by = create_by;
    }

    public Lesson(int module_id, int lesson_id, String lesson_name, String lesson_video, int duration, int create_by, boolean isActive) {
        this.module_id = module_id;
        this.lesson_id = lesson_id;
        this.lesson_name = lesson_name;
        this.lesson_video = lesson_video;
        this.duration = duration;
        this.create_by = create_by;
        this.isActive = isActive;
    }

    public int getModule_id() {
        return module_id;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public void setLesson_name(String lesson_name) {
        this.lesson_name = lesson_name;
    }

    public String getLesson_video() {
        return lesson_video;
    }

    public void setLesson_video(String lesson_video) {
        this.lesson_video = lesson_video;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

}
