/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author nguye
 */
public class WishList {

    private int id;
    private Date wishlistDate;
    private User us_id;
    private Movie movie;

    public WishList() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getWishlistDate() {
        return wishlistDate;
    }

    public void setWishlistDate(Date wishlistDate) {
        this.wishlistDate = wishlistDate;
    }

    public User getUs_id() {
        return us_id;
    }

    public void setUs_id(User us_id) {
        this.us_id = us_id;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

}
