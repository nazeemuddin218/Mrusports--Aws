import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cricketPlayerDetails")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class Cricketteam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String UPLOAD_DIRECTORY = "C:/mru sports hub/project/mrusportshub/src/main/webapp/uploads";

    static {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String playerName = request.getParameter("playerName");
        String playerType = request.getParameter("playerType");
        String bowlingType = request.getParameter("bowlingType");
        int totalRuns = Integer.parseInt(request.getParameter("totalRuns"));
        int catches = Integer.parseInt(request.getParameter("catches"));

        int stumpings = 0;
        int wickets = 0;

        if ("Bowler".equals(playerType)) {
            String wicketsParam = request.getParameter("bowlerWickets");
            wickets = (wicketsParam != null && !wicketsParam.isEmpty()) ? Integer.parseInt(wicketsParam) : 0;
        }
        if ("All Rounder".equals(playerType)) {
            String wicketsParam = request.getParameter("allrounderWickets");
            wickets = (wicketsParam != null && !wicketsParam.isEmpty()) ? Integer.parseInt(wicketsParam) : 0;
        }

        if ("Wicket Keeper".equals(playerType)) {
            String stumpingsParam = request.getParameter("stumpings");
            stumpings = stumpingsParam.isEmpty() ? 0 : Integer.parseInt(stumpingsParam);
        }

        String photoPath = null;
        Part filePart = request.getPart("playerPhoto");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            File uploadDir = new File(UPLOAD_DIRECTORY);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            try (InputStream input = filePart.getInputStream();
                 OutputStream output = new FileOutputStream(filePath)) {

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
                photoPath = "uploads" + File.separator + fileName;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            photoPath = "images/default.jpg";
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO cricketteam (playerName, playerType, totalRuns, bowlingType, wickets, stumpings, catches, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, playerName);
            stmt.setString(2, playerType);
            stmt.setInt(3, totalRuns);
            stmt.setString(4, bowlingType);
            stmt.setInt(5, wickets);
            stmt.setInt(6, stumpings);
            stmt.setInt(7, catches);
            stmt.setString(8, photoPath);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Player details successfully added!");
            } else {
                response.getWriter().println("Error, try again!!!!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
