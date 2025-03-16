package sportflow.Member.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sportflow.Entraineur.DAO.EntraineurDAO;
import sportflow.Entraineur.Model.Entraineur;
import sportflow.Member.DAO.MemberDAO;
import sportflow.Member.Model.Member;
import sportflow.UtilDataBase.DBconnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberDAO memberDAO;
    private EntraineurDAO entraineurDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            memberDAO = new MemberDAO(connection);
            entraineurDAO = new EntraineurDAO(connection);
        } catch (SQLException e) {
            throw new ServletException("Cannot connect to database", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email et mot de passe obligatoires !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Check for admin login


        // Based on the selected role, try to authenticate
        if (role == null || role.isEmpty() || "member".equals(role)) {
            // Try member login first
            Member member = memberDAO.login(email, password);
            if (member != null) {
                session.setAttribute("member", member);
                session.setAttribute("memberId", member.getId());
                session.setAttribute("memberName", member.getName());
                session.setAttribute("role", "member");
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("successMessage", "Login successful! Welcome, " + member.getName());
                response.sendRedirect("dashboard.jsp");
                return;
            }
        }

        if (role == null || role.isEmpty() || "entraineur".equals(role)) {
            // Try entraineur login if member login failed or if role is entraineur
            Entraineur entraineur = entraineurDAO.login(email, password);
            if (entraineur != null) {
                session.setAttribute("entraineur", entraineur);
                session.setAttribute("entraineurId", entraineur.getId());
                session.setAttribute("entraineurName", entraineur.getName());
                session.setAttribute("role", "entraineur");
                session.setAttribute("isLoggedIn", true);
                response.sendRedirect("dashboard2.jsp");
                return;
            }
        }

        // If we reach here, authentication failed
        request.setAttribute("errorMessage", "Email ou mot de passe incorrect !");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}