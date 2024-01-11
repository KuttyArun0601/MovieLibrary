package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOs.Dao1;
import DTOs.MovieDto;

@WebServlet("/editmovie")
public class MovieEdit  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("mId"));
		Dao1 dao =new Dao1();
		
		try {
			MovieDto m =dao.findByMovieId(id);
			
			req.setAttribute("movies", m);
			RequestDispatcher rd =req.getRequestDispatcher("editmovie.jsp");
			rd.include(req, resp);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
