package sportflow.Entraineur.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sportflow.Entraineur.DAO.EntraineurDAO;
import sportflow.Entraineur.Model.Entraineur;
import sportflow.UtilDataBase.DBconnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/entraineur")
public class EntraineurServlet extends HttpServlet {
    private EntraineurDAO entraineurDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            entraineurDAO = new EntraineurDAO(connection);
        } catch (SQLException e) {
            throw new ServletException("Cannot connect to database", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().write("List of entraineurs will be here");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String specialty = request.getParameter("specialty");

        Entraineur entraineur = new Entraineur();
        entraineur.setName(name);
        entraineur.setEmail(email);
        entraineur.setPassword(password);
        entraineur.setSpecialty(specialty);

        Entraineur createdEntraineur = entraineurDAO.create(entraineur);
        if (createdEntraineur != null) {
            response.getWriter().write("Entraineur created with ID: " + createdEntraineur.getId());
        } else {
            response.getWriter().write("Failed to create entraineur");
        }
    }
}