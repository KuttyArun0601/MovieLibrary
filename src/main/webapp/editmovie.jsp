<%@page import="DTOs.MovieDto"%>
<%@page import="java.util.Base64"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Movie</title>
</head>
<body>

	<% MovieDto m = (MovieDto)request.getAttribute("movies");  %>

	<form action="updatemovie" method="post" enctype="multipart/form-data">
		movieid<input type="number" name="mId" value="<%= m.getmId() %>" readonly><br>
		moviename<input type="text" name="mName" value="<%= m.getmName() %>"><br>
		movieprice<input type="number" name="mPrice" value="<%= m.getmPrice() %>"><br>
		movierating<input type="number" name="mRatting" value="<%= m.getmRatting() %>"><br>
		moviegenre<input type="text" name="mGenre" value="<%= m.getmGenre() %>"><br>
		
		
		movieimage<input type="file" name="mImage"><br>
		<input type="submit">
		
		
		<% String base64image = new String(Base64.getEncoder().encode(m.getmImage())); %>
		<img  src="data:image/jpeg;base64 , <%= base64image %>" height="150px" width="100px" >
	</form>
	
		

</body>
</html>