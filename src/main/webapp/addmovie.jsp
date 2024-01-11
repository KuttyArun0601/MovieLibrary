<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Movies</title>
 <style>
        body{
            border: 2px solid black;
            line-height: 50px;
            text-align: center;
        }
        
    </style>
</head>
<body>
<h2>Add movies</h2>
    <form action="savemovie" method="post" enctype="multipart/form-data">
        movieId: <input type="number" name="mId" id="" required><br>
        movieName: <input type="text" name="mName" id="" required><br>
        moviePrice: <input type="number" name="mPrice" id="" required><br>
        movieRatting: <input type="number" name="mRatting" id="" required><br>
        movieGenre: <input type="text" name="mGenre" id="" required><br>
        movieImage: <input type="file" name="mImage" id="" required><br>
        <input type="submit" name="" id="">
        
    </form>




</body>
</html>