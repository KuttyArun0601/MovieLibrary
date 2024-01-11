<%@page import="java.util.Base64"%>
<%@page import="DTOs.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<style >
	img{
	height: 100px;
	width: 150px;
	}
</style>
</head>
<body>
	<h1>Welcome to home page</h1>
	<% List<MovieDto> movie=(List)request.getAttribute("movies"); %>
	<table >
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Ratting</th>
            <th>Language</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <% for(MovieDto m : movie){ %>
        <tr>
            <td><%=m.getmId() %></td>
            <td><%=m.getmName() %></td>
            <td><%=m.getmPrice() %></td>
            <td><%=m.getmRatting() %></td>
            <td><%=m.getmGenre() %></td>
            <%String base64image = new String(Base64.getEncoder().encode(m.getmImage())); %>
            <td><img  src="data:image/jpeg;base64,<%=base64image%> "></td>
           <td><a href="deletemovie?id=<%=m.getmId()%>">delete</a> </td>
			<td><a href="editmovie?id=<%=m.getmId()%>">edit</a> </td>
        </tr>
        <%} %>
        
    </table>


	<a href="addmovie.jsp">add movie</a>
</body>
</html>