<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <title>Match Entry</title>
</head>
<body>
    <h1>Existing Matches</h1>
    <table>
        <tr>
        	<th>Match ID</th>
            <th>Sportstype</th>
            <th>Team 1</th>
            <th>Team 2</th>
            <th>Remove</th>
        </tr>
        <% 
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            String url = "jdbc:mysql://localhost:3306/login";
            String username = "root";
            String password = "mysql";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);

                String sql = "SELECT match_id, sportstype, team1, team2 FROM matchentry";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("match_id");
                    String sportstype = rs.getString("sportstype");
                    String team1 = rs.getString("team1");
                    String team2 = rs.getString("team2");
        %>
        <tr>
        	<td><%= id %></td>
            <td><%= sportstype %></td>
            <td><%= team1 %></td>
            <td><%= team2 %></td>
            <td>
                <form action="removematch" method="post">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { }
                if (ps != null) try { ps.close(); } catch (SQLException e) { }
                if (conn != null) try { conn.close(); } catch (SQLException e) { }
            }
        %>
    </table>
</body>
</html>

  <style>
   font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #e83e8c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #b8326f;
        }

        button[type="submit"]:focus {
            outline: none;
        }
    </style>
