/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class Vn_Pay {

    private int userID;
    private int movieID;
    private String magd;

    public Vn_Pay() {
    }

    public Vn_Pay(int userID, int movieID, String magd) {
        this.userID = userID;
        this.movieID = movieID;
        this.magd = magd;
    }

    public String getMagd() {
        return magd;
    }

    public void setMagd(String magd) {
        this.magd = magd;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

}
