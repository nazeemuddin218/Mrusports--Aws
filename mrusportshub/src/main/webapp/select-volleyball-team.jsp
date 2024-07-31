<!DOCTYPE html>
<html>
<head>
    <title>Enter Volleyball Teams</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
</head>
<body>
    <div class="container">
        <h1>Enter Volleyball Teams</h1>
        
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if> 
        
        <form action="VolleyballTeamServlet" method="post">
            <input type="hidden" name="match_id" value="${param.match_id}">
            <input type="hidden" name="action" value="submitTeams">
            
        <h2>Your Team</h2>
        <label for="yourTeamName">Your Team Name:</label>
            <input type="text" name="yourTeamName" id="yourTeamName" >
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
                            <option value="Setter">Setter</option>
                            <option value="Libero">Libero</option>
                            <option value="Middle Blocker">Middle Blocker</option>
                            <option value="Outside Hitter">Outside Hitter</option>
                            <option value="Opposite Hitter">Opposite Hitter</option>
                            <option value="Rotation Player">Rotation Player</option>
                        </select>
                    </td>
                </tr>
            </table>
        
        <h2>Opposite Team</h2>
        <label for="oppositeTeamName">Opposite Team Name:</label>
            <input type="text" name="oppositeTeamName" id="oppositeTeamName" >
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
                            <option value="Setter">Setter</option>
                            <option value="Libero">Libero</option>
                            <option value="Middle Blocker">Middle Blocker</option>
                            <option value="Outside Hitter">Outside Hitter</option>
                            <option value="Opposite Hitter">Opposite Hitter</option>
                            <option value="Rotation Player">Rotation Player</option>
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
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    /* Button styles */
    input[type="submit"], button {
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover, button:hover {
        background-color: #45a049;
    }

    /* Success message styles */
    .success-message {
        color: green;
        margin-bottom: 20px;
    }
</style>
