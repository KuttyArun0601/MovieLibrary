<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movies Library</title>
<style>
         body {
           
           background-color: #a596b8;
           display: flex;
           align-items: center;
           justify-content: center;
           line-height: 20px;
           height: 100vh;
           
       }
        #container {
            background-color: #9573c2;
            padding: 20px;
            border-radius: 40px;
            width: 340px;
            border: 2px solid rgb(48, 53, 28);
        }
        h3{
            text-align: center;
            color: #79186c;
        }
        .form {
            margin-bottom: 15px;
            margin-left: 50px;
        }
        .form label {
            display: block;
            font-weight: bolder;
            margin-bottom: 5px;
            
        }
        
    </style>
</head>
<body>
 <div id="container">
        <h3>Movies Library</h3>
        <form action="" id="movieindex">
            <div id="form"><button type="button"><a href="adminlogin.jsp">Admin</a></button></div>
            <div id="form"><a href="userlogin.jsp">User</a></div>
        </form>
    </div>
</body>
</html>