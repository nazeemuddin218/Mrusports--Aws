<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <title>MATCH</title>
</head>
<body>
    <h1>Live Match</h1>
    <form action="matchentry" method="post" enctype="multipart/form-data">
        <label for="sportstype">Sports type:</label>
        <select id="sportstype" name="sportstype" required>
            <option value="">Select type</option>
            <option value="Cricket">Cricket</option>
            <option value="Volleyball">Volleyball</option>
            <option value="Football">Football</option>
            <option value="Hockey">Hockey</option>
        </select><br>
        <label for="team1">Team 1:</label>
        <input type="text" id="team1" name="team1" required>
        <input type="file" id="team1_logo" name="team1_logo" accept="image/*" required><br>
        <label for="team2">Team 2:</label>
        <input type="text" id="team2" name="team2" required>
        <input type="file" id="team2_logo" name="team2_logo" accept="image/*" required><br>
        <input type="submit" value="Submit">
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
        background: url('images/matchentry.jpg');
        justify-content: center;
        align-items: center;
        height: 100%;
        background-size: cover;
        background-position: top;
    }

    h1 {
        padding-top: 90px;
        text-align: center;
        color: #333;
    }

    form {
        padding-top: 10px;
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.5); 
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