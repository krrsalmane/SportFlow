package sportflow.Member.Model;
import sportflow.User.Model.User;
import java.util.Date;



public class Member extends User {
    private Date dateOfBirth;
    private String sportPracticed;

    public Member() {
        super();
    }

    public Member(int id, String name, String email, String password, Date dateOfBirth, String sportPracticed) {
        super(id, name, email, password);
        this.dateOfBirth = dateOfBirth;
        this.sportPracticed = sportPracticed;
    }

    public java.sql.Date getDateOfBirth() {
        return (java.sql.Date) dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSportPracticed() {
        return sportPracticed;
    }

    public void setSportPracticed(String sportPracticed) {
        this.sportPracticed = sportPracticed;
    }
}