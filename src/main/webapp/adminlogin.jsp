<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin LogIn</title>
	 <style>
       body {
           
    background-color: rgb(208, 225, 238);
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 50px;
    height: 100vh;
   
    
}

.login-container {
    background-color: #e7cba4;
    padding: 20px;
    border-radius: 30px;
    width: 300px;
    border: 2px solid rgb(95, 95, 85);
    transition: 1s;
}
.login-container:hover{
    filter: drop-shadow(16px 7px 79px #161202);
}
h2{
    text-align: center;
    color: #43338a;
    font-size: 35px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    font-size: 20px;
}

.form-group input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #2c2c28;
    border-radius: 5px;
    background-color: rgb(240, 204, 171);
    
}

.form-group button {
    width: 100%;
    padding: 10px;
    background-color: #777444;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: x-large;
    font-family: cursive;
    font-weight: bold;
    transition: 0.5s;
}

.form-group button:hover {
    background-color: #132e03;
    color: white;
}
.form-group p{
    text-align: center;
}
a{
    color: #110741;
    font-weight: bold;
    font-size: 23px;
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