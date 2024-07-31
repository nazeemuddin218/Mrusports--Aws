<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volleyball Team Players</title>
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div>
        <div class="title">
            <hr>
            <h1>VOLLEYBALL TEAM PLAYERS</h1>
            <hr>
        </div>
        
        
        <div class="list">
            <h2>Libero</h2>
            <div class="libero">
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Libero'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            
            
            <h2>Setter</h2>
            <div class="setter">
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Setter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                            <p>Type: <%= rs.getString("kills") %></p>
                            <p>Type: <%= rs.getString("blocks") %></p>
                            <p>Type: <%= rs.getString("digs") %></p>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            

            <h2>Middle Blocker</h2>
            <div class="middle-blocker">
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Middle Blocker'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                            <p>Type: <%= rs.getString("kills") %></p>
                            <p>Type: <%= rs.getString("blocks") %></p>
                            <p>Type: <%= rs.getString("digs") %></p>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            

            <h2>Outside Hitter</h2>
            <div class="outside-hitter">
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Outside Hitter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                            <p>Type: <%= rs.getString("kills") %></p>
                            <p>Type: <%= rs.getString("blocks") %></p>
                            <p>Type: <%= rs.getString("digs") %></p>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            

            <h2>Opposite Hitter</h2>
            <div class="opposite-hitter">
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Opposite Hitter'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                            <p>Type: <%= rs.getString("kills") %></p>
                            <p>Type: <%= rs.getString("blocks") %></p>
                            <p>Type: <%= rs.getString("digs") %></p>
                        </div>
                    <% }
                    con.close();
                } catch (Exception e) {
                    out.println(e);
                } %>
            </div>
            <br>
            
            
            <h2>Rotation Player</h2>
            <div class="rotation-player">
                <% try {
                	 Class.forName("com.mysql.cj.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "mysql");
                     Statement stmt = con.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM volleyballteam WHERE playerType = 'Rotation Player'");
                    while (rs.next()) { %>
                        <div class="player">
                            <img src="<%= rs.getString("image") %>" alt="Player Image">
                            <p>Name: <%= rs.getString("playerName") %></p>
                            <p>Type: <%= rs.getString("playerType") %></p>
                            <p>Type: <%= rs.getString("totalPoints") %></p>
                            
                        </div>
                    <% }
                } catch (Exception e) {
                    out.println("<div>Error retrieving Rotation Player players: " + e.getMessage() + "</div>");
                } %>
            </div>
        </div>
    </div>
    
    <script>
        setInterval(function() {
            location.reload();
        }, 30000); 
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
        font-family: "poppins", sans-serif;
    }

    .title {
        background: url('images/volleyballbg1.jpg');
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
</style>
    