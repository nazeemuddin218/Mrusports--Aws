<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Cricket Player Details</title>
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <h1>Enter Cricket Player Details</h1>
    <form action="cricketPlayerDetails" method="post" enctype="multipart/form-data">
        <label for="playerName">Player Name:</label>
        <input type="text" id="playerName" name="playerName" required><br>
        <label for="playerType">Player Type:</label>
        <select id="playerType" name="playerType" required>
            <option value="">Select Type</option>
            <option value="Batsman">Batsman</option>
            <option value="Bowler">Bowler</option>
            <option value="Wicket Keeper">Wicket Keeper</option>
            <option value="All Rounder">All Rounder</option>
        </select><br>

        <label for="totalRuns">Total Runs:</label>
        <input type="number" id="totalRuns" name="totalRuns" required><br>

        <div id="bowlingDetails" style="display:none;">
		    <label for="bowlingType">Bowling Type:</label>
		    <select id="bowlingType" name="bowlingType" >
		    <option value="">Select Type</option>
		        <option value="Fast">Fast</option>
		        <option value="Spin">Spin</option>
		        <option value="Medium">Medium</option>
		    </select><br>  
		 </div>
		 <div id="bowlerDetails" style="display:none;">          
		    <label for="wickets">Wickets:</label>
		    <input type="number" id="bowlerWickets" name="bowlerWickets" ><br>
		</div>
		
		<div id="wicketKeeperDetails" style="display:none;">
		    <label for="stumpings">Stumpings:</label>
		    <input type="number" id="stumpings" name="stumpings" ><br>
		</div>
		
		<div id="allRounderDetails" style="display:none;">
		    <label for="wickets">Wickets:</label>
		    <input type="number" id="allRounderWickets" name="allrounderWickets" ><br>
		</div>


        <label for="catches">Catches:</label>
        <input type="number" id="catches" name="catches" required><br>
        
        <label for="useDefaultImage">Use Default Image:</label>
		<input type="checkbox" id="useDefaultImage" name="useDefaultImage">
        
         <input type="file" id="playerPhoto" name="playerPhoto" accept="image/*" ><br>
        <input type="submit" value="Submit">
    </form>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('playerType').addEventListener('change', function(event) {
            var value = event.target.value;
            document.getElementById("bowlingDetails").style.display = (value === "Bowler" || value === "All Rounder") ? "block" : "none";
            document.getElementById("bowlerDetails").style.display = value === "Bowler" ? "block" : "none";
            document.getElementById("wicketKeeperDetails").style.display = value === "Wicket Keeper" ? "block" : "none";
            document.getElementById("allRounderDetails").style.display = value === "All Rounder" ? "block" : "none";
        });

        document.getElementById('useDefaultImage').addEventListener('change', function(event) {
            var playerPhotoInput = document.getElementById('playerPhoto');
            playerPhotoInput.disabled = event.target.checked;
            playerPhotoInput.value = ''; // Clear any selected file
        });
    });
    </script>

</body>
</html>


<style>
  font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 

@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); 

*{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "poppins",sans-serif;
    }
body {
    background: url('images/cricketbg.jpg');
    justify-content: center;
    align-items: center;
        height: 100%;
    background-size: cover;
    background-position: center; 
}

h1 {
	padding-top:90px;
    text-align: center;
    color: #333;
}

form {
	padding-top:10px;
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.5); /* Transparent white background */
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

input[type="text"],
input[type="number"],
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
    background-repeat: no-repeat;
    background-position-x: calc(100% - 10px);
    background-position-y: center;
    padding-right: 30px;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

#error-message {
    color: red;
    margin-top: 5px;
}
#bowlerDetails,
#wicketKeeperDetails,
#allRounderDetails {
    display: none;
}
</style>