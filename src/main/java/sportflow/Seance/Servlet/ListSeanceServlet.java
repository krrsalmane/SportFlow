package sportflow.Seance.Servlet;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sportflow.Seance.DAO.SeanceDAO;
import sportflow.Seance.Model.Seance;
import sportflow.UtilDataBase.DBconnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/listSeances")
public class ListSeanceServlet extends HttpServlet {
    private SeanceDAO seanceDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DBconnection.getConnection();
            seanceDAO = new SeanceDAO(connection);
        } catch (Exception e) {
            throw new ServletException("Database connection failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if there's a delete action
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int seanceId = Integer.parseInt(request.getParameter("id"));
            boolean deleted = seanceDAO.deleteSeance(seanceId);
            if (deleted) {
                request.setAttribute("message", "Session deleted successfully!");
            } else {
                request.setAttribute("error", "Failed to delete session");
            }
        }

        // Get all seances
        List<Seance> seances = seanceDAO.getAllSeances();
        request.setAttribute("seances", seances);
        request.setAttribute("seanceDAO", seanceDAO); // To access getEntraineurName in JSP

        request.getRequestDispatcher("listSeances.jsp").forward(request, response);
    }
}
