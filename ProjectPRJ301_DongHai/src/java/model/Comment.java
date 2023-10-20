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
public class Comment {

    private int id;
    private User userId;
    private Movie videoId;
    private String comment;
    private Date commentDate;

    public Comment() {
    }

    public Comment(int id, User userId, Movie videoId, String comment, Date commentDate) {
        this.id = id;
        this.userId = userId;
        this.videoId = videoId;
        this.comment = comment;
        this.commentDate = commentDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Movie getVideoId() {
        return videoId;
    }

    public void setVideoId(Movie videoId) {
        this.videoId = videoId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

}
