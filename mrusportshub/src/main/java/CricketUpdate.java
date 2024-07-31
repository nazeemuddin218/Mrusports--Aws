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

@WebServlet("/UpdatePlayerServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CricketUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String playerIdStr = request.getParameter("playerId");
        String playerName = request.getParameter("playerName");
        String playerType = request.getParameter("playerType");
        String totalRunsStr = request.getParameter("totalRuns");
        String catchesStr = request.getParameter("catches");
        String stumpingsStr = request.getParameter("stumpings");
        String wicketsStr = request.getParameter("wickets");
        String bowlingType = request.getParameter("bowlingType");
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
            StringBuilder sql = new StringBuilder("UPDATE cricketteam SET");
            if (playerName != null && !playerName.trim().isEmpty()) {
                sql.append(" playerName = ?,");
            }
            if (playerType != null && !playerType.trim().isEmpty()) {
                sql.append(" playerType = ?,");
            }
            if (totalRunsStr != null && !totalRunsStr.trim().isEmpty()) {
                sql.append(" totalRuns = ?,");
            }
            if (catchesStr != null && !catchesStr.trim().isEmpty()) {
                sql.append(" catches = ?,");
            }
            if (stumpingsStr != null && !stumpingsStr.trim().isEmpty()) {
                sql.append(" stumpings = ?,");
            }
            if (wicketsStr != null && !wicketsStr.trim().isEmpty()) {
                sql.append(" wickets = ?,");
            }
            if (bowlingType != null && !bowlingType.trim().isEmpty()) {
                sql.append(" bowlingType = ?,");
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
            if (playerType != null && !playerType.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, playerType);
            }
            if (totalRunsStr != null && !totalRunsStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(totalRunsStr));
            }
            if (catchesStr != null && !catchesStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(catchesStr));
            }
            if (stumpingsStr != null && !stumpingsStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(stumpingsStr));
            }
            if (wicketsStr != null && !wicketsStr.trim().isEmpty()) {
                pstmt.setInt(parameterIndex++, Integer.parseInt(wicketsStr));
            }
            if (bowlingType != null && !bowlingType.trim().isEmpty()) {
                pstmt.setString(parameterIndex++, bowlingType);
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
            response.sendRedirect("cricket-team-admin1.jsp");
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
