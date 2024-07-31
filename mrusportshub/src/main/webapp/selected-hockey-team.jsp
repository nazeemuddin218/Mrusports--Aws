<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hockey Teams</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
</head>
<body>
    <div class="container">
        <h1>Hockey Teams</h1>
        
        <div class="teams-container">
            <div class="team">
                <h2>Your Team</h2>
                <table>
                    <tr>
                        <th>Player Name</th>
                        <th>Player Position</th>
                    </tr>
                    <% 
                    String dbURL = "jdbc:mysql://localhost:3306/login";
                    String dbUser = "root";
                    String dbPassword = "mysql";
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        int matchId = Integer.parseInt(request.getParameter("match_id"));
                        String sql = "SELECT team_name, player_name, player_position FROM selectedhockeyteam WHERE team_type = 'Your Team' AND match_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, matchId);
                        rs = stmt.executeQuery();

                        while(rs.next()){
                            String teamName = rs.getString("team_name");
                            String playerName = rs.getString("player_name");
                            String playerPosition = rs.getString("player_position");
                    %>
                    <tr>
                        <td><%= playerName %></td>
                        <td><%= playerPosition %></td>
                    </tr>
                    <% 
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    } finally {
                        if(rs != null) try { rs.close(); } catch(SQLException e) {}
                        if(stmt != null) try { stmt.close(); } catch(SQLException e) {}
                        if(conn != null) try { conn.close(); } catch(SQLException e) {}
                    }
                    %>
                </table>
            </div>
            <div class="team">
                <h2>Opposite Team</h2>
                <table>
                    <tr>
                        <th>Player Name</th>
                        <th>Player Position</th>
                    </tr>
                    <% 
                    try {
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        int matchId = Integer.parseInt(request.getParameter("match_id"));
                        String sql = "SELECT team_name, player_name, player_position FROM selectedhockeyteam WHERE team_type = 'Opposite Team' AND match_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, matchId);
                        rs = stmt.executeQuery();

                        while(rs.next()){
                            String teamName = rs.getString("team_name");
                            String playerName = rs.getString("player_name");
                            String playerPosition = rs.getString("player_position");
                    %>
                    <tr>
                        <td><%= playerName %></td>
                        <td><%= playerPosition %></td>
                    </tr>
                    <% 
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    } finally {
                        if(rs != null) try { rs.close(); } catch(SQLException e) {}
                        if(stmt != null) try { stmt.close(); } catch(SQLException e) {}
                        if(conn != null) try { conn.close(); } catch(SQLException e) {}
                    }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

<style>
 font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .


body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.teams-container {
    display: flex;
    justify-content: space-between;
}

.team {
    flex: 0 0 48%;
    margin-bottom: 40px;
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

h2 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #555;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 15px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    color: #555;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}
</style>
