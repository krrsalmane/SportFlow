package sportflow.Entraineur.DAO;
import java.sql.*;
import sportflow.Entraineur.Model.Entraineur;

public class EntraineurDAO {
    private Connection connection;

    public EntraineurDAO(Connection connection) {
        this.connection = connection;
    }

    public Entraineur create(Entraineur entraineur) {
        String sql = "INSERT INTO entraineurs (nom, email, password, specialite) VALUES (?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, entraineur.getName());
            pstmt.setString(2, entraineur.getEmail());
            pstmt.setString(3, entraineur.getPassword());
            pstmt.setString(4, entraineur.getSpecialty());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating employee failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    entraineur.setId(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating entraineur failed, no ID obtained.");
                }
            }
            return entraineur;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}