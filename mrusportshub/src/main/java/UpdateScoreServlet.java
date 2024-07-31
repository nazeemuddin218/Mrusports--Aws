import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateScoreServlet")
public class UpdateScoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int matchId = 0;
        int team1Score = 0;
        int team2Score = 0;
        int team1Wickets = 0;
        int team2Wickets = 0;
        String team1Overs = null;
        String team2Overs = null;
        String sportType = null;

        String matchIdParam = request.getParameter("match_id");
        sportType = request.getParameter("sportstype");
        String team1ScoreParam = request.getParameter("team1_score_cricket");
        String team2ScoreParam = request.getParameter("team2_score_cricket");

        if (sportType != null && !sportType.equals("Cricket")) {
            team1ScoreParam = request.getParameter("team1_score_other");
            team2ScoreParam = request.getParameter("team2_score_other");
        }

        String team1WicketsParam = request.getParameter("team1_wickets_cricket");
        String team2WicketsParam = request.getParameter("team2_wickets_cricket");
        String team1OversParam = request.getParameter("team1_overs_cricket");
        String team2OversParam = request.getParameter("team2_overs_cricket");

        if (matchIdParam != null && !matchIdParam.isEmpty()) {
            matchId = Integer.parseInt(matchIdParam);
        }
        if (team1ScoreParam != null && !team1ScoreParam.isEmpty()) {
            team1Score = Integer.parseInt(team1ScoreParam);
        }
        if (team2ScoreParam != null && !team2ScoreParam.isEmpty()) {
            team2Score = Integer.parseInt(team2ScoreParam);
        }

        String url = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "mysql";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql;

            if ("Cricket".equalsIgnoreCase(sportType)) {
                if (team1WicketsParam != null && !team1WicketsParam.isEmpty()) {
                    team1Wickets = Integer.parseInt(team1WicketsParam);
                }
                if (team2WicketsParam != null && !team2WicketsParam.isEmpty()) {
                    team2Wickets = Integer.parseInt(team2WicketsParam);
                }
                if (team1OversParam != null && !team1OversParam.isEmpty()) {
                    team1Overs = team1OversParam;
                }
                if (team2OversParam != null && !team2OversParam.isEmpty()) {
                    team2Overs = team2OversParam;
                }

                sql = "INSERT INTO livescore (match_id, team1_score, team1_wickets, team1_overs, team2_score, team2_wickets, team2_overs)" 
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)"
                        + "ON DUPLICATE KEY UPDATE team1_score = VALUES(team1_score), team1_wickets = VALUES(team1_wickets), team1_overs = VALUES(team1_overs), "
                        + "team2_score = VALUES(team2_score), team2_wickets = VALUES(team2_wickets), team2_overs = VALUES(team2_overs)";
            } else {
                sql = "INSERT INTO other_sports_scores (match_id, team1_score, team2_score)"
                        + "VALUES (?, ?, ?)"
                        + "ON DUPLICATE KEY UPDATE team1_score = VALUES(team1_score), team2_score = VALUES(team2_score)";
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, matchId);
                ps.setInt(2, team1Score);
                if ("Cricket".equalsIgnoreCase(sportType)) {
                    ps.setInt(3, team1Wickets);
                    ps.setString(4, team1Overs);
                    ps.setInt(5, team2Score);
                    ps.setInt(6, team2Wickets);
                    ps.setString(7, team2Overs);
                } else {
                    ps.setInt(3, team2Score);
                }

                ps.executeUpdate();
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("live-score.jsp");
    }
}
