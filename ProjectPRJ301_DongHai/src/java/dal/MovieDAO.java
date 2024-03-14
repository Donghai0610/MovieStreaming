/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        String sql = "SELECT TOP (?) m.[ID], m.[name], m.[price], m.[image], m.[describe], \n"
                + "             m.[actor], m.[director], m.[release], m.[linkmovie], m.[view],\n"
                + "			 c.id as cid , c.name as cname\n"
                + "                FROM [dbo].[Movie]  as m\n"
                + "				inner join Category as c on m.cid = c.id\n"
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
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
                movies.add(c);
            }
        } catch (SQLException e) {
        }

        return movies;
    }

    public List<Movie> getMoviebyRelease(int count) {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) m.[ID], m.[name], m.[price], m.[image], m.[describe], \n"
                + "             m.[actor], m.[director], m.[release], m.[linkmovie], m.[view],\n"
                + "			 c.id as cid , c.name as cname\n"
                + "                FROM [dbo].[Movie]  as m\n"
                + "				inner join Category as c on m.cid = c.id\n"
                + "                ORDER BY  m.[release] desc;";

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
                Category cate = new Category(rs.getInt("cid"), rs.getString("cname"));
                c.setCid(cate);
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

    public List<Movie> checkBox(int[] id, String name_asc, String name_desc, Integer price_desc, Integer price_acs, String key) {
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
        if (name_asc != null) {
            sql += " order by m.name asc ";
        }
        if (name_desc != null) {
            sql += " order by m.name desc";
        }
        if (price_acs != null) {
            sql += " order by m.price asc";
        }
        if (price_desc != null) {
            sql += " order by m.price desc";
        }
        if (!key.equals("")) {
            sql += " and m.name like '%" + key + "%'";
        }
        System.out.println(sql);
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

    public void insert(Movie m) {
        String sql = "INSERT INTO [dbo].[Movie]\n"
                + "           ([name]\n"
                + "           ,[price]\n"
                + "           ,[image]\n"
                + "           ,[describe]\n"
                + "           ,[actor]\n"
                + "           ,[director]\n"
                + "           ,[release]\n"
                + "           ,[linkmovie]\n"
                + "           \n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setDouble(2, m.getPrice());
            st.setString(3, m.getImage());
            st.setString(4, m.getDescribe());
            st.setString(5, m.getActor());
            st.setString(6, m.getDirector());
            st.setDate(7, m.getRelease());
            st.setString(8, m.getLinkmovie());
            st.setObject(9, m.getCid().getId());

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Movie getMovieByName(String name) {
        String sql = "select m.id,m.[name] as movieName,m.describe,m.price,m.[image],m.actor,m.director,m.release,m.linkmovie,m.[view],c.id as cid , c.[name]as cname\n"
                + "from Movie as m \n"
                + "inner join  Category as c on c.id = m.cid\n"
                + "where m.name = ? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
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

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Movie]\n"
                + "      WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Movie m) {
        String sql = "UPDATE [dbo].[Movie]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[actor] = ?\n"
                + "      ,[director] = ?\n"
                + "      ,[release] = ?\n"
                + "      ,[linkmovie] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setDouble(2, m.getPrice());
            st.setString(3, m.getImage());
            st.setString(4, m.getDescribe());
            st.setString(5, m.getActor());
            st.setString(6, m.getDirector());
            st.setDate(7, m.getRelease());
            st.setString(8, m.getLinkmovie());
            st.setObject(9, m.getCid().getId());
            st.setInt(10, m.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int statisticMovie() {
        String sql = "select count(*) as Total_Movie from Movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int totalMovie = rs.getInt("Total_Movie");
                return totalMovie;
            }
        } catch (SQLException e) {
        }
        return 0;

    }

    public int statisticView() {
        String sql = "SELECT sum([view]) as totalView from Movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int totalMovie = rs.getInt("totalView");
                return totalMovie;
            }
        } catch (SQLException e) {
        }
        return 0;

    }

    public int[] statisticDirectorActor() {
        String sql = "SELECT\n"
                + "    COUNT(DISTINCT director) AS Total_Directors,\n"
                + "    COUNT(DISTINCT actor) AS Total_Actors\n"
                + "FROM\n"
                + "    Movie;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int totalDirector = rs.getInt("Total_Directors");
                int total_Actor = rs.getInt("Total_Actors");
                int[] total = new int[]{totalDirector, total_Actor};
                return total;
            }
        } catch (SQLException e) {
        }
        return null;

    }

    public Map<String, Integer> chart1() {
        Map<String, Integer> categoryCounts = new HashMap<>();
        String sql = "SELECT\n"
                + "    C.[name] AS CategoryName,\n"
                + "    COUNT(M.[ID]) AS MovieCount\n"
                + "FROM [dbo].[Category] AS C\n"
                + "LEFT JOIN [dbo].[Movie] AS M ON C.[id] = M.[cid]\n"
                + "GROUP BY C.[name]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("CategoryName");
                int countCategory = rs.getInt("MovieCount");
                categoryCounts.put(categoryName, countCategory);
            }
        } catch (SQLException e) {
        }
        return categoryCounts;
    }

    public Map<String, Integer> chart2() {
        Map<String, Integer> categoryCounts = new HashMap<>();
        String sql = "SELECT top 5 c.[name] AS CategoryName, SUM(m.[view]) AS TotalViews\n"
                + "FROM [dbo].[Category] c\n"
                + "JOIN [dbo].[Movie] m ON c.[id] = m.[cid]\n"
                + "GROUP BY c.[name]\n"
                + "ORDER BY TotalViews DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("CategoryName");
                int countCategory = rs.getInt("TotalViews");
                categoryCounts.put(categoryName, countCategory);
            }
        } catch (SQLException e) {
        }
        return categoryCounts;
    }

    public String getChartData() {
        Map<String, Integer> categoryCounts = chart1();
        StringBuilder dataAttribute = new StringBuilder();

        for (Integer count : categoryCounts.values()) {
            dataAttribute.append(count).append(",");
        }

        if (dataAttribute.length() > 0) {
            // Remove the trailing comma
            dataAttribute.deleteCharAt(dataAttribute.length() - 1);
        }

        return dataAttribute.toString();
    }

    public static void main(String[] args) {
        MovieDAO dal = new MovieDAO();
        List<Movie> m = dal.getRandomMovies(5);
        Map<String, Integer> d = dal.chart2();
        System.out.println(d);
        System.out.println(dal.statisticDirectorActor().length);
    }
}
