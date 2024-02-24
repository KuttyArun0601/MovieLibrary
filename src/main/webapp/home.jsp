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
	       
        *{
            
            padding: 0px;
            margin: 0px;
        }
        body{
            background-color: rgb(231, 213, 248);
            
        }
        #p{
        	width: 218vh;
        }
        
        #p_nav{
            display: flex;
            box-shadow: 1px 1px 25px rgb(195, 0, 255);
        }
        a{
            text-decoration: none;
        }
        
        #p_nav #nav_left {
           position: relative;
            width: 40%;
            padding: 20px;
            animation-name: navleft;
            animation-duration: 3s;
            left: 30px;
        }
        @keyframes navleft {
            0%{
                left: -350px;
            }
            100%{
                left: 30px;
            }
            
        }
        #p_nav #nav_right{
            width: 55%;
            display: flex;
            justify-content: end;
            align-items: center;
            gap: 60px;
        }
        #p_nav #nav_right a{
            border-radius: 10px;
            padding: 10px;
            transition: 1s;
            color: rgb(5, 5, 204);
            font-size: large;
        }
        #p_nav #nav_right a:hover{
            box-shadow: 1px 1px 15px rgb(200, 9, 238);
            font-size: larger;
            font-weight: bold;
            background-color: rgb(243, 236, 227);
        }
        
        #p_content, #p ul{

            padding: 20px 35px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr ;
            gap: 20px;
        }
        #p_content .img-container{
    
            background-color: rgb(224, 191, 240);
            width: 300px;
            height: 450px;
            border-radius: 40px;
            transition: 0.6s;
        }
        #p_content .img-container:hover{
            box-shadow: 1px 1px 25px black;
        }
	    #p_content #details{
            display: flex;
            justify-content: center;
            gap: 20px;
            font-size: 20px;
            margin-top: 15px;
            line-height: 30px;
        }
        #p_content img{
            height: 150px;
            width: 300px;
            border-top-right-radius: 40px;
            border-top-left-radius: 40px;
        }
        #p_content h2{
            margin-top: 10px;
            text-align: center;
            font-size: 30px;
            font-family: cursive;
            filter: drop-shadow(1px 1px 1px rgb(100, 25, 25));
        }
        #btn a{
            color: rgb(27, 46, 218);
        }
        #btn{
           
            text-align: center;
            margin-top: 30px;
            
        }
        .btns{
           
            padding: 10px 20px;
            border-radius: 15px;
            transition: 0.5s;
            font-size: large;
        }
        .btns:hover{
            background-color: rgb(235, 218, 194);
            font-size: 22px;
            font-weight: bold;
            box-shadow: 1px 1px 10px rebeccapurple;
        }
	
</style>
</head>
<body>
	
    <div id="p">
        <div id="p_nav">
            <div id="nav_left">
                <h1>Welcome to Admin home page</h1>
            </div>
            <div id="nav_right">
                <a href="addmovie.jsp">add movie</a>
                <a href="#">Logout</a>
            </div>
        </div>
        <ul type="none">
        	<% List<MovieDto> movie=(List)request.getAttribute("movies"); %>
         	<% for(MovieDto m : movie){ %>
        		<li>
        			<div id="p_content">
            			<div class="img-container" id="img1">
            	 			<%String base64image = new String(Base64.getEncoder().encode(m.getmImage())); %>
                			<img src="data:image/jpeg;base64,<%=base64image%>" alt="" >
                			<h2> <%=m.getmId() %> <%=m.getmName() %></h2>
                			<div id="details">
                    			<div class="detail" id="key">
                    				<p>price :</p>
                        			<p>genere :</p>
                        			<p>ratting :</p>
                        
                    			</div>
                    			<div class="detail" id="value">
                        			<p><%=m.getmPrice() %></p>
                        			<p><%=m.getmGenre() %></p>
                        			<p><%=m.getmRatting() %></p>
                    			</div>
                    
                			</div>
                		<div id="btn">
                    		<a href="editmovie?id=<%=m.getmId()%>" class="btns" id="btn_edit">edit</a>
                    		<a href="deletemovie?id=<%=m.getmId()%>" class="btns" id="btn_delete">delete</a>
                		</div>
    
            		</div>
        		</li>
            <%} %>
        </div> 
        </ul>
    </div>
</body>
</html>