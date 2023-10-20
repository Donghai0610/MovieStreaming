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
import model.Movie;

/**
 *
 * @author nguye
 */
public class MovieDAO extends DBContext {

    public List<Movie> getAll() {
        List<Movie> ls = new ArrayList<>();
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("movieName"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    public Movie getMoviebyId(int id) {
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid\n"
                + "where m.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("movieName"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Movie> getRandomMovies(int count) {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) [ID], [name], [price], [image], [describe], \n"
                + "             [actor], [director], [release], [linkmovie], [view] \n"
                + "                FROM [dbo].[Movie] \n"
                + "                ORDER BY NEWID();";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, count);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("ID")); // Correct the case to match the database
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                movies.add(c);
            }
        } catch (SQLException e) {
        }

        return movies;
    }

    public List<Movie> getMoviebyRelease(int count) {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) [ID], [name], [price], [image], [describe], \n"
                + "             [actor], [director], [release], [linkmovie], [view] \n"
                + "                FROM [dbo].[Movie] \n"
                + "               order by  release  desc; ;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, count);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("ID")); // Correct the case to match the database
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                movies.add(c);
            }
        } catch (SQLException e) {
        }

        return movies;
    }

    public List<Movie> getListByPage(List<Movie> list,
            int start, int end) {
        ArrayList<Movie> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Movie> getMovieByCid(int cid) {
        List<Movie> ls = new ArrayList<>();
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid\n"
                + "where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("movieName"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    public List<Movie> searchByName(String key) {
        List<Movie> ls = new ArrayList<>();
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid\n"
                + "where m.name like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();

            System.out.println(sql);
            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("movieName"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    public List<Movie> checkBox(int[] id) {
        List<Movie> ls = new ArrayList<>();
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid\n"
                + " where 1=1 ";
        if (id != null) {
            sql += " and m.cid in(";
            for (int i = 0; i < id.length; i++) {
                sql += id[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";

        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Movie c = new Movie();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("movieName"));
                c.setPrice(rs.getDouble("price"));
                c.setImage(rs.getString("image"));
                c.setDescribe(rs.getString("describe"));
                c.setActor(rs.getString("actor"));
                c.setDirector(rs.getString("director"));
                c.setRelease(rs.getDate("release"));
                c.setLinkmovie(rs.getString("linkmovie"));
                c.setView(rs.getInt("view"));
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                ls.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ls;
    }

    public static void main(String[] args) {
        MovieDAO dal = new MovieDAO();
        List<Movie> movie = dal.searchByName("T");
        System.out.println(movie.get(1).getName());
    }
}
