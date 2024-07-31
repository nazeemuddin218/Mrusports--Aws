import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/footballplayer")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class FootballTeam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String UPLOAD_DIRECTORY = "uploads";
    private static final Logger LOGGER = Logger.getLogger(FootballTeam.class.getName());

    static {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Database Driver not found", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String playerName = request.getParameter("playerName");
        String playerPosition = request.getParameter("playerPosition");
        int totalPoints = Integer.parseInt(request.getParameter("totalPoints"));
        boolean useDefaultImage = "on".equals(request.getParameter("useDefaultImage"));

        int goals = 0;
        int assists = 0;

        if ("Goalkeeper".equals(playerPosition) || "Defender".equals(playerPosition) || 
            "Midfielder".equals(playerPosition) || "Forward".equals(playerPosition)) {
            goals = Integer.parseInt(request.getParameter("goals"));
            assists = Integer.parseInt(request.getParameter("assists"));
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
                     "INSERT INTO footballteam (playerName, playerPosition, totalPoints, goals, assists, image) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, playerName);
            stmt.setString(2, playerPosition);
            stmt.setInt(3, totalPoints);
            stmt.setInt(4, goals);
            stmt.setInt(5, assists);
            stmt.setString(6, photoPath);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Player details successfully added!");
            } else {
                response.getWriter().println("Error, try again!");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error", e);
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
