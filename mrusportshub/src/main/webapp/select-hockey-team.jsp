<!DOCTYPE html>
<html>
<head>
    <title>Enter Hockey Teams</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
</head>
<body>
    <div class="container">
        <h1>Enter Hockey Teams</h1>
        
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if> 
        
        <form action="HockeyTeamServlet" method="post">
            <input type="hidden" name="match_id" value="${param.match_id}">
            <input type="hidden" name="action" value="submitTeams">
            
            <h2>Your Team</h2>
            <div class="input-container">
                <label class="input-label" for="yourTeamName">Your Team Name:</label>
                <input type="text" name="yourTeamName" id="yourTeamName" >
            </div>
            <table id="yourTeamTable">
                <tr>
                    <th>Player Name</th>
                    <th>Player Position</th>
                </tr>
                <tr>
                    <td><input type="text" name="yourTeamPlayerName[]" placeholder="Player Name" required></td>
                    <td>
                        <select name="yourTeamPlayerPosition[]" required>
                            <option value="">Select Position</option>
                            <option value="Goalkeeper">Goalkeeper</option>
                            <option value="Defender">Defender</option>
                            <option value="Midfielder">Midfielder</option>
                            <option value="Forward">Forward</option>
                        </select>
                    </td>
                </tr>
            </table>
        
            <h2>Opposite Team</h2>
            <div class="input-container">
                <label class="input-label" for="oppositeTeamName">Opposite Team Name:</label>
                <input type="text" name="oppositeTeamName" id="oppositeTeamName" >
            </div>
            <table id="oppositeTeamTable">
                <tr>
                    <th>Player Name</th>
                    <th>Player Position</th>
                </tr>
                <tr>
                    <td><input type="text" name="oppositeTeamPlayerName[]" placeholder="Player Name" required></td>
                    <td>
                        <select name="oppositeTeamPlayerPosition[]" required>
                            <option value="">Select Position</option>
                            <option value="Goalkeeper">Goalkeeper</option>
                            <option value="Defender">Defender</option>
                            <option value="Midfielder">Midfielder</option>
                            <option value="Forward">Forward</option>
                        </select>
                    </td>
                </tr>
            </table>

            <input type="submit" value="Submit Teams">
        </form>
            
    </div>
</body>
</html>


<style>
 font-family: 'Lato', sans-serif;
font-family: 'Sevillana', cursive; 
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Sevillana&display=swap'); .


* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Container styles */
.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Heading styles */
h1, h2 {
    margin-bottom: 20px;
    font-family: Arial, sans-serif;
    color: #333;
}

/* Form styles */
form {
    margin-bottom: 30px;
}

/* Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

/* Input container styles */
.input-container {
    display: flex;
    margin-bottom: 10px;
    align-items: flex-end; /* Align items at the bottom */
}

/* Input label styles */
.input-label {
    flex: 1;
    margin-right: 10px;
    text-align: center;
}

/* Input styles */
input[type="text"], select {
    flex: 1;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 10px;
}

/* Button styles */
input[type="submit"], button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover, button:hover {
    background-color: #45a049;
}

/* Responsive styles */
@media (max-width: 768px) {
    .container {
        width: 90%;
    }
}

table tr td:last-child {
    display: flex;
    justify-content: center;
}

button {
    margin-left: 5px;
}
</style>
