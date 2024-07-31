<%@ page import="java.sql.*, java.util.*, javax.naming.*, javax.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRU SPORTS HUB</title>
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <!--logo-->
  <section>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="rows">
          <div class="logo">
              <img src="images/mrulogo1.jpg" alt="">
              <p>MRU SPORTS HUB</p>
          </div>
      </div>
    </nav>
     
    <br><br> 
    <!--banner--> 
    <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="images/cricketbanner.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>CRICKET</h5>
            </div>
          </div>
          <div class="carousel-item">
            <img src="images/hockeybanner.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>HOCKEY</h5>
            </div>
          </div>
          <div class="carousel-item">
            <img src="images/kabaddibanner.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>KABADDI</h5>
            </div>
          </div>
          <div class="carousel-item">
            <img src="images/Volleyball banner.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>VOLLEY BALL</h5>
            </div>
          </div><div class="carousel-item">
            <img src="images/footballbanner.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>FOOT BALL</h5>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
  </section>
  <!--banner down-->
  <h1>Live Matches</h1>
    <div class="live">
        <div class="swipe-indicator left">
            <i class="fas fa-chevron-left"></i> Swipe
        </div>
        <div class="scroll-container" id="scroll-container">
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

                    String sql = "SELECT matchentry.match_id, matchentry.sportstype, matchentry.team1, matchentry.team1_logo, matchentry.team2, matchentry.team2_logo, " +
                            "livescore.team1_score, livescore.team1_wickets, livescore.team1_overs, livescore.team2_score, livescore.team2_wickets, livescore.team2_overs, " +
                            "other_sports_scores.team1_score AS other_team1_score, other_sports_scores.team2_score AS other_team2_score " +
                            "FROM matchentry " +
                            "LEFT JOIN livescore ON matchentry.match_id = livescore.match_id " +
                            "LEFT JOIN other_sports_scores ON matchentry.match_id = other_sports_scores.match_id " +
                            "ORDER BY matchentry.created_at DESC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int match_id = rs.getInt("match_id");
                        String sportstype = rs.getString("sportstype");
                        String team1 = rs.getString("team1");
                        byte[] team1Logo = rs.getBytes("team1_logo");
                        String team2 = rs.getString("team2");
                        byte[] team2Logo = rs.getBytes("team2_logo");
                        int team1_score = rs.getInt("team1_score");
                        int team1_wickets = rs.getInt("team1_wickets");
                        String team1_overs = rs.getString("team1_overs");
                        int team2_score = rs.getInt("team2_score");
                        int team2_wickets = rs.getInt("team2_wickets");
                        String team2_overs = rs.getString("team2_overs");

                        int other_team1_score = rs.getInt("other_team1_score");
                        int other_team2_score = rs.getInt("other_team2_score");

                        String team1LogoBase64 = Base64.getEncoder().encodeToString(team1Logo);
                        String team2LogoBase64 = Base64.getEncoder().encodeToString(team2Logo);

                        %>
                        <div class="match-box">
                            <h2><%= sportstype %></h2>
                            <h2>Match ID: <%= match_id %></h2>
                            <p>
                                <%= team1 %> 
                                <img src="data:image/jpeg;base64,<%= team1LogoBase64 %>" alt="<%= team1 %> logo">
                                <% if ("Cricket".equalsIgnoreCase(sportstype)) { %>
                                    - <%= team1_score %>/<%= team1_wickets %> (<%= team1_overs %>)
                                <% } else { %>
                                    - <%= other_team1_score %>
                                <% } %>
                            </p>
                            <p>
                                <%= team2 %> 
                                <img src="data:image/jpeg;base64,<%= team2LogoBase64 %>" alt="<%= team2 %> logo">
                                <% if ("Cricket".equalsIgnoreCase(sportstype)) { %>
                                    - <%= team2_score %>/<%= team2_wickets %> (<%= team2_overs %>)
                                <% } else { %>
                                    - <%= other_team2_score %>
                                <% } %>
                            </p>
							<%
	                if ("Cricket".equalsIgnoreCase(sportstype)) {
	            %>
	            <a href="selected-cricket-team.jsp?match_id=<%= match_id %>" class="btn btn-primary">View team</a>

	            <%
	                } else if ("Volleyball".equalsIgnoreCase(sportstype)) {
	            %>
			     <a href="Selected-volleyball-team.jsp?match_id=<%= match_id %>" class="btn btn-primary">View team</a>
			    <%
			        } else if ("Football".equalsIgnoreCase(sportstype)) {
			    %>
			    <a href="Selected-football-team.jsp?match_id=<%= match_id %>" class="btn btn-primary">View team</a>
			    <%
			        } else if ("Hockey".equalsIgnoreCase(sportstype)) {
			    %>
			    <a href="selected-hockey-team.jsp?match_id=<%= match_id %>" class="btn btn-primary">View team</a>
			    <%
			        }
			    %>
			</div>
			<%
    }
%><% 
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("Error: " + e.getMessage());
     
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { }
                }
            %>
        </div>
        <div class="swipe-indicator right">
            Swipe <i class="fas fa-chevron-right"></i>
        </div>
    </div>
  <section class="header">
    <div class="containeer">
        <div class="row pading50">
        </div>
        <div class="row padboth">
            <div class="items">
             <img src="images/cricket.jpg" alt="">
             <div class="inneritem">
                <a href="cricketteamdisplay.jsp"><h3>CRICKET</h3></a>

             </div>
            </div>
            <div class="items">
             <img src="images/vollyball.jpg" alt="">
             <div class="inneritem">
                <a href="volleyball-team-display.jsp"><h3>VOLLEYBALL</h3></a>

             </div>
            </div>
            <div class="items">
                <img src="images/football.jpg" alt="">
                <div class="inneritem">
                    <a href="football-team-display.jsp"><h3>FOOT BALL</h3></a>
      
                 </div>
                 
            </div>
            <div class="items">
              <img src="images/hockey.jpg" alt="">
              <div class="inneritem"><br>
                  <a href="hockey-team-display.jsp"><h3>HOCKEY</h3></a>
              </div>
            </div>
            
                  
            </div>
        </div>
</section>
<!--footer -->
  <section>
    <footer>
      <div class="footer-top">
          <div class="contaiiner">
              <div class="footer-day-time">
                  <div class="row">
                      <div class="col-lg-4">
                        
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-lg-4">
                    <div class="support">
                      <h3><b>Support & Feedback</b></h3>
                       </div><br>
                  <div class="para"> 
                    
                      <p><b>You can send Feedback and get support via mail from the setting of out apps which provides us with detail about the version of the app you are running.</b></p>
                       <br><p><b> You can also get help on twitter via our app accounts.Follow them to get tips and updates</b>
                      </p>
                  </div>
                  </div>

                  <div class="col-md-4">
                    <div class="support">
                      <h3><b>Email support</b></h3>
                    </div>
                      <br>
                      <ul class="address1">
                          <li><i class='bx bx-envelope' ></i><a href="":#> support@mrusportshub.com</a></li>
                          <li><i class='bx bx-envelope' ></i><a href="mailto:#"> mrusportshub.com</a></li>
                      </ul>
                      
                      
                  </div>

                  <div class="col-md-4">
                    <div class="support">
                      <h3><b>Follow us </b></h3>
                  </div>
                  <br>
                  <ul>
                      <div class="addr1">
                          <li><i class="fa fa-facebook"></i><b>Facebook:</b> <a href="https://www.facebook.com/mrusportshub">mrusportshub</a></li>
                          <li> <i class="fa fa-instagram"></i> <b>Instagram:</b><a href="mailto:mrusportshub_123"> mrusportshub_123</a></li>
                      </div>
                  </ul>
                  
              </div>
          </div>
      </div>
  </footer>

  </section>
  <section>
    <div class="footer">
        <p>Copyright &copy2024; Designed by <span class="designer">SPORTS TEAM</span></p>
    </div>
</section>
   <script src="https://cdn.jsdelivr.net/npm/hammerjs@2.0.8/hammer.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  	<script>
  	document.addEventListener("DOMContentLoaded", () => {
        const container = document.getElementById('scroll-container');
        const hammer = new Hammer(container);

        // Mouse drag scrolling
        let isDown = false;
        let startX;
        let scrollLeft;

        container.addEventListener('mousedown', (e) => {
            isDown = true;
            startX = e.pageX - container.offsetLeft;
            scrollLeft = container.scrollLeft;
        });

        container.addEventListener('mouseleave', () => {
            isDown = false;
        });

        container.addEventListener('mouseup', () => {
            isDown = false;
        });

        container.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            const x = e.pageX - container.offsetLeft;
            const walk = (x - startX) * 3; //scroll-fast
            container.scrollLeft = scrollLeft - walk;
        });

        // Touch swipe scrolling
        hammer.get('swipe').set({ direction: Hammer.DIRECTION_HORIZONTAL });

        hammer.on('swipeleft', () => {
            container.scrollBy({ left: 300, behavior: 'smooth' });
        });

        hammer.on('swiperight', () => {
            container.scrollBy({ left: -300, behavior: 'smooth' });
        });
    });
  	function openMatchPage(sportstype, matchId) {
        console.log("Sport Type: " + sportstype);
        console.log("Match ID: " + matchId);
        var url;
        switch (sportstype) {
            case 'Cricket':
                url = 'selected-cricket-team.jsp#' + matchId;
                break;
            case 'Football':
                url = 'selected-football-team.jsp#' + matchId;
                break;
            case 'Hockey':
                url = 'selected-hockey-team.jsp#' + matchId;
                break;
            case 'Volleyball':
                url = 'selected-volleyball-team.jsp#' + matchId;
                break;
            default:
                alert('Unknown sport type!');
                return;
        }
        console.log("Redirecting to: " + url);
        window.location.href = url;
    }
  	setInterval(function() {
        location.reload();}, 60000); 
     </script>
  </body>
</html>
<style>
 font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .


.rows{
  background: #fff;
  height: 240;
  width:100%;
  background-color:white;
}
.logo {
    display: flex; /* Use flexbox for the logo container */
    align-items: center; /* Center items vertically */
    width: 1400px;
    height: 200px;
  background-color:white;
}
    
    .logo p{
  font-family: "Playfair Display", serif;
  font-optical-sizing: auto;
  font-weight: 400;
  font-style: normal;
  color: #555;
  font-size: 110px;
  padding-left: 100px;
  padding:100px;
  background-color:white;
}
.logo img {
    display: block;
    margin: 0 auto; 
}
/*footer*/
.fa {
  padding: 10px;
  font-size: 20px;
  width: 30px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
}
.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
  
  color: white;
}
.bx-envelope{
  color: white;
}

.fa-instagram {
  color: white;
}
.para{
  color: #fae9e9e3;
}
.addr1{
  color: #fff;
}
.addr1 li{
  display: block;
}
.addr1 li a{
  text-decoration: none;
  transition: transform 0.5s;
}
.address1 li{
  display: block;
}
.address1 li a{
  text-decoration: none;
  transition: transform 0.5s;
}
.addr1 li a:hover{
  color: #8ea22b;
    transform: translateY(-5px);
}
.address1 li a:hover{
  color: #8ea22b;
    transform: translateY(-5px);
}
.support{
  font-weight: bold;
  color: #fffdfd;
}
.footer-top{
  background-color: #3f3c3c;
    height: 250px;
}
/*banner down*/

.header{
  text-align: center;
}
.containeer{
  max-width: 1200px; 
    margin: 0 auto; 

}
.pading50{
    padding-top:50px;
}
.padboth{
    padding:10px 10px;
}
.items{
    width:100%;
    height:auto;
    float: left;
    margin:15px;
    border:1px solid #ddd;
}
.items img{
    width:100%;
    height:auto;
}
.inneritem{
padding:15px;
}
.inneritem h3{
    text-transform: uppercase;
    color:#481fa6;
    text-align: center;
    padding: 10px 0px;
}
.inneritem a{
text-decoration:none;
}
.inneritem h3:hover{
	color:white;
}
.items:hover{
    box-shadow: 0px 0px 10px #ddd;
    background-color:black;
}

.items{
    width:268px;
    height:auto;
    float: left;
    margin:15px;
    border:1px solid #ddd;
}
 
  #navlist {
			width: 100%;
		}
    #navlist a {
			float:right;
			display: block;
			color: #0d0d0d;
			text-align: center;
			padding: 12px;
			text-decoration: none;
			font-size: 15px;
		}
		.navlist-right{
			float:right;
		}
		#navlist a:hover {
			background-color: #d8d5d5;
			color: black;
		}
    .login{
      background-color: rgb(234, 156, 55);
      border-radius: 10px;
    }
  .login h5{
    color: white;
    transition: ease-in .3s;
  }
  .login h5:hover{
    color: black;
    }
    /* footer */
.footer{
    background-color: #1f1a1c;
    padding: 20px;
    text-align: center;
    width:1500px;
}
.footer p{
    color: white;
}
.designer{
    opacity: 0.7;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 400;
    margin: 0px 5px;
}
body{
  width: 100%;
}
body{ font-family: 'Lato', sans-serif;
            background: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .live {
            display: flex;
            align-items: center;
            position: relative;
            width: 90%;
            overflow: hidden;
        }

        .scroll-container {
            display: flex;
            transition: transform 0.3s ease-in-out;
            overflow-x: auto;
            scroll-behavior: smooth;
        }

        .scroll-container::-webkit-scrollbar {
            display: none;
        }

        .scroll-container {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        .match-box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 250px;
            flex: 0 0 auto;
            text-align: center;
            margin-right: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
        }

        .match-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .match-box img {
            width: 40px;
            height: 40px;
            margin: 10px 0;
            display: block;
            margin-left: auto;
            margin-right: auto;
            object-fit: contain;
        }

        .match-box h2 {
            font-family: 'Lato', sans-serif;
            font-size: 20px;
            color: #ff4081;
            margin-bottom: 10px;
        }

        .match-box p {
            font-size: 16px;
            margin: 10px 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555;
        }

        .match-box p img {
            margin-left: 10px;
        }

        h1 {
            font-family: 'Lato', sans-serif;
            font-size: 36px;
            color: #ff4081;
            text-align: center;
            margin: 20px 0;
        }

        .swipe-indicator {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: #ff4081;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .swipe-indicator.left {
            left: 10px;
        }

        .swipe-indicator.right {
            right: 10px;
        }

        .swipe-indicator i {
            margin: 0 5px;
        }
</style>