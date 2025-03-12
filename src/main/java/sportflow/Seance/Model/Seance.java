package sportflow.Seance.Model;
import java.util.Date;

public class Seance{
    private int id;
    private int memberId;
    private int EntraineurId;
    private Date dateTime;
    private String description;


    public Seance(int id, int memberId, int entraineurId, Date dateTime, String description) {
        this.id = id;
        this.memberId = memberId;
        EntraineurId = entraineurId;
        this.dateTime = dateTime;
        this.description = description;
    }

    public Seance() {
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getEntraineurId() {
        return EntraineurId;
    }

    public void setEntraineurId(int entraineurId) {
        EntraineurId = entraineurId;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}