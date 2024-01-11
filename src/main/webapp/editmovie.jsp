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
		movieid<input type="text" name="movieid" value="<%= m.getmId() %>" readonly><br>
		moviename<input type="text" name="moviename" value="<%= m.getmName() %>"><br>
		movieprice<input type="text" name="movieprice" value="<%= m.getmPrice() %>"><br>
		movierating<input type="text" name="movierating" value="<%= m.getmRatting() %>"><br>
		moviegenre<input type="text" name="moviegenre" value="<%= m.getmGenre() %>"><br>
		
		
		movieimage<input type="file" name="movieimage"><br>
		<input type="submit">
		
		
		<% String base64image = new String(Base64.getEncoder().encode(m.getmImage())); %>
		<img  src="data:image/jpeg;base64 , <%= base64image %>" height="150px" width="100px" >
	</form>
	
		

</body>
</html>