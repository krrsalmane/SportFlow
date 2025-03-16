package sportflow.Member.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sportflow.Member.DAO.MemberDAO;
import sportflow.Member.DAO.MemberDAO;
import sportflow.Member.Model.Member;
import sportflow.UtilDataBase.DBconnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/listMembers")
public class ListMembersServlet extends HttpServlet {
    private MemberDAO membreDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            membreDAO = new MemberDAO(connection);
        } catch (Exception e) {
            throw new ServletException("Database connection failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int memberId = Integer.parseInt(request.getParameter("id"));
            boolean deleted = membreDAO.deleteMember(memberId);
            if (deleted) {
                request.setAttribute("message", "Member deleted successfully!");
            } else {
                request.setAttribute("error", "Failed to delete member.");
            }
        }

        List<Member> members = membreDAO.getAllMembers();
        request.setAttribute("members", members);
        request.getRequestDispatcher("listMembers.jsp").forward(request, response);
    }
}
