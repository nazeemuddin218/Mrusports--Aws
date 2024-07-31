import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/hockeyteamupdate")
@MultipartConfig
public class HockeyTeamUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerIdStr = request.getParameter("playerId");
        String playerName = request.getParameter("playerName");
        String playerType = request.getParameter("playerPosition");
        String totalPointsStr = request.getParameter("totalPoints");
        String goalsStr = request.getParameter("goals");
        String assistsStr = request.getParameter("assists");
        String penaltyMinutesStr = request.getParameter("penaltyMinutes");
        Part filePart = request.getPart("playerImage");

        if (playerIdStr != null && !playerIdStr.trim().isEmpty()) {
            int playerId;
            try {
                playerId = Integer.parseInt(playerIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Player ID.");
                return;
            }

            Connection con = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");

                StringBuilder sql = new StringBuilder("UPDATE hockeyteam SET");
                if (playerName != null && !playerName.trim().isEmpty()) {
                    sql.append(" playerName = ?,");
                }
                if (playerType != null && !playerType.trim().isEmpty()) {
                    sql.append(" playerPosition = ?,");
                }
                if (totalPointsStr != null && !totalPointsStr.trim().isEmpty()) {
                    sql.append(" totalPoints = ?,");
                }
                if (goalsStr != null && !goalsStr.trim().isEmpty()) {
                    sql.append(" goals = ?,");
                }
                if (assistsStr != null && !assistsStr.trim().isEmpty()) {
                    sql.append(" assists = ?,");
                }
                if (penaltyMinutesStr != null && !penaltyMinutesStr.trim().isEmpty()) {
                    sql.append(" penaltyMinutes = ?,");
                }
                if (filePart != null && filePart.getSize() > 0) {
                    sql.append(" image = ?,");
                }
                sql.deleteCharAt(sql.length() - 1); // Remove last comma
                sql.append(" WHERE id = ?");

                pstmt = con.prepareStatement(sql.toString());
                int parameterIndex = 1;
                if (playerName != null && !playerName.trim().isEmpty()) {
                    pstmt.setString(parameterIndex++, playerName);
                }
                if (playerType != null && !playerType.trim().isEmpty()) {
                    pstmt.setString(parameterIndex++, playerType);
                }
                if (totalPointsStr != null && !totalPointsStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(totalPointsStr));
                }
                if (goalsStr != null && !goalsStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(goalsStr));
                }
                if (assistsStr != null && !assistsStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(assistsStr));
                }
                if (penaltyMinutesStr != null && !penaltyMinutesStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(penaltyMinutesStr));
                }
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = "images/" + filePart.getSubmittedFileName();
                    filePart.write(getServletContext().getRealPath("/") + fileName);
                    pstmt.setString(parameterIndex++, fileName);
                }
                pstmt.setInt(parameterIndex, playerId);

                pstmt.executeUpdate();
                response.sendRedirect("hockey-team-admin1.jsp");
            } catch (Exception e) {
                throw new ServletException("Database error", e);
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Player ID is required.");
        }
    }
}
