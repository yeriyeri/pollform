package check;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil_ {
	   public static Connection getMySQLConnection() {
	      Connection conn=null;
	      try {
	         Class.forName("com.mysql.jdbc.Driver");
	         String url="jdbc:mysql://localhost:3306/pollform?useUnicode=true&characterEncoding=UTF-8";
	         String user="root";
	         String password="401sql";
	         conn=DriverManager.getConnection(url,user,password);
	      } catch(ClassNotFoundException e){
	         System.out.println("mysql �����̹��� �����ϴ�.");
	      }catch(SQLException e) {
	         System.out.println("������ ���� �Ǵ� ������ ��ġ���� �ʽ��ϴ�.");
	      }
	      
	      return conn;
	   }
	   
	   public static void close(Connection conn) {
	      try {if(conn!=null) {conn.close();}}catch(Exception e) {
	         e.printStackTrace();}
	      }
	   
	   public static void close(Statement stmt) {
	      try {if(stmt!=null) {stmt.close();}}catch(Exception e) {
	         e.printStackTrace();}
	      }
	   public static void close(PreparedStatement pstmt) {
	      try {if(pstmt!=null) {pstmt.close();}}catch(Exception e) {
	         e.printStackTrace();}
	      }
	   
	   public static void close(ResultSet rs) {
	      try {if(rs!=null) {rs.close();}}catch(Exception e) {
	         e.printStackTrace();}
	      }
	   }

