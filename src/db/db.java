package db;
import java.sql.*;

public class db {
	 /* 	private String dbDriver="com.microsoft.jdbc.sqlserver.SQLServerDriver";

	 private String sConnStr = "jdbc:microsoft:sqlserver://localhost:1433;databasename=liuyou"; 
	  public Connection connect = null;
	  public ResultSet rs=null;
	  public db() throws Exception {
			    try {
		//	     
		//	      Class.forName(dbDriver).newInstance(); 
		//	     
		//	      connect = DriverManager.getConnection(sConnStr,"sa","123456"); 
			
			    catch (Exception ex) {
			    	ex.printStackTrace();
			      System.out.println("数据库连接异常");
			    }
			  }
	  }
	
	 
	  public ResultSet executeQuery(String sql) {
			try{
				connect=DriverManager.getConnection(sConnStr,"sa","123456");
				Statement stmt=connect.createStatement();
				rs=stmt.executeQuery(sql);
			}catch(SQLException ex){
				System.err.println(ex.getMessage());
			}
			return rs;
		}
	  public void executeUpdate(String sql)
	    {
	    	
	    	Statement stmt=null;
	    	rs=null;
	    	try
	    	{   connect=DriverManager.getConnection(sConnStr,"sa","123456");
	    		stmt=connect.createStatement();
	    		stmt.executeUpdate(sql);
	    		stmt.close();
	    		connect.close();
	    		
	    	
	    	}
	    	catch(SQLException ex)
	    	{
	    		System.err.println(ex.getMessage());
	    		
	    		
	    	}
	    
	    	
	    }*/
	public static String dbClassName = "com.mysql.jdbc.Driver";
	public static String dbUrl = "jdbc:mysql://localhost:3306/lyou?useUnicode=true&characterEncoding=UTF-8";
	public static String dbUser = "root";
	public static String dbPwd = "root";
	public static String second = null;
	public static Connection conn = null;
		
		public db() {
			try {
				if (conn == null) {
					Class.forName(dbClassName).newInstance();
					conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
				}
				
					return;
			} catch (Exception ee) {
				ee.printStackTrace();
				System.out.println("数据库连接异常");
			}

		}
		public static ResultSet executeQuery(String sql) {
			try {
				if(conn==null)
				new db();
				return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE).executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
			}
		}
		public static int executeUpdate(String sql) {
			
			try {
				if(conn==null)
					new db();
				return conn.createStatement().executeUpdate(sql);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				//if(e.getMessage().equals("[Microsoft][SQLServer 2000 Driver for JDBC][SQLServer]DELETE 锟斤拷锟斤拷锟� COLUMN REFERENCE 约锟斤拷 'FK_TB_BORRO_REFERENCE_TB_BOOKI' 锟斤拷突锟斤拷锟矫筹拷突锟斤拷锟斤拷锟斤拷锟斤拷锟捷匡拷 'db_library'锟斤拷锟斤拷 'tb_borrow', column 'bookISBN'锟斤拷"))
					
				return -1;
			} finally {
			}
		}
		
		public static void close() {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				conn = null;
			}
		}
}
	


