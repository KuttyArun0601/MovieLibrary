<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Movies</title>
 <style>
       body{
    background-color: rgb(214, 237, 241);
    display: flex;
    justify-content: center;
    align-items: center;
    line-height: 10px;
    height: 100vh;
    
}
#container{
    border: 2px solid rgb(95, 95, 85);
    border-radius: 40px;
    width: 320px;
    padding-left: 20px;
    padding-right: 20px;
    padding-bottom: 20px;
    background-color: #f1dcbf;
    transition: 1s;
}
#container:hover{
    filter: drop-shadow(16px 7px 79px rgb(110, 90, 46)) ;
}
h2{
    margin-top: 20px;
    text-align: center;
    font-size: 35px;
    font-weight: bold;
}
label , input{
    margin-top: 10px;
   
    
}
.form label{
    display: block;
    font-weight: bold;
    font-size: 20px;
    padding: 2px;
}
.form input{
    width: 100%;
    padding: 6px;
    box-sizing: border-box;
    border-radius: 5px;
}

.form button{
    width: 100px;
    height: 25px;
    position: relative;
    margin-left: 20px;
    left: 34px;
    border: none;
    border-radius: 20px;
}
#footer,#mImage{
    padding-bottom: 20px;
}

#submit{
    background-color: rgb(196, 161, 228);
    transition: 1s;
    filter: drop-shadow(0px 2px 4px);
}
#submit:hover{
    background-color: rgb(46, 5, 83);
    color: white;
    filter: drop-shadow(0px 2px 10px rgb(14, 14, 14));
}
#reset{
    background-color: rgb(141, 208, 235);
    transition: 1s;
    filter: drop-shadow(0px 2px 4px);
}
#reset:hover{
    background-color: rgb(6, 55, 78);
    color: white;
    filter: drop-shadow(0px 2px 10px rgb(14, 14, 14));
}

        
    </style>
</head>
<body>
    <div id="container">
        <h2>Add movies</h2>
        <form action="savemovie" method="post" enctype="multipart/form-data">
       
            <div class="form">
                <label for="mId">movieId:</label>
                <input type="number" name="mId" id="mId"  required>
            <div>
            <div class="form">
                <label for="mName">movieName:</label>
                <input type="text" name="mName" id="mName" required>
            </div>
            <div class="form">
                <label for="mPrice">moviePrice:</label>
                <input type="number" name="mPrice" id="mPrice" required>
            </div>
            <div class="form">
                <label for="mRatting">movieRatting:</label>
                <input type="number" name="mRatting" id="mRatting" required >
            </div>
            <div class="form">
                <label for="mGenre">movieGenre:</label>
                <input type="text" name="mGenre" id="mGenre" required>
            </div>
            <div class="form">
                <label for="">movieImage:</label>
                <input type="file" name="mImage" id="mImage" accept="image/*" required >
            </div>
            <div class="form" id="footer">
                <button type="submit" id="submit">submit</button>
                <button type="reset" id="reset">reset</button>
            </div>
        
        </form>
    </div>




</body>
</html>