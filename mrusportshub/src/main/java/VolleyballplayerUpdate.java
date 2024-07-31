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

@WebServlet("/updatePlayer")
@MultipartConfig
public class VolleyballplayerUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerIdStr = request.getParameter("playerId");
        String playerName = request.getParameter("playerName");
        String playerType = request.getParameter("playerType");
        String totalPointsStr = request.getParameter("totalPoints");
        String killsStr = request.getParameter("kills");
        String blocksStr = request.getParameter("blocks");
        String digsStr = request.getParameter("digs");
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

                StringBuilder sql = new StringBuilder("UPDATE volleyballteam SET");
                if (playerName != null && !playerName.trim().isEmpty()) {
                    sql.append(" playerName = ?,");
                }
                if (playerType != null && !playerType.trim().isEmpty()) {
                    sql.append(" playerType = ?,");
                }
                if (totalPointsStr != null && !totalPointsStr.trim().isEmpty()) {
                    sql.append(" totalPoints = ?,");
                }
                if (killsStr != null && !killsStr.trim().isEmpty()) {
                    sql.append(" kills = ?,");
                }
                if (blocksStr != null && !blocksStr.trim().isEmpty()) {
                    sql.append(" blocks = ?,");
                }
                if (digsStr != null && !digsStr.trim().isEmpty()) {
                    sql.append(" digs = ?,");
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
                if (killsStr != null && !killsStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(killsStr));
                }
                if (blocksStr != null && !blocksStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(blocksStr));
                }
                if (digsStr != null && !digsStr.trim().isEmpty()) {
                    pstmt.setInt(parameterIndex++, Integer.parseInt(digsStr));
                }
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = "images/" + filePart.getSubmittedFileName();
                    filePart.write(getServletContext().getRealPath("/") + fileName);
                    pstmt.setString(parameterIndex++, fileName);
                }
                pstmt.setInt(parameterIndex, playerId);

                pstmt.executeUpdate();
                response.sendRedirect("volleyball-team-admin1.jsp");
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
