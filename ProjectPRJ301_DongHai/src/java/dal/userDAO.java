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
import model.User;

/**
 *
 * @author nguye
 */
public class userDAO extends DBContext {

    //check tai khoan dang nhap 
    public User checkAccount(String user, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phonenum]\n"
                + "      ,[avatar]\n"
                + "      ,[role]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[User]\n"
                + "  where name = ? and password =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                User u = new User(rs.getInt("id"),
                        user,
                        rs.getString("fullname"), rs.getString("email"),
                        rs.getString("phonenum"),
                        rs.getString("avatar"),
                        rs.getInt("role"),
                        password);
//            
                return u;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //dang ki
    public void signUp(User a) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[password])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUser());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean existedUs(String username) {
        String sql = "SELECT [name]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phonenum]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[User] where name=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }
// lay user

    public List<User> getAll() {
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
                c.setUser(rs.getString("name"));
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
//change password

    public void change(User a) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE [name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getUser());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //change Profile
    public void changePro(User a) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phonenum] = ?\n"
                + "      ,[avatar] = ?\n"
                + " WHERE [name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, a.getFullname());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPhonenum());
            st.setString(4, a.getAvatar());
            st.setString(5, a.getUser());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserbyName(String name) {
        String sql = "SELECT \n"
                + "      [name]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phonenum]\n"
                + "      ,[avatar]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[User]\n"
                + "  where name = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUser(rs.getString("name"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPhonenum(rs.getString("phonenum"));
                user.setAvatar(rs.getString("avatar"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
        }
        return null;

    }

    public List<User> getListByPage(List<User> list,
            int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void deleteAccount(String name) {
        String sql = "	DELETE FROM [dbo].[User]\n"
                + "		  WHERE [name]= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int statisticUser() {
        String sql = "select count(*) as Total_User from [User] where role =2 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int toatlUser = rs.getInt("Total_User");
                return toatlUser;
            }
        } catch (SQLException e) {
        }
        return 0;

    }

    public static void main(String[] args) {
        userDAO dal = new userDAO();
        User u = new User("sss", "sdasdasd@gmail.com", "123");
        dal.signUp(u);
    }
}
