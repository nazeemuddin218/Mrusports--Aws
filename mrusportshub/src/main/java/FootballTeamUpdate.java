import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FootballTeamUpdate")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class FootballTeamUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String playerIdStr = request.getParameter("playerId");
        String playerName = request.getParameter("playerName");
        String playerPosition = request.getParameter("playerPosition");
        String totalGoalsStr = request.getParameter("totalGoals");
        String assistsStr = request.getParameter("assists");
        Part filePart = request.getPart("playerImage");

        if (playerIdStr == null || playerIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Player ID is required.");
            return;
        }

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
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");

            // Create SQL update statement
            StringBuilder sql = new StringBuilder("UPDATE footballteam SET");
            if (playerName != null && !playerName.trim().isEmpty()) {
                sql.append(" playerName = ?,");
            }
            if (playerPosition != null && !playerPosition.trim().isEmpty()) {
                sql.append(" playerPosition = ?,");
            }
            if (totalGoalsStr != null && !totalGoalsStr.trim().isEmpty()) {
                sql.append(" totalGoals = ?,");
            }
            if (assistsStr != null && !assistsStr.trim().isEmpty()) {
                sql.append(" assists = ?,");
            }
            if (filePart != null && filePart.getSize() > 0) {
                sql.append(" image = ?,");
            }
            // Remove the trailing comma
            sql.deleteCharAt(sql.length() - 1);
            sql.append(" WHERE id = ?");

            // Prepare statement
            pstmt = con.prepareStatement(sql.toString());
            int parameterIndex = 1;
            if (playerName != null && !playerName.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, playerName);
            }
            if (playerPosition != null && !playerPosition.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, playerPosition);
            }
            if (totalGoalsStr != null && !totalGoalsStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(totalGoalsStr));
            }
            if (assistsStr != null && !assistsStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(assistsStr));
            }
            if (filePart != null && filePart.getSize() > 0) {
                // Save the file on the server
                String fileName = new File(filePart.getSubmittedFileName()).getName();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                String imagePath = "images/" + fileName; // Store relative path
                pstmt.setString(parameterIndex++, imagePath);
            }
            pstmt.setInt(parameterIndex, playerId);

            // Execute update
            pstmt.executeUpdate();

            // Redirect back to the main page
            response.sendRedirect("football-team-admin1.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
