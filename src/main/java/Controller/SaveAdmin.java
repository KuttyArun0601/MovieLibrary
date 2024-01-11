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
import DTOs.AdminDto;

@WebServlet("/asignup")
public class SaveAdmin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDto a=new AdminDto();
		a.setaId(Integer.parseInt(req.getParameter("aid")));
		a.setaName(req.getParameter("aname"));
		a.setaContact(Long.parseLong(req.getParameter("acontact")));
		a.setaEmail(req.getParameter("aemail"));
		a.setaPassword(req.getParameter("apassword"));
		
		Dao1 dao1= new Dao1();
		
		try {
			
			
			dao1.saveAdmin(a);
			
			RequestDispatcher rd =req.getRequestDispatcher("adminlogin.jsp");
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
