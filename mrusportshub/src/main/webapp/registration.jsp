<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MRU SportsHUB-Sign up</title>
    <link rel="icon" type="images/png" href="images/mru logo.png"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <form action="register" method="post" onsubmit="return validateForm()" >
        <div class="container"> 
            <h1>SIGN UP</h1>
            <div class="input-box"> 
            <input type="text" placeholder="Enter username" name="username" required>
            <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">  
                <input type="email" placeholder="Enter email" name="Email" required>
                <i class='bx bxl-gmail'></i>
                </div> 
            <div class="input-box">  
            <input type="password" placeholder="Enter password" id="password" name="password" required>
            <i class='bx bxs-lock-alt'></i>
            </div> 
            <div class="input-box">  
                <input type="password" placeholder="Re-enter password" id="confirm_password" name="confirm_password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" name="signup" id="signup" class="btn">Sign up</button>
            
           
        </div> 
    </form>   
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirm_password = document.getElementById("confirm_password").value;
            if (password != confirm_password) {
                alert("Passwords do not match");
                return false;
            }
            return true;
        }
    </script>
</body>   
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
        .a{
            text-decoration: none ;
            color: #fff;
        }
        
</style>