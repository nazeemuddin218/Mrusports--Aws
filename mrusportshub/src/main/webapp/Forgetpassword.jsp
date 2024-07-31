<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
     <link rel="icon" type="images/png" href="images/mru logo.png"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
    <form method="post" action="forgotPasswordServlet">
    <div class="container"> 
    <h1>Forgot Password</h1>
        <div class="input-box"> 
        <input type="email" id="email" placeholder="Enter your email address" name="email" required>
         <i class='bx bxs-user'></i>
        </div>
        <button type="submit" class="btn" >Reset Password</button>
     </div>   
        
    </form>
</body>
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
            width: 50%;
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
    </style>
</html>
