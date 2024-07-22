/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

public class Course {
    private int id;
    private String name;
    private String description;
    private String image,title,mentorName;
    private int category_id,createdBy,mentorId;
    private List<Comment> list;

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public List<Comment> getList() {
        return list;
    }

    public void setList(List<Comment> list) {
        this.list = list;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }
    
    
    public Course() {
    }

    public Course(int id, String name, String image, String title, int mentorId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.title = title;
        this.mentorId = mentorId;
    }
    public Course(int id, String name, String image, String title, String  mentorName) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.title = title;
        this.mentorName = mentorName;
    }

    public Course(int id, String name, String description,  String image, String title, int category_id) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.title = title;
        this.category_id = category_id;
    }
    public Course(int id, String name, String description,  String image, String title, int category_id, int mentorId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.title = title;
        this.category_id = category_id;
        this.mentorId = mentorId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
