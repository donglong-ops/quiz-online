package vanlt.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vanlt.conn.MyConnection;
import vanlt.dtos.QuizHistoryDto;

/**
 *
 * @author AVITA
 */
public class QuizHistoryDAO {

    public QuizHistoryDAO() {
        
    }
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

    public void addEntry(int id, int numOfQuiz, int correctAnswer, Date dateQuiz) throws Exception {
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("insert into QuizHistory (studentId, numOfQuiz, correctAnswer, dateQuiz) values (?,?,?,?)");
            preStm.setInt(1, id);
            preStm.setInt(2, numOfQuiz);
            preStm.setInt(3, correctAnswer);
            preStm.setDate(4, dateQuiz);
            preStm.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
    }

    public List<QuizHistoryDto> getAllEntry() throws Exception {
        List<QuizHistoryDto> history = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("Select QuizHistory.*, Users.username from QuizHistory inner join Users on QuizHistory.studentId = Users.id");
            rs = preStm.executeQuery();
            while (rs.next()) {
                history.add(new QuizHistoryDto(rs.getInt("id"), rs.getString("username"), rs.getInt("numOfQuiz"), rs.getInt("correctAnswer"), rs.getDate("dateQuiz")));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return history;
    }
    public List<QuizHistoryDto> getHisById(int userID) throws Exception {
        List<QuizHistoryDto> history = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("Select QuizHistory.*, Users.username from QuizHistory inner join Users on QuizHistory.studentId = Users.id where QuizHistory.studentId = ?");
            preStm.setInt(1, userID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                history.add(new QuizHistoryDto(rs.getInt("id"), rs.getString("username"), rs.getInt("numOfQuiz"), rs.getInt("correctAnswer"),rs.getDate("dateQuiz")));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return history;
    }
}
