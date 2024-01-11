package Controller;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Del 
{
	public static void main(String[] args) throws SQLException {
		
		Scanner  sc = new Scanner(System.in);
		Driver d = new com.mysql.cj.jdbc.Driver();
		
		System.out.println(" User Name = root");
		System.out.println("Enter Password");
		String password = sc.nextLine();
		Connection conn = DriverManager.getConnection("JDBC:mysql://localhost:3306/movies_library", "root", password);
		
		System.out.println("Enter how many rows want delete");
		int rows = sc.nextInt();
		PreparedStatement pst = conn.prepareStatement("delete from admin where aid = ?");
		int count = 0;
		for (int i = 0; i < rows; i++) 
		{
			
			System.out.println("enter the id want to delete");
			int i1= sc.nextInt();
			
			pst .setInt(1, i1);
			
			int result =pst.executeUpdate();
		
			
			count++;
		}
		System.out.println(count+"rows are deleted");
		sc.close();
		conn.close();
	}

}
