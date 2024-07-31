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

@WebServlet("/hockeyteam")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class HockeyTeam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String UPLOAD_DIRECTORY = "uploads" + File.separator + "hockey";

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
        String playerPosition = request.getParameter("playerPosition");
        int totalPoints = Integer.parseInt(request.getParameter("totalPoints"));

        int goals = 0;
        int assists = 0;
        int penaltyMinutes = 0;

        if ("Forward".equals(playerPosition) || "Defenseman".equals(playerPosition)) {
            goals = Integer.parseInt(request.getParameter("goals"));
            assists = Integer.parseInt(request.getParameter("assists"));
            penaltyMinutes = Integer.parseInt(request.getParameter("penaltyMinutes"));
        }

        String photoPath = null;
        Part filePart = request.getPart("playerPhoto");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            photoPath = UPLOAD_DIRECTORY + File.separator + fileName;
        } else {
            photoPath = "images/default.jpg"; // Assuming default image path is relative to the context
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO hockeyteam (playerName, playerPosition, totalPoints, goals, assists, penaltyMinutes, image) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, playerName);
            stmt.setString(2, playerPosition);
            stmt.setInt(3, totalPoints);
            stmt.setInt(4, goals);
            stmt.setInt(5, assists);
            stmt.setInt(6, penaltyMinutes);
            stmt.setString(7, photoPath);

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
