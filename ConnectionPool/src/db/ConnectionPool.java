package db;

import java.sql.*;
import java.util.Vector;

public class ConnectionPool {
	private Vector<Connection> pool;
	private int poolSize=10;
	private static ConnectionPool instance=null;
	
	public static ConnectionPool getInstance() {
		if(instance==null) {
			instance=new ConnectionPool();
		}
		return instance;
	}
	private ConnectionPool() {
		pool=new Vector<Connection>(poolSize);
		Connection conn=null;
		for(int i=0;i<poolSize;i++) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:odbc:tt");
				pool.add(conn);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public synchronized Connection getConnection() {
		if(pool.size()>0) {
			Connection conn=pool.get(0);
			pool.remove(conn);
			return conn;
		}else {
			return null;
		}
	}
	public synchronized void release(Connection conn) {
		pool.add(conn);
	}
}
