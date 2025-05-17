package delivery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
	
	public static boolean adddelivery(String name,String address,String phone)
	{
		boolean isSuccess = false;
		
		String url = "jdbc:mysql://localhost:3306/delivery_system";
		String username = "root";
		String password = "@Hasindu1998";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			Statement stmt = con.createStatement();
			
			String sql = "INSERT INTO delivery VALUES (0,'"+name+"','"+address+"','"+phone+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	
	public static List<delivery> getAllDeliveries() {
        List<delivery> deliveries = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/delivery_system";
        String username = "root";
        String password = "@Hasindu1998";
        

        try {
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM delivery";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) 
            {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");

                deliveries.add(new delivery(id, name, address, phone));
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return deliveries;
    }
	
	public static boolean updatedelivery(int id,String name,String address,String phone)
	{
		boolean isSuccess = false;
		
		String url = "jdbc:mysql://localhost:3306/delivery_system";
		String username = "root";
		String password = "@Hasindu1998";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			Statement stmt = con.createStatement();
			
			String sql = "update delivery set name = '"+name+"', address = '"+address+"', phone  = '"+phone+"' where id = '"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}


public static boolean deletedelivery(int id)
{
	boolean isSuccess = false;
	
	String url = "jdbc:mysql://localhost:3306/delivery_system";
	String username = "root";
	String password = "@Hasindu1998";
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		Statement stmt = con.createStatement();
		
		String sql = "delete from delivery where id = '"+id+"'";
		
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0)
		{
			isSuccess = true;
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	return isSuccess;
}
}


