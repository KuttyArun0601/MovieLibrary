package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOs.Dao1;
import DTOs.AdminDto;
import DTOs.MovieDto;

@WebServlet("/alogin")
public class AdminLogin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String aemail= req.getParameter("username");
		String apassword = req.getParameter("password");
		
		Dao1 dao = new Dao1();
		try {
			AdminDto admin =dao.findByEmail(aemail);
			if(admin!=null)
			{
					if(admin.getaPassword().equals(apassword))
					{
						req.setAttribute("movies", dao.getAllMovie());
						RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
						rd.include(req, resp);
					}
					else {
						req.setAttribute("msgp", "password is wrong");
						RequestDispatcher rd=req.getRequestDispatcher("adminlogin.jsp");
						rd.include(req, resp);
					}
			}
			else {
				req.setAttribute("msge", "email is wrong");
				RequestDispatcher rd=req.getRequestDispatcher("adminlogin.jsp");
				rd.include(req, resp);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
