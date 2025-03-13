package sportflow.Member.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sportflow.Member.Model.Member;
import sportflow.Member.DAO.MemberDAO;
import sportflow.UtilDataBase.DBconnection;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            memberDAO = new MemberDAO(connection);
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize MemberDAO", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = request.getParameter("rememberMe") != null;

        // Basic validation
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email and password cannot be empty");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Attempt to login
        Member member = memberDAO.login(email, password);

        if (member != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("member", member);
            session.setAttribute("memberId", member.getId());
            session.setAttribute("memberName", member.getName());
            session.setAttribute("isLoggedIn", true);
            // Add success message
            session.setAttribute("successMessage", "Login successful! Welcome, " + member.getName());

            // Redirect to dashboard (adjust URL as needed)
            response.sendRedirect("dashboard.jsp");
        } else {

            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}