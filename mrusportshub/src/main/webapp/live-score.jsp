<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Live Score</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <script>
        function toggleFields() {
            var sport = document.getElementById("sportstype").value;
            var cricketFields = document.getElementsByClassName("cricket-fields");
            var otherFields = document.getElementsByClassName("other-fields");
            var form = document.getElementById("updateScoreForm");

            if (sport === "Cricket") {
                form.action = "UpdateScoreServlet";
                for (var i = 0; i < cricketFields.length; i++) {
                    cricketFields[i].style.display = "block";
                }
                for (var j = 0; j < otherFields.length; j++) {
                    otherFields[j].style.display = "none";
                }
            } else {
                form.action = "UpdateScoreServlet";
                for (var i = 0; i < cricketFields.length; i++) {
                    cricketFields[i].style.display = "none";
                }
                for (var j = 0; j < otherFields.length; j++) {
                    otherFields[j].style.display = "block";
                }
            }
        }
    </script>
</head>
<body>
    <h1>Match Entry</h1>
    <form id="updateScoreForm" method="post">
        <label for="match_id">Match ID:</label>
        <input type="number" name="match_id" id="match_id" required>

        <label for="sportstype">Sport Type:</label>
        <select name="sportstype" id="sportstype" onchange="toggleFields()" required>
            <option value="">Select Sport</option>
            <option value="Cricket">Cricket</option>
            <option value="Football">Football</option>
            <option value="Volleyball">Volleyball</option>
            <option value="Hockey">Hockey</option>
        </select>

        <div class="cricket-fields" style="display:none;">
            <label for="team1_score_cricket">Team 1 Score:</label>
            <input type="number" name="team1_score_cricket" id="team1_score_cricket">
            <label for="team1_wickets_cricket">Team 1 Wickets:</label>
            <input type="number" name="team1_wickets_cricket" id="team1_wickets_cricket">
            <label for="team1_overs_cricket">Team 1 Overs:</label>
            <input type="text" name="team1_overs_cricket" id="team1_overs_cricket">
            <label for="team2_score_cricket">Team 2 Score:</label>
            <input type="number" name="team2_score_cricket" id="team2_score_cricket">
            <label for="team2_wickets_cricket">Team 2 Wickets:</label>
            <input type="number" name="team2_wickets_cricket" id="team2_wickets_cricket">
            <label for="team2_overs_cricket">Team 2 Overs:</label>
            <input type="text" name="team2_overs_cricket" id="team2_overs_cricket">
        </div>

        <div class="other-fields" style="display:none;">
            <label for="team1_score_other">Team 1 Score:</label>
            <input type="number" name="team1_score_other" id="team1_score_other">
            <label for="team2_score_other">Team 2 Score:</label>
            <input type="number" name="team2_score_other" id="team2_score_other">
        </div>

        <button type="submit" class="btn btn-primary">Update Scores</button>
    </form>
</body>
</html>


<style>

 font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .
*{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "poppins",sans-serif;
    }
     body {
        background: url('images/live.jpg');
        justify-content: center;
        align-items: center;
        height: 100%;
        background-size: cover;
        background-position: top;
    }

h1 {
    text-align: center;
    color: #333;
}

form {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

input[type="number"],
input[type="text"],
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

button[type="submit"]:hover {
    background-color: #45a049;
}

.cricket-fields,
.other-fields {
    margin-top: 20px;
}

.cricket-fields label,
.other-fields label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

.cricket-fields input[type="number"],
.cricket-fields input[type="text"],
.other-fields input[type="number"] {
    width: calc(50% - 10px);
    display: inline-block;
    margin-right: 10px;
}

.other-fields input[type="number"] {
    width: 100%;
}

.cricket-fields input[type="number"],
.cricket-fields input[type="text"],
.other-fields input[type="number"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.swipe-indicator {
    text-align: center;
    margin-top: 20px;
    color: #666;
}

.match-box {
    margin-top: 30px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.match-box h2 {
    margin-bottom: 10px;
    color: #333;
}

.match-box p {
    margin-bottom: 10px;
    color: #555;
}

.btn {
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
}

.btn-danger {
    background-color: #dc3545;
    color: #fff;
}

.btn-primary:hover,
.btn-danger:hover {
    opacity: 0.8;
}
</style>
