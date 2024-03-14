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
import model.Movie;
import model.User;
import model.WishList;
import java.sql.Date;
import model.Order;
import model.Vn_Pay;

/**
 *
 * @author nguye
 */
public class WishListDAO extends DBContext {

    public List<WishList> getALL(User userID) {
        List<WishList> list = new ArrayList<>();
        String sql = "SELECT w.[id],w.[u_id],w.[wishlistDate],wi.movieId FROM [dbo].[WishList] as w inner join WishListItem  as wi on wi.w_id = w.id where w.u_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                WishList w = new WishList();
                w.setId(rs.getInt(1));
                w.setUs_id(userID);
                MovieDAO mal = new MovieDAO();
                Movie m = mal.getMoviebyId(rs.getInt(4));
                w.setMovie(m);
                w.setWishlistDate(rs.getDate(3));
                list.add(w);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> getOrder(int userID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [movie_id]\n"
                + "      ,[userID]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  where userID = " + userID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Order o = new Order(null, new User(rs.getInt(2), null));
                MovieDAO mal = new MovieDAO();
                Movie m = mal.getMoviebyId(rs.getInt(1));
                o.setMovieID(m);
                list.add(o);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insertWishList(int u_id, int m_id) {
        Date d = new Date(new java.util.Date().getTime());
        String sql = "INSERT INTO [dbo].[WishList]\n"
                + "           ([u_id]\n"
                + "           ,[wishlistDate])\n"
                + "     VALUES\n"
                + "           (?,?)";
        String sql1 = "INSERT INTO [dbo].[WishListItem]\n"
                + "           \n"
                + "           ([movieId]\n"
                + "           ,[w_id])\n"
                + "     VALUES\n"
                + "           (?,(select top 1 id from WishList order by id desc))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u_id);
            st.setDate(2, d);
            st.executeUpdate();
            st = connection.prepareStatement(sql1);
            st.setInt(1, m_id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteWishList(int w_id) {

        String sql = "DELETE FROM [dbo].[WishList]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, w_id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
        try {
            String sql_1 = "DELETE FROM [dbo].[WishListItem]\n"
                    + "      WHERE w_id = ?";
            PreparedStatement st1 = connection.prepareStatement(sql_1);
            st1.setInt(1, w_id);
            st1.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Order Ordesr(int userID, String movieID) {
        String sql = "select * from Orders where [movie_id]= " + movieID + " and [userID] = " + userID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(new Movie(rs.getInt(1)), new User(rs.getInt(2), null));
                return o;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insertPayment(int movieID, int userID) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([movie_id]\n"
                + "           ,[userID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, movieID);
            st.setInt(2, userID);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void inserVN_PAY(String trans, int user_ID, String movieID) {
        String sql = "INSERT INTO [dbo].[Vn_Pay]\n"
                + "           ([userID]\n"
                + "           ,[movieID]\n"
                + "           ,[Vn_gd])\n"
                + "     VALUES\n"
                + "           (" + user_ID + "," + movieID + "," + "?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, trans);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Vn_Pay getVN_Pay(String magd) {
        String sql = "select * from Vn_Pay where Vn_gd = '" + magd + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Vn_Pay v = new Vn_Pay(rs.getInt(1), rs.getInt(2), rs.getString(3));
                return v;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteTransantion(String gd) {

    }

    public static void main(String[] args) {
        WishListDAO dal = new WishListDAO();
        List<Order> o = dal.getOrder(2019);
        System.out.println(o.size());
    }
}
