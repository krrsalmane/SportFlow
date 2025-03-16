package sportflow.Seance.DAO;

import sportflow.Seance.Model.Seance;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeanceDAO {
    private Connection connection;

    public SeanceDAO(Connection connection) {
        this.connection = connection;
    }

    // Create a new session
    public Seance create(Seance seance) {
        String sql = "INSERT INTO seances (id_membre, id_entraineur, date_heure) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setInt(1, seance.getMemberId());
            pstmt.setInt(2, seance.getEntraineurId());
            java.util.Date date = seance.getDateTime(); // Assuming getDateTime() returns Date
            pstmt.setTimestamp(3, new Timestamp(date.getTime()));

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating session failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    seance.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating session failed, no ID obtained.");
                }
            }
            return seance;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Validate if member exists
    public boolean memberExists(int idMembre) {
        String sql = "SELECT COUNT(*) FROM membres WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idMembre);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Validate if coach exists
    public boolean coachExists(int idEntraineur) {
        String sql = "SELECT COUNT(*) FROM entraineurs WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idEntraineur);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Add these methods to your SeanceDAO class

    public List<Seance> getAllSeances() {
        List<Seance> seances = new ArrayList<>();
        String sql = "SELECT * FROM seances ORDER BY date_heure";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Seance seance = new Seance();
                seance.setId(rs.getInt("id"));
                seance.setMemberId(rs.getInt("id_membre"));
                seance.setEntraineurId(rs.getInt("id_entraineur"));
                seance.setDateTime(rs.getTimestamp("date_heure"));
                seances.add(seance);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return seances;
    }

    public String getEntraineurName(int entraineurId) {
        String sql = "SELECT nom, prenom FROM entraineurs WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, entraineurId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("prenom") + " " + rs.getString("nom");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Unknown";
    }

    public Seance getSeanceById(int id) {
        String sql = "SELECT * FROM seances WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Seance seance = new Seance();
                    seance.setId(rs.getInt("id"));
                    seance.setMemberId(rs.getInt("id_membre"));
                    seance.setEntraineurId(rs.getInt("id_entraineur"));
                    seance.setDateTime(rs.getTimestamp("date_heure"));
                    return seance;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteSeance(int id) {
        String sql = "DELETE FROM seances WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}