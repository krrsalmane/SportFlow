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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/createSeance")
public class SeanceServlet extends HttpServlet {
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
        // Display the form
        request.getRequestDispatcher("createSeance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form data
            int memberId = Integer.parseInt(request.getParameter("idMembre"));
            int entraineurId = Integer.parseInt(request.getParameter("idEntraineur"));
            String dateTimeString = request.getParameter("dateHeure");

            // Parse the date (assuming format is yyyy-MM-dd HH:mm)
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date dateTime = dateFormat.parse(dateTimeString);

            // Check if member and entraineur exist
            if (!seanceDAO.memberExists(memberId)) {
                request.setAttribute("error", "Member does not exist");
                request.getRequestDispatcher("createSeance.jsp").forward(request, response);
                return;
            }

            if (!seanceDAO.coachExists(entraineurId)) {
                request.setAttribute("error", "Coach does not exist");
                request.getRequestDispatcher("createSeance.jsp").forward(request, response);
                return;
            }

            // Create Seance object
            Seance seance = new Seance();
            seance.setMemberId(memberId);
            seance.setEntraineurId(entraineurId);
            seance.setDateTime(dateTime);

            // Save to database
            Seance createdSeance = seanceDAO.create(seance);

            if (createdSeance != null) {
                request.setAttribute("message", "Session created successfully!");
                request.setAttribute("seance", createdSeance);
            } else {
                request.setAttribute("error", "Failed to create session");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid member or coach ID");
        } catch (ParseException e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy-MM-dd HH:mm");
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            e.printStackTrace();
        }

        // Forward back to the form
        request.getRequestDispatcher("createSeance.jsp").forward(request, response);
    }
}