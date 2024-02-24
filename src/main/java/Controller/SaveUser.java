package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOs.UserDao;
import DTOs.UserDto;

@WebServlet("/usignup")
public class SaveUser extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDto u = new UserDto();
		u.setuId(Integer.parseInt(req.getParameter("uid")));
		u.setuName(req.getParameter("uname"));
		u.setuContact(Long.parseLong(req.getParameter("ucontact")));
		u.setuEmail(req.getParameter("aemail"));
		u.setuPassword(req.getParameter("upassword"));
		
		UserDao uDao= new UserDao();
		
		try {
			uDao.saveAdmin(u);
			
			RequestDispatcher rd= req.getRequestDispatcher("userlogin.jsp");
			rd.include(req, resp);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
