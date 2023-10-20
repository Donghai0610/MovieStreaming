/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Comment;
import model.Movie;
import model.MovieCategory;
import model.User;

/**
 *
 * @author nguye
 */
public class InsertManyToMany extends DBContext {

    public List<Movie> getAllMovie() {
        List<Movie> ls = new ArrayList<>();
        String sql = "select * from Movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phonenum]\n"
                + "      ,[avatar]\n"
                + "      ,[role]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User c = new User();
                c.setId(rs.getInt("id"));
                c.setUser(rs.getString("user"));
                c.setFullname(rs.getString("fullname"));
                c.setEmail(rs.getString("email"));
                c.setPhonenum(rs.getString("phonenum"));
                c.setAvatar(rs.getString("avatar"));
                c.setRole(rs.getInt("role"));
                c.setPassword(rs.getString("password"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<MovieCategory> getMovieCategories() {
        List<MovieCategory> movieCategories = new ArrayList<>();
        String sql = "SELECT M.[ID] AS movie_id,\n"
                + "       M.[name] AS movie_name,\n"
                + "       M.[price],\n"
                + "       M.[image],\n"
                + "       M.[describe],\n"
                + "       M.[actor],\n"
                + "       M.[director],\n"
                + "       M.[release],\n"
                + "       M.[linkmovie],\n"
                + "       M.[view],\n"
                + "       C.[id] AS category_id,\n"
                + "       C.[name] AS category_name\n"
                + "FROM [dbo].[Movie] M\n"
                + "INNER JOIN [dbo].[Movie_Category] MC ON M.[ID] = MC.[movie_id]\n"
                + "INNER JOIN [dbo].[Category] C ON MC.[category_id] = C.[id];";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setId(resultSet.getInt("movie_id"));
                movie.setName(resultSet.getString("movie_name"));
                movie.setPrice(resultSet.getDouble("price"));
                movie.setImage(resultSet.getString("image"));
                movie.setDescribe(resultSet.getString("describe"));
                movie.setActor(resultSet.getString("actor"));
                movie.setDirector(resultSet.getString("director"));
                movie.setRelease(resultSet.getDate("release"));
                movie.setLinkmovie(resultSet.getString("linkmovie"));
                movie.setView(resultSet.getInt("view"));

                Category category = new Category();
                category.setId(resultSet.getInt("category_id"));
                category.setName(resultSet.getString("category_name"));

                MovieCategory movieCategory = new MovieCategory(movie, category);
                movieCategories.add(movieCategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movieCategories;
    }

    public List<Comment> getCommet(int videoId) {
        List<Comment> list = new ArrayList<>();

        try {
            String sql = "select c.id, m.ID as videoId ,c.comment ,c.commentDate, u.id as userId, u.name as movieName\n"
                    + "                    from Comment as c \n"
                    + "                    inner join Movie as m on (m.ID = c.videoId)\n"
                    + "                    inner join [User] as u on u.id = c.userId";
            if (videoId > 0) {
                sql += " where videoId = " + videoId;
            }
            System.out.println(sql);
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt("id"));
                c.setComment(rs.getString("comment"));
                c.setCommentDate(rs.getDate("commentDate"));
                Movie m = new Movie(rs.getInt("videoId"));
                c.setVideoId(m);
                User u = new User(rs.getInt("userId"), rs.getString("movieName"));
                c.setUserId(u);
                list.add(c);

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void inserComment(Comment c) {
        String sql = "INSERT INTO [dbo].[Comment]\n"
                + "           ([userId]\n"
                + "           ,[videoId]\n"
                + "           ,[comment]\n"
                + "           ,[commentDate])\n"
                + "     VALUES\n"
                + "           (?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getUserId().getId());
            st.setInt(2, c.getVideoId().getId());
            st.setString(3, c.getComment());
            st.setDate(4, c.getCommentDate());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        InsertManyToMany dal = new InsertManyToMany();
        List<Comment> m = dal.getCommet(15);
        System.out.println(m.get(0).getUserId());
//        Comment c = new Comment(0, userId, videoId, comment, commentDate);
//        dal.inserComment(c);
    }
}
