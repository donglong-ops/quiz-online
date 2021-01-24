package vanlt.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vanlt.conn.MyConnection;
import vanlt.dtos.UserDto;

/**
 *
 * @author AVITA
 */
public class UserDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public UserDAO() {

    }

    public UserDto checkLogin(String userName, String password) throws Exception {
        UserDto returnValue = null;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("select * from Users where email = ? and password= ?");
            preStm.setString(1, userName);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            while (rs.next()) {
                returnValue = new UserDto(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getInt("type"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return returnValue;
    }

    public int validateNewUser(String email) throws Exception {
        int returnValue = 0;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareCall("select * from Users where email =?  ");
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            while (rs.next()) {
                returnValue = -1;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return returnValue;
    }

    public boolean addUser(UserDto newUser) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String query = "Insert into Users (username , password, email, type) values(?,?,?,?)";
            preStm = conn.prepareStatement(query);
            preStm.setString(1, newUser.getUserName());
            preStm.setString(2, newUser.getPassword());
            preStm.setString(3, newUser.getEmail());
            preStm.setInt(4, newUser.getType());
            result = preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return result;
    }
}
