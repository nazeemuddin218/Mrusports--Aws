<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter Hockey Player Details</title>
    <link rel="icon" type="image/png" href="images/mru logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <h1>Enter Hockey Player Details</h1>
    <form action="hockeyteam" method="post" enctype="multipart/form-data">
        <label for="playerName">Player Name:</label>
        <input type="text" id="playerName" name="playerName" required><br>
        
        <label for="playerPosition">Player Position:</label>
        <select id="playerPosition" name="playerPosition" required>
            <option value="">Select Position</option>
            <option value="Forward">Forward</option>
            <option value="Defenseman">Defenseman</option>
            <option value="Goalkeeper">Goalkeeper</option>
        </select><br>
        
        <div id="positionDetails" class="position-details">
            <label for="goals">Goals:</label>
            <input type="number" id="goals" name="goals"><br>
            <label for="assists">Assists:</label>
            <input type="number" id="assists" name="assists"><br>
            <label for="penaltyMinutes">Penalty Minutes:</label>
            <input type="number" id="penaltyMinutes" name="penaltyMinutes"><br>
        </div>
        
        <label for="totalPoints">Total Points:</label>
        <input type="number" id="totalPoints" name="totalPoints" required><br>
        
      
        
        <input type="file" id="playerPhoto" name="playerPhoto" accept="image/*"><br>
        <input type="submit" value="Submit">
    </form>

    <script>
        document.getElementById('playerPosition').addEventListener('change', function(event) {
            var value = event.target.value;
            var positionDetails = document.getElementById("positionDetails");
            if (value === "Forward" || value === "Defenseman") {
                positionDetails.style.display = "block";
            } else {
                positionDetails.style.display = "none";
            }
        });

        document.getElementById('useDefaultImage').addEventListener('change', function(event) {
            var playerPhotoInput = document.getElementById('playerPhoto');
            playerPhotoInput.disabled = event.target.checked;
            playerPhotoInput.value = ''; // Clear any selected file
        });
    </script>
</body>
</html>


<style>
 font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .
mport url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); 
   *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "poppins",sans-serif;
    }

    body {
        background: url('images/hockeybg.jpg');
        justify-content: center;
        align-items: center;
        height: 100%;
        background-size: cover;
        background-position: center;
    }

    h1 {
        width: 100%;
        padding: 20px 0;
        margin: 0;
        background-color: rgba(255, 255, 255, 0.8);
        text-align: center;
        color: #333;
    }

    form {
        padding-top: 10px;
        max-width: 400px;
        margin: 20px auto;
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

    .position-details {
        display: none;
    }
</style>
