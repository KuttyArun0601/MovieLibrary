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
import DAOs.UserDao;
import DTOs.UserDto;

@WebServlet("/ulogin")
public class UserLogin extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uemail= req.getParameter("username");
		String upassword = req.getParameter("password");
		
		UserDao uDao = new UserDao();
		Dao1 dao = new Dao1();
		
		try {
			UserDto user=uDao.findByEmail(uemail);
			if(user!=null)
			{
				if(user.getuPassword().equals(upassword))
				{
					req.setAttribute("movie",dao.getAllMovie() );
					RequestDispatcher rd=req.getRequestDispatcher("uhome.jsp");
					rd.include(req, resp);
				}
				else {
					req.setAttribute("msgp", "password is wrong");
					RequestDispatcher rd=req.getRequestDispatcher("userlogin.jsp");
					rd.include(req, resp);
				}
			}
			else {
				req.setAttribute("msge", "email is wrong");
				RequestDispatcher rd=req.getRequestDispatcher("userlogin.jsp");
				rd.include(req, resp);
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
