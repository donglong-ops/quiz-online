package vanlt.dtos;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author AVITA
 */
public class QuestionDto {

    private int id;
    private String content;
    private List<String> option;
    private String answer;
    private Date created;
    private int subjectId;

    public QuestionDto() {
    }

    public QuestionDto(int id, String content, String answer, Date created, int subjectId) {
        this.id = id;
        this.content = content;
        this.answer = answer;
        this.created = created;
        option = new ArrayList<>();
        this.subjectId = subjectId;
    }

    public QuestionDto(int id, String content, String answer) {
        this.id = id;
        this.content = content;
        option = new ArrayList<>();
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<String> getOption() {
        return option;
    }

    public void addOption(String newOption) {
        this.option.add(newOption);
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

}
