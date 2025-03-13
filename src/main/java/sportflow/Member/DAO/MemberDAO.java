package sportflow.Member.DAO;
import java.sql.*;
import sportflow.Member.Model.Member;

public class MemberDAO {
    private Connection connection;

    public MemberDAO(Connection connection) {
        this.connection = connection;
    }

    public int create(Member member) {
        String sql = "INSERT INTO membres (nom,date_naissance,sport_pratique, email, password) VALUES (?, ?, ?, ?,?)";
        int affectedRows = 0;
        try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, member.getName());
            pstmt.setDate(2, member.getDateOfBirth());
            pstmt.setString(3, member.getSportPracticed());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getPassword());

            affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating member failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    member.setId(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating member failed, no ID obtained.");
                }
            }
            return affectedRows;
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return affectedRows;
    }
    public Member login(String email, String password) {
        String sql = "SELECT * FROM membres WHERE email = ? AND password = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Member member = new Member();
                    member.setId(rs.getInt("id"));
                    member.setName(rs.getString("nom"));
                    member.setDateOfBirth(rs.getDate("date_naissance"));
                    member.setSportPracticed(rs.getString("sport_pratique"));
                    member.setEmail(rs.getString("email"));
                    // Don't set the password in the returned object for security reasons
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
}}