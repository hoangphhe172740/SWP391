/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author khanh
 */
public class Profile {
    private int profileId;
    private String fullName;
    private boolean gender;
    private String email;
    private String nation;
    private int uid;
    private String avatar;

    public Profile() {
    }

    public Profile(int profileId, String fullName, boolean gender, String email, String nation, int uid, String avatar) {
        this.profileId = profileId;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.nation = nation;
        this.uid = uid;
        this.avatar = avatar;
    }

    public Profile(int profileId, String fullName, boolean gender, String email, String nation, String avatar) {
        this.profileId = profileId;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.nation = nation;
        this.avatar = avatar;
    }

  

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
}
