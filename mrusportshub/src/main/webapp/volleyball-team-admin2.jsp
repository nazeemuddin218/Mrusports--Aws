<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volleyball Team Players</title>
    <link rel="icon" type="image/png" href="images/mru logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div>
        <div class="title">
            <hr>
            <h1>VOLLEYBALL TEAM PLAYERS</h1>
            <hr>
        </div>
        <div class="navlist">
            <a href="volley-ball-team.jsp">New</a>
        </div>
        <br><br>
        <div class="list">
            <h2>LIBERO</h2>
            <div class="libero">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Libero'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Points</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
            
            <h2>SETTER</h2>
            <div class="setter">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'setter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total points:</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="stumpings_<%= rs.getInt("id") %>">Kills:</label>
                                <input type="text" id="kills_<%= rs.getInt("id") %>" name="kills" value="<%= rs.getString("kills") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Blocks:</label>
                                <input type="text" id="blocks_<%= rs.getInt("id") %>" name="blocks" value="<%= rs.getString("blocks") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Digs:</label>
                                <input type="text" id="digs_<%= rs.getInt("id") %>" name="digs" value="<%= rs.getString("digs") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
            
            <h2>MIDDLE BLOCKER</h2>
            <div class="middle-blocker">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Middle Blocker'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total points:</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="stumpings_<%= rs.getInt("id") %>">Kills:</label>
                                <input type="text" id="kills_<%= rs.getInt("id") %>" name="kills" value="<%= rs.getString("kills") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Blocks:</label>
                                <input type="text" id="blocks_<%= rs.getInt("id") %>" name="blocks" value="<%= rs.getString("blocks") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Digs:</label>
                                <input type="text" id="digs_<%= rs.getInt("id") %>" name="digs" value="<%= rs.getString("digs") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
            
            <h2>OUTSIDE HITTER</h2>
            <div class="outside-hitter">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Outside Hitter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total points:</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="stumpings_<%= rs.getInt("id") %>">Kills:</label>
                                <input type="text" id="kills_<%= rs.getInt("id") %>" name="kills" value="<%= rs.getString("kills") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Blocks:</label>
                                <input type="text" id="blocks_<%= rs.getInt("id") %>" name="blocks" value="<%= rs.getString("blocks") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Digs:</label>
                                <input type="text" id="digs_<%= rs.getInt("id") %>" name="digs" value="<%= rs.getString("digs") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
            
            <h2>OPPOSITE HITTER</h2>
            <div class="opposite-hitter">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Opposite Hitter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total points:</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="stumpings_<%= rs.getInt("id") %>">Kills:</label>
                                <input type="text" id="kills_<%= rs.getInt("id") %>" name="kills" value="<%= rs.getString("kills") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Blocks:</label>
                                <input type="text" id="blocks_<%= rs.getInt("id") %>" name="blocks" value="<%= rs.getString("blocks") %>"><br>
                                <label for="catches_<%= rs.getInt("id") %>">Digs:</label>
                                <input type="text" id="digs_<%= rs.getInt("id") %>" name="digs" value="<%= rs.getString("digs") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
            
            <h2>ROTATION PLAYER</h2>
            <div class="rotation-player">
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Rotation Player'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image" width="100" height="100">
                            <form action="updatePlayer" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="playerId" value="<%= rs.getInt("id") %>">
                                <label for="playerName_<%= rs.getInt("id") %>">Name:</label>
                                <input type="text" id="playerName_<%= rs.getInt("id") %>" name="playerName" value="<%= rs.getString("playerName") %>"><br>
                                <label for="playerType_<%= rs.getInt("id") %>">Type:</label>
                                <input type="text" id="playerType_<%= rs.getInt("id") %>" name="playerType" value="<%= rs.getString("playerType") %>"><br>
                                <label for="totalRuns_<%= rs.getInt("id") %>">Total Points</label>
                                <input type="text" id="totalPoints_<%= rs.getInt("id") %>" name="totalPoints" value="<%= rs.getString("totalPoints") %>"><br>
                                <label for="playerImage_<%= rs.getInt("id") %>">Image:</label>
                                <input type="file" id="playerImage_<%= rs.getInt("id") %>" name="playerImage"><br>
                                <button type="submit">Update</button><br>
                            </form>
                            <form action="deletePlayer" method="post">
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
	
    background: url('images/volleyballbg.jpg');
    justify-content: center;
    align-items: center;
    min-height: 100ev;
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

 .libero,
    .setter,
    .middle-blocker,
    .outside-hitter,
    .opposite-hitter,
    .rotation-player{
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