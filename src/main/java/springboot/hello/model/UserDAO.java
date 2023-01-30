package springboot.hello.model;

import springboot.hello.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
            String dbURL = "jdbc:mariadb://localhost:3306/ajax";
            String dbID = "root";
            String dbPassword = "0000";
            Class.forName("com.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<User> search(String userName) {
        String SQL = "SELECT * FROM USER WHERE name Like ?";
        ArrayList<User> userList = new ArrayList<User>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%"+userName+"%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setName(rs.getString(1));
                user.setAge(rs.getInt(2));
                user.setGender(rs.getString(3));
                user.setAddress(rs.getString(4));
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

    public int register(User user) {
        String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getName());
            pstmt.setInt(2, user.getAge());
            pstmt.setString(3, user.getGender());
            pstmt.setString(4, user.getAddress());
            return pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
