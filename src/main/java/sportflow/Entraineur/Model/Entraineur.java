package sportflow.Entraineur.Model;
import sportflow.User.Model.User;





public class Entraineur extends User {
    private String specialty;

    public Entraineur() {
        super();
    }

    public Entraineur(int id, String name, String email, String password, String specialty) {
        super(id, name, email, password);
        this.specialty = specialty;
    }
    public Entraineur( String name, String email, String password, String specialty) {
        this.specialty = specialty;
    }


    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }
}