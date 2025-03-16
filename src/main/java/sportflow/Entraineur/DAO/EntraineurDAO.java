package sportflow.Entraineur.DAO;
import sportflow.Entraineur.Model.Entraineur;
import java.sql.*;

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
                throw new SQLException("Creating entraineur failed, no rows affected.");
            }
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    entraineur.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating entraineur failed, no ID obtained.");
                }
            }
            return entraineur;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public Entraineur login(String email, String password) {
        String sql = "SELECT * FROM entraineurs WHERE email = ? AND password = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Entraineur entraineur = new Entraineur();
                    entraineur.setId(rs.getInt("id"));
                    entraineur.setName(rs.getString("nom")); // Fixed column name to match SQL
                    entraineur.setEmail(rs.getString("email"));
                    entraineur.setSpecialty(rs.getString("specialite")); // Fixed column name
                    return entraineur;
                }
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}