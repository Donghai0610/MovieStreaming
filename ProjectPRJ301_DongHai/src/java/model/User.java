/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class User {

    private int id;
    private String user, fullname, email, phonenum, avatar;
    private int role;
    private String password;

    public User() {
    }

    public User(String user, String fullname, String email, String phonenum, String avatar, String password) {
        this.user = user;
        this.fullname = fullname;
        this.email = email;
        this.phonenum = phonenum;
        this.avatar = avatar;
        this.password = password;
    }

    public User(int id, String user, String fullname, String email, String phonenum, String avatar, int role, String password) {
        this.id = id;
        this.user = user;
        this.fullname = fullname;
        this.email = email;
        this.phonenum = phonenum;
        this.avatar = avatar;
        this.role = role;
        this.password = password;
    }

    public User(String user, String password) {
        this.user = user;
        this.password = password;
    }

    public User(String user, String password, String fullname, int role, int id) {
        this.user = user;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
        this.id = id;
    }

    public User(int id, String user) {
        this.id = id;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
