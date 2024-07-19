/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Account {

    private int id;
    private String email;
    private String pass;
    private String user;
    private int roleID;
    private String image;

    public Account(String email, String pass, String user, int roleID) {
        this.email = email;
        this.pass = pass;
        this.user = user;
        this.roleID = roleID;
    }

    public Account(int id, String email, String pass, String user, int roleID, String image) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.user = user;
        this.roleID = roleID;
        this.image = image;
    }

    public Account() {
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Account(int id, String email, String pass, String user, int roleID) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.user = user;
        this.roleID = roleID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", email=" + email + ", pass=" + pass + ", user=" + user + ", roleID=" + roleID + '}';
    }

}
