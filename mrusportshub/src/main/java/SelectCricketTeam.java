import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CricketTeamServlet")
public class SelectCricketTeam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/select-cricket-team.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String matchIdString = request.getParameter("match_id");

        if (matchIdString != null && !matchIdString.isEmpty()) {
            int matchId = Integer.parseInt(matchIdString);

            if ("submitTeams".equals(action)) {
                String yourTeamName = request.getParameter("yourTeamName");
                String oppositeTeamName = request.getParameter("oppositeTeamName");

                String[] yourTeamPlayerNames = request.getParameterValues("yourTeamPlayerName[]");
                String[] yourTeamPlayerTypes = request.getParameterValues("yourTeamPlayerType[]");
                String[] yourTeamBowlingTypes = request.getParameterValues("yourTeamBowlingType[]");

                String[] oppositeTeamPlayerNames = request.getParameterValues("oppositeTeamPlayerName[]");
                String[] oppositeTeamPlayerTypes = request.getParameterValues("oppositeTeamPlayerType[]");
                String[] oppositeTeamBowlingTypes = request.getParameterValues("oppositeTeamBowlingType[]");

                if (isValidPlayerData(yourTeamPlayerNames, yourTeamPlayerTypes, yourTeamBowlingTypes)) {
                    for (int i = 0; i < yourTeamPlayerNames.length; i++) {
                        insertPlayer(yourTeamName, yourTeamPlayerNames[i], yourTeamPlayerTypes[i], yourTeamBowlingTypes[i], "Your Team", matchId);
                    }
                }

                if (isValidPlayerData(oppositeTeamPlayerNames, oppositeTeamPlayerTypes, oppositeTeamBowlingTypes)) {
                    for (int i = 0; i < oppositeTeamPlayerNames.length; i++) {
                        insertPlayer(oppositeTeamName, oppositeTeamPlayerNames[i], oppositeTeamPlayerTypes[i], oppositeTeamBowlingTypes[i], "Opposite Team", matchId);
                    }
                }

                request.setAttribute("message", "Teams have been successfully submitted.");
                request.getRequestDispatcher("/select-cricket-team.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Invalid match ID.");
            request.getRequestDispatcher("/select-cricket-team.jsp").forward(request, response);
        }
    }

    private boolean isValidPlayerData(String[] names, String[] types, String[] bowlingTypes) {
        return names != null && types != null && bowlingTypes != null
                && names.length == types.length && names.length == bowlingTypes.length;
    }

    private void insertPlayer(String teamName, String playerName, String playerType, String bowlingType, String teamCategory, int matchId) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO selectedcricketteam (team_name, player_name, player_type, bowling_type, team_type, match_id) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, teamName);
            stmt.setString(2, playerName);
            stmt.setString(3, playerType);
            stmt.setString(4, bowlingType);
            stmt.setString(5, teamCategory);
            stmt.setInt(6, matchId);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Player inserted successfully.");
            } else {
                System.out.println("Failed to insert player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
