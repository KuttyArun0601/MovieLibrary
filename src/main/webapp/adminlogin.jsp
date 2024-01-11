<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin LogIn</title>
	 <style>
        body {
           
            background-color: #aab67e;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 50px;
            height: 100vh;
            
        }

        .login-container {
            background-color: #76a36c;
            padding: 20px;
            border-radius: 30px;
            width: 300px;
            border: 2px solid rgb(149, 151, 33);
        }

        h2{
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddc4c4;
            border-radius: 3px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #536914;
            color: #3f1111;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #035314;
        }
        .form-group p{
            text-align: center;
        }
        
        div p{
        text-align: center;
        line-height: 10px;
        }
    </style>
</head>
<body>
	<div class="login-container">
    <h2>Admin Login</h2>
    <form id="loginForm" action="alogin" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="email" id="username" name="username" required>
            <% String msge=(String)request.getAttribute("msge"); %>
			<%if(msge != null){ %>
			<p style="color: red;"><%= msge %></p>
			<% } %>
            
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
           
		 <% String msgp=(String)request.getAttribute("msgp"); %>
			<%if(msgp != null){ %>
			<p style="color: red;"><%= msgp %></p>
			<% } %>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
        <div class="form-group">
        <p id="footer">Don't have an account ? <a href="adminsignup.jsp">signup!</a></p>
        </div>
    </form>
</div>
</body>
</html>