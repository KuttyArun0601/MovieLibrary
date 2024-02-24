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


@WebServlet("/updatemovie")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class UpdateMovie extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int movieid= Integer.parseInt(req.getParameter("mId"));
		String moviename = req.getParameter("mName");
		double movieprice = Double.parseDouble(req.getParameter("mPrice"));
		double movierating =  Double.parseDouble(req.getParameter("mRatting"));
		String moviegenre = req.getParameter("mGenre");
		Part imagepart  = req.getPart("mImage");
		
		MovieDto movie = new MovieDto();
		movie.setmId(movieid);
		movie.setmGenre(moviegenre);
		
		movie.setmPrice(movieprice);
		movie.setmRatting((float) movierating);
		movie.setmName(moviename);
		
		
//		if(imagepart.getInputStream().readAllBytes().length>0)
//		{
//			movie.setmImage(imagepart.getInputStream().readAllBytes());
//		}
		
		
		Dao1 dao = new Dao1();
		
		
		try {
			
			if(imagepart.getSize()>0)
			{
				movie.setmImage(imagepart.getInputStream().readAllBytes());
				dao.updateMovie(movie);
				
				req.setAttribute("movies", dao.getAllMovie());
				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
				dispatcher.include(req, resp);
			}
			else
			{
				MovieDto dbmovie=dao.findByMovieId(movieid);
				movie.setmImage(dbmovie.getmImage());
				dao.updateMovie(movie);
				
				req.setAttribute("movies", dao.getAllMovie());
				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
				dispatcher.include(req, resp);
			}
			
//			dao.saveMovie(movie);
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
