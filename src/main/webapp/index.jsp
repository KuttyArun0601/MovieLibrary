<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movies Library</title>
<style>
        
    body{
    background-color: rgb(226, 209, 231);
    display: flex;
    justify-content: center;
    
}
#container{
    border: 1px solid rgb(161, 2, 175);
    width: 350px;
    height: 400px;
    background-color: rgb(235, 205, 247);
    padding: 30px 20px 0px 20px;
    border-radius: 20px 100px;
    transition: 1.5s;
   margin-top: 100px;
}
#container:hover{
 
    filter: drop-shadow(2px 2px 25px rgb(169, 30, 182));
}
#buttons{
    text-align: center;
    padding-top: 30px;
    line-height: 80px;
}
#buttons a{
    text-decoration: none;
    color: blue;
    font-size: larger;
    transition: 0.5s;
}
#buttons a:hover{
    font-size: 25px;
    background-color: rgb(231, 204, 164);
    box-shadow: 1px 1px 20px rebeccapurple;
}
.form{
    margin-top: 60px;
    padding: 6px 25px ;
    border-radius: 10px;
}
h3{
    text-align: center;
    font-size: 25px;
    font-weight: bold;
    font-family: cursive;
}
h6{
    text-align: center;
    font-size: 15px;
    margin-top: -10px;
}

        
    </style>
</head>
<body>

     <div id="container">
        <h3>Movies Library</h3>
        <h6>Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus, nemo!</h6>
        <div id="buttons" >
            
            <a class="form" href="adminlogin.jsp">Admin</a>
            <br>
            <a class="form" href="userlogin.jsp">User</a>
           
        </div>
    </div>
</body>
</html>