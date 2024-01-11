package DAOs;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import DTOs.AdminDto;
import DTOs.MovieDto;

public class Dao1 
{	
	public Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("JDBC:mysql://localhost:3306/movies_library","root","groot");
	}
	
	public int saveAdmin(AdminDto admin) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst = con.prepareStatement("insert into admin values(?,?,?,?,?)");
		pst.setInt(1, admin.getaId());
		pst.setString(2, admin.getaName());
		pst.setLong(3, admin.getaContact());
		pst.setString(4, admin.getaEmail());
		pst.setString(5, admin.getaPassword());
		
		return pst.executeUpdate();
		
	}
	
	public AdminDto findByEmail(String aemail) throws ClassNotFoundException, SQLException
	{
		Connection con =getConnection();
		
		PreparedStatement pst = con.prepareStatement("select * from admin where aEmail=?");
		pst.setString(1, aemail);
		
		ResultSet rs = pst.executeQuery();

		rs.next();
		
		AdminDto admin = new AdminDto();
		admin.setaId(rs.getInt(1));
		admin.setaName(rs.getString(2));
		admin.setaContact(rs.getLong(3));
		admin.setaEmail(rs.getString(4));
		admin.setaPassword(rs.getString(5));
		
		return admin;
		
	}
	
	public int saveMovie(MovieDto movies) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst =con.prepareStatement("insert into movies values(?,?,?,?,?,?)");
		pst.setInt(1, movies.getmId());
		pst.setString(2, movies.getmName());
		pst.setDouble(3, movies.getmPrice());
		pst.setFloat(4, movies.getmRatting());
		pst.setString(5, movies.getmGenre());
		
		//blob java.sql pack - interface
		Blob imgblob=new SerialBlob(movies.getmImage());
		pst.setBlob(6, imgblob);
		
		return pst.executeUpdate();
	}
	
	public List<MovieDto> getAllMovie() throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst = con.prepareStatement("select * from movies");
		ResultSet  rs =pst.executeQuery();
		
		List<MovieDto> movies = new ArrayList<MovieDto>();
		
		while(rs.next())
		{
			MovieDto m =new MovieDto();
			m.setmId(rs.getInt(1));
			m.setmName(rs.getString(2));
			m.setmPrice(rs.getDouble(3));
			m.setmRatting(rs.getFloat(4));
			m.setmGenre(rs.getString(5));
			Blob b=rs.getBlob(6);
			byte[] img  =b.getBytes(1, (int)b.length());
			m.setmImage(img);
			movies.add(m);
		}
		return movies;
	}
	
	public int deleteMovie(int id) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("delete from movies where mid = ?");
		pst.setInt(1, id);
		return pst.executeUpdate();
		
	}
	
	public MovieDto findByMovieId(int mId) throws ClassNotFoundException, SQLException
	{
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select * from movies where mid = ?");
		pst.setInt(1, mId);
		ResultSet rs=pst.executeQuery();
		rs.next();
		MovieDto m =new MovieDto();
		m.setmId(rs.getInt(1));
		m.setmName(rs.getString(2));
		m.setmPrice(rs.getDouble(3));
		m.setmRatting(rs.getFloat(4));
		m.setmGenre(rs.getString(5));
		Blob b=rs.getBlob(6);
		byte[] img  =b.getBytes(1, (int)b.length());
		m.setmImage(img);
		
		return m;
		
	}
	
	public int updateMovie(MovieDto movie) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("update movie set moviename=?, movieprice=?,movierating=?,moviegenre=?,movieimage=? where movieid=?");
		
		pst.setInt(6, movie.getmId());
		pst.setString(1, movie.getmName());
		pst.setDouble(2, movie.getmPrice());
		pst.setDouble(3, movie.getmRatting());
		pst.setString(4, movie.getmGenre());
		Blob imageBlob = new SerialBlob(movie.getmImage());
		pst.setBlob(5, imageBlob);
		
		return pst.executeUpdate();
	}
	
	
	
	
}
