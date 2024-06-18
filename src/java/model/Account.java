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
    private String roleID;

    public Account() {
    }

    public Account(int id, String email, String pass, String user, String roleID) {
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

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", email=" + email + ", pass=" + pass + ", user=" + user + ", roleID=" + roleID + '}';
    }
    
}
