package vanlt.dtos;

import java.io.Serializable;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author AVITA
 */
public class QuizHistoryDto implements Serializable{

    private int id;
    private String studentName;
    private int numOfQuiz;
    private int correctAnswer;
    private Date dateQuiz;

    public QuizHistoryDto(int id, String studentName, int numOfQuiz, int correctAnswer) {
        this.id = id;
        this.studentName = studentName;
        this.numOfQuiz = numOfQuiz;
        this.correctAnswer = correctAnswer;
    }

    public QuizHistoryDto(int id, String studentName, int numOfQuiz, int correctAnswer, Date dateQuiz) {
        this.id = id;
        this.studentName = studentName;
        this.numOfQuiz = numOfQuiz;
        this.correctAnswer = correctAnswer;
        this.dateQuiz = dateQuiz;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getNumOfQuiz() {
        return numOfQuiz;
    }

    public void setNumOfQuiz(int numOfQuiz) {
        this.numOfQuiz = numOfQuiz;
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Date getDateQuiz() {
        return dateQuiz;
    }

    public void setDateQuiz(Date dateQuiz) {
        this.dateQuiz = dateQuiz;
    }
    

    public double getMark(int correctAnswer, int numOfQuiz) {
        double mark = (double) correctAnswer / (double) numOfQuiz;
        mark *= 10;
        NumberFormat formatter = new DecimalFormat("#0.00");
        return Double.parseDouble(formatter.format(mark));
    }
    
    public String getStatusQuiz(double mark){
        String status;
        if(mark >= 4){
            status = "Passed";
        }else{
            status = "Failed";
        }
        return status;
    }
}
