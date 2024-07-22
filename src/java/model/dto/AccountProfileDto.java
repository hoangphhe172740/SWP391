/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dto;

/**
 *
 * @author khanh
 */
public class AccountProfileDto {
    private int uID;
    private String avatar;
    private String fullname;
    private boolean isActive;
    private String nation;
    private String email;
    private boolean  gender;

    public AccountProfileDto(int uID, String avatar, String fullname, boolean isActive, String nation, String email, boolean  gender) {
        this.uID = uID;
        this.avatar = avatar;
        this.fullname = fullname;
        this.isActive = isActive;
        this.nation = nation;
        this.email = email;
        this.gender = gender;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

 
    
}
