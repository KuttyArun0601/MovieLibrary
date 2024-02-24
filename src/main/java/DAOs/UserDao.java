package DAOs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTOs.UserDto;

public class UserDao {

	public Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("JDBC:mysql://localhost:3306/movies_library","root","groot");
	}
	
	public int saveAdmin(UserDto user) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst = con.prepareStatement("insert into user values(?,?,?,?,?)");
		pst.setInt(1, user.getuId());
		pst.setString(2, user.getuName());
		pst.setLong(3, user.getuContact());
		pst.setString(4, user.getuEmail());
		pst.setString(5, user.getuPassword());
		
		return pst.executeUpdate();
		
	}
	public UserDto findByEmail(String uemail) throws ClassNotFoundException, SQLException
	{
		Connection con =getConnection();
		
		PreparedStatement pst = con.prepareStatement("select * from user where uEmail=?");
		pst.setString(1, uemail);
		
		ResultSet rs = pst.executeQuery();

		rs.next();
		
		UserDto user = new UserDto();
		user.setuId(rs.getInt(1));
		user.setuName(rs.getString(2));
		user.setuContact(rs.getLong(3));
		user.setuEmail(rs.getString(4));
		user.setuPassword(rs.getString(5));
		
		return user;
		
	}
	
	
	
}
