package vanlt.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import javax.naming.NamingException;
import vanlt.conn.MyConnection;
import vanlt.dtos.QuestionDto;
import vanlt.dtos.QuizHistoryDto;

/**
 *
 * @author AVITA
 */
public class QuestionDAO {

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

    private SimpleDateFormat formatter;

    public QuestionDAO() {
        formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    }

    public QuestionDAO(Connection conn, SimpleDateFormat formatter) {
        this.conn = conn;
        this.formatter = formatter;
    }

    public List<QuestionDto> getQuestions() throws Exception {
        List<QuestionDto> questions = null;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("Select * from Question where status ='Active' ");
            rs = preStm.executeQuery();

            questions = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getNString("content");
                String opt1 = rs.getNString("opt1");               
                String opt2 = rs.getNString("opt2");
                String opt3 = rs.getNString("opt3");
                String opt4 = rs.getNString("opt4");
                String ans = rs.getNString("answer");
                Date date = rs.getDate("created");
                int subId = rs.getInt("subjectId");
                QuestionDto q = new QuestionDto(id, content, opt1, opt2, opt3, opt4, ans, date, subId);

                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return questions;
    }

    public List<QuestionDto> getQuestions(int subjectId) throws Exception {
        List<QuestionDto> questions = null;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("Select * from Question where status ='Active' and subjectId = ? ");
            preStm.setInt(1, subjectId);
            rs = preStm.executeQuery();
            questions = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getNString("content");
                String opt1 = rs.getNString("opt1");               
                String opt2 = rs.getNString("opt2");
                String opt3 = rs.getNString("opt3");
                String opt4 = rs.getNString("opt4");
                String ans = rs.getNString("answer");
                Date date = rs.getDate("created");
                QuestionDto q = new QuestionDto(id, content, opt1, opt2, opt3, opt4, ans, date, subjectId);

                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return questions;
    }

    public List<QuestionDto> getQuestionsInRange(int pageNumber, int subjectId, String questionName) throws Exception {
        List<QuestionDto> questions = new ArrayList<>();
        int pageSize = 6;
        int count = 1;
        try {
            conn = MyConnection.getMyConnection();
            String query = "SELECT  q.id , q.content , q.answer , q.opt1 ,q.opt2, q.opt3, q.opt4, q.created , q.subjectId "
                    + "From Question q where q.status ='Active' ";
            if (subjectId != 0) {
                query += "and q.subjectId = ? ";
            }
            if (questionName != null) {
                query += "and q.content like ? ";
            }
            query += "ORDER BY q.id "
                    + "OFFSET ? ROWS "
                    + "FETCH NEXT ? ROWS ONLY";
            preStm = conn.prepareStatement(query);

            if (subjectId != 0) {
                preStm.setInt(count, subjectId);
                count++;
            }
            if (questionName != null) {
                preStm.setString(count, "%" + questionName + "%");
                count++;
            }
            preStm.setInt(count, pageSize * (pageNumber - 1));
            preStm.setInt(count + 1, pageSize);
            rs = preStm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getNString("content");
                String opt1 = rs.getNString("opt1");               
                String opt2 = rs.getNString("opt2");
                String opt3 = rs.getNString("opt3");
                String opt4 = rs.getNString("opt4");
                String ans = rs.getNString("answer");
                Date date = rs.getDate("created");
                QuestionDto q = new QuestionDto(id, content, opt1, opt2, opt3, opt4, ans, date, subjectId);
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return questions;
    }

    public int countTotalQuestion(int subjectId, String questionName) throws Exception {
        int returnValue = 0;
        int count = 1;
        try {
            conn = MyConnection.getMyConnection();
            String query = "SELECT  Count(q.id) as SizeQuestion "
                    + "From Question q where q.status ='Active' ";
            if (subjectId != 0) {
                query += " and q.subjectId = ? ";
            }
            if (questionName != null) {
                query += " and q.content like ? ";
            }
            preStm = conn.prepareStatement(query);
            if (subjectId != 0) {
                preStm.setInt(count, subjectId);
                count++;
            }
            if (questionName != null) {
                preStm.setString(count, "%" + questionName + "%");
                count++;
            }
            rs = preStm.executeQuery();
            if (rs.next()) {
                returnValue = rs.getInt("SizeQuestion");
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return returnValue;
    }

    public void addQuestion(QuestionDto q) throws Exception {
        try {
            conn = MyConnection.getMyConnection();
            String query = "insert into Question (content, opt1, opt2, opt3, opt4, created,  answer, status, subjectId) values(?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(query);
            preStm.setString(1, q.getContent());
            preStm.setString(2, q.getOption1());
            preStm.setString(3, q.getOption2());
            preStm.setString(4, q.getOption3());
            preStm.setString(5, q.getOption4());
            preStm.setDate(6, q.getCreated());
            preStm.setString(7, q.getAnswer());
            preStm.setString(8, "Active");
            preStm.setInt(9, q.getSubjectId());
            preStm.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
    }
    public boolean updateQuestion(QuestionDto q) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String query = "update Question  set content = ?, opt1 = ? , opt2 =? , opt3 = ?, opt4 =?,"
                    + " answer =? where id = ?";
            preStm = conn.prepareStatement(query);
            preStm.setString(1, q.getContent());
            preStm.setString(2, q.getOption1());
            preStm.setString(3, q.getOption2());
            preStm.setString(4, q.getOption3());
            preStm.setString(5, q.getOption4());
            preStm.setString(6, q.getAnswer());
            preStm.setInt(7, q.getId());
            result = preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return result;
    }

    public void deleteQueston(int id) throws Exception {
        try {
            conn = MyConnection.getMyConnection();
            String query = "Update Question set status = ? where id = ?";
            preStm = conn.prepareStatement(query);
            preStm.setString(1, "Deactive");
            preStm.setInt(2, id);
            preStm.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
    }

    public QuestionDto findQuestionById(int id) throws Exception {
        QuestionDto dto = null;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("SELECT * FROM Question WHERE id=?");
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                //int quesId = rs.getInt("id");
                String content = rs.getNString("content");               
                String opt1 = rs.getNString("opt1");               
                String opt2 = rs.getNString("opt2");
                String opt3 = rs.getNString("opt3");
                String opt4 = rs.getNString("opt4");
                String ans = rs.getNString("answer");
    
                dto = new QuestionDto(id, content, opt1, opt2, opt3, opt4, ans);             
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return dto;
    }

    public int getQuestionSize() throws Exception {
        int size = 0;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement("SELECT COUNT(id) as SizeQuestion FROM Question where status = 'Active'");
            rs = preStm.executeQuery();
            if (rs.next()) {
                size = rs.getInt("SizeQuestion");
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeConnection();
        }
        return size;
    }

}
