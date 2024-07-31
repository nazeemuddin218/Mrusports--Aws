<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cricket Team Players</title>
    <link rel="icon" type="image/png" href="images/mru logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div>
        <div class="title">
            <hr>
            <h1>CRICKET TEAM PLAYERS</h1>
            <hr>
        </div>
        <div class="navlist">
            <a href="cricketteam.jsp">New</a>
        </div>
        <br><br>
        <div class="list">
            <h2>BATSMEN</h2>
            <div class="batsmen">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM cricketteam WHERE playerType = 'Batsman'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="UpdatePlayerServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Runs:</label>
                                <input type="text" id="totalRuns_<%= rs.getInt("id") %>" name="totalRuns" value="<%= rs.getString("totalRuns") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Catches:</label>
                                <input type="text" id="catches_<%= rs.getInt("id") %>" name="catches" value="<%= rs.getString("catches") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="RemovePlayerServlet" method="post">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <button type="submit">Remove</button>
                            </form>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            
            <h2>WICKET KEEPERS</h2>
            <div class="wicketkeeper">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM cricketteam WHERE playerType = 'Wicket Keeper'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="UpdatePlayerServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Runs:</label>
                                <input type="text" id="totalRuns_<%= rs.getInt("id") %>" name="totalRuns" value="<%= rs.getString("totalRuns") %>"><br>
                                <label for="stumpings_<%= rs.getInt("id") %>">Stumpings:</label>
                                <input type="text" id="stumpings_<%= rs.getInt("id") %>" name="stumpings" value="<%= rs.getString("stumpings") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Catches:</label>
                                <input type="text" id="catches_<%= rs.getInt("id") %>" name="catches" value="<%= rs.getString("catches") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="RemovePlayerServlet" method="post">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <button type="submit">Remove</button>
                            </form>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            
            <h2>ALL ROUNDERS</h2>
            <div class="allrounder">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM cricketteam WHERE playerType = 'All Rounder'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="UpdatePlayerServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="bowlingType_<%= rs.getInt("id") %>">Bowling Type:</label>
                                <input type="text" id="bowlingType_<%= rs.getInt("id") %>" name="bowlingType" value="<%= rs.getString("bowlingType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Runs:</label>
                                <input type="text" id="totalRuns_<%= rs.getInt("id") %>" name="totalRuns" value="<%= rs.getString("totalRuns") %>"><br>
                                <label for="wickets_<%= rs.getInt("id") %>">Wickets:</label>
                                <input type="text" id="wickets_<%= rs.getInt("id") %>" name="wickets" value="<%= rs.getString("wickets") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Catches:</label>
                                <input type="text" id="catches_<%= rs.getInt("id") %>" name="catches" value="<%= rs.getString("catches") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="RemovePlayerServlet" method="post">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <button type="submit">Remove</button>
                            </form>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            
            <h2>BOWLERS</h2>
            <div class="bowler">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM cricketteam WHERE playerType = 'Bowler'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="UpdatePlayerServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="bowlingType_<%= rs.getInt("id") %>">Bowling Type:</label>
                                <input type="text" id="bowlingType_<%= rs.getInt("id") %>" name="bowlingType" value="<%= rs.getString("bowlingType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Runs:</label>
                                <input type="text" id="totalRuns_<%= rs.getInt("id") %>" name="totalRuns" value="<%= rs.getString("totalRuns") %>"><br>
                                <label for="wickets_<%= rs.getInt("id") %>">Wickets:</label>
                                <input type="text" id="wickets_<%= rs.getInt("id") %>" name="wickets" value="<%= rs.getString("wickets") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Catches:</label>
                                <input type="text" id="catches_<%= rs.getInt("id") %>" name="catches" value="<%= rs.getString("catches") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="RemovePlayerServlet" method="post">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <button type="submit">Remove</button>
                            </form>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
        </div>
    </div>
    
    <script>
        // Function to refresh the page every 30 seconds
        setInterval(function() {
            location.reload();
        }, 30000); // 30 seconds
    </script>
</body>
</html>
<style>

font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); 

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.title {
    background: url('images/crickettop.jpg');
    justify-content: center;
    align-items: center;
    min-height: 40px;
    background-size: cover;
    background-position: center;
}

.title h1 {
    text-align: center;
    color: black; 
    font-size: 50px;
    padding-top: 50px;
    text-shadow: 
        -4px -4px 0 white,  
        4px -4px 0 white,
        -4px 4px 0 white,
        4px 4px 0 white;
}

.navlist {
    display: flex;
    justify-content: flex-end; /* Align items to the right */
    gap: 10px;
}

.navlist a {
    color: black;
    text-align: center;
    padding: 10px;
    text-decoration: none;
    font-size: 16px;
    background-color: rgb(234, 156, 55);
    border-radius: 5px;
}

.list h2 {
    text-align: center;
    font-size: 22px;
}

.batsmen,
.wicketkeeper,
.allrounder,
.bowler {
    display: flex;
    flex-wrap: wrap;
    gap: 20px; 
}

.player {
    width: calc(25% - 20px); 
    padding: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box; 
    text-align: center;
}

.player img {
    max-width: 200px;
    height: 200px;
    display: block;
    margin: 0 auto 10px;
    object-fit: cover;
    object-position: top;
}

.player label {
    display: block;
    margin-bottom: 5px;
}

.player input {
    width: 100%;
    padding: 5px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

.player button {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    background-color: rgb(234, 156, 55);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.player form {
    text-align: left;
}
</style>
