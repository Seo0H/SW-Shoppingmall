package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class getConnection {
	String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	String user = "webmaster";
	String pwd = "1234";
	
	Class.forName("org.mariadb.jdbc.Driver");
	DriverManager.getConnection(url, user, pwd);

}
