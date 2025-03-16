package sportflow.Member.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sportflow.Member.DAO.MemberDAO;
import sportflow.Member.Model.Member;
import sportflow.UtilDataBase.DBconnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/member")
public class registerServlet extends HttpServlet {
    private MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            memberDAO = new MemberDAO(connection);
        } catch (SQLException e) {
            throw new ServletException("Cannot connect to database", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().write("List of members will be here");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String dateOfBirth = request.getParameter("dateOfBirth"); // Expecting YYYY-MM-DD format
            String sportPracticed = request.getParameter("sportPracticed");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Date sqlDateOfBirth = Date.valueOf(dateOfBirth);

            Member member = new Member();
            member.setName(name);
            member.setDateOfBirth(sqlDateOfBirth);
            member.setSportPracticed(sportPracticed);
            member.setEmail(email);
            member.setPassword(password);

            int createdMember = memberDAO.create(member);


            if (createdMember != 0) {
                response.getWriter().write("Member created with ID: " + member.getId());
            } else {
                response.getWriter().write("Failed to create member");
            }
        } catch (IllegalArgumentException e) {
            response.getWriter().write("Invalid date format. Use YYYY-MM-DD");
        }
    }
}
