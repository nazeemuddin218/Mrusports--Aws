<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MRU SportsHUB-Login</title>
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<form method="post" action="login" onsubmit="return validateLoginForm()">
        <div class="container"> 
            <h1>Login</h1>
            <div class="input-box"> 
                <input type="text" placeholder="Enter username or email" id="username_or_email" name="username_or_email" required>
                <i class='bx bxs-user'></i>
            </div>
            
            <div class="input-box">  
            <input type="password" placeholder="Enter password" id="password" name="password" required>
            <i class='bx bxs-lock-alt'></i>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <div id="error-message" style="color: red;"><%= errorMessage %></div>
        <% } %>
            </div> 
                        <input type="submit" class="btn" value="Login">
            <div class="register-link">
                <p>Don't have an account?<a href="registration.jsp">register</a></p>
            </div>
        </div> 
    </form>   
</body>    
<script>
    function hideErrorMessage() {
        setTimeout(function() {
            var errorMessage = document.getElementById("error-message");
            if (errorMessage) {
                errorMessage.style.display = "none";
            }
        }, 5000);
    }
    window.onload = function() {
        hideErrorMessage();
    };
    function showErrorMessage() {
        var errorMessage = document.getElementById("error-message");
        if (errorMessage) {
            errorMessage.style.display = "block";
            hideErrorMessage();
        }
    }
</script>

</html>
<style>
   

    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "poppins",sans-serif;
    }
    Body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: url('images/login.jpg');
        background-size: cover;
        background-position: center; 
    }
    .container{
        width: 420px;
        background: transparent;
        color: #f30909;
        border-radius: 10px;
        padding: 30px 40px;
    }
    .container  h1{
        font-size: 36px;
        text-align: center;
    }
    .container .input-box{
        width: 100%;
        position: relative;
        height: 50px;
        margin: 36px 0;
    }
    .input-box input{
        width: 100%;
        height: 100%;
        background: transparent;
        border: none;
        outline: none;
        border: 2px solid red;
        border-radius: 40px;
        font-size: 16px;
        color: #ea1919;
        padding: 20px 45px 20px 20px;
    }
    .input-box input::placeholder{
        color: #f30909;
    }
    .input-box i{
        position: absolute;
        right: 20px;
        top: 25px;
        transform: translateY(-50%);
        font-size: 20px;
    
        }
       
        .container .btn {
            width: 100%;
            height: 45px;
            background: #775c9c;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
            cursor: pointer;
            font-size: 16px;
            color: #fff;
            font-weight: 600;
        }
        .container .register-link{
        font-size: 14.4px;
        text-align: center;
        margin-top: 20px ;
        }
        .register-link p a {
        color: #f30909;
        text-decoration: none;
        font-weight: 600;
        
        }
        .register-link p a:hover{
        text-decoration: underline;
        }
        .a{
            text-decoration: none ;
            color: #fff;
        }
        
</style>