package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAOs.Dao1;
import DTOs.MovieDto;
@WebServlet("/savemovie")
@MultipartConfig(maxFileSize = 10 * 1024 * 1024)
public class AddMovie extends HttpServlet

{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		Part p =req.getPart("mImage");
		
		MovieDto m =new MovieDto();
		m.setmId(Integer.parseInt(req.getParameter("mId")));
		m.setmName(req.getParameter("mName"));
		m.setmPrice(Double.parseDouble(req.getParameter("mPrice")));
		m.setmRatting(Float.parseFloat(req.getParameter("mRatting")));
		m.setmGenre(req.getParameter("mGenre"));
		m.setmImage(p.getInputStream().readAllBytes());
		
		Dao1 dao =new Dao1();
		
		try {
			dao.saveMovie(m);
			
			req.setAttribute("movies", dao.getAllMovie());
			RequestDispatcher rd =req.getRequestDispatcher("home.jsp");
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
