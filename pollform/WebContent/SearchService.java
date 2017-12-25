package check;


import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

import check.SearchDao;


public class SearchService {

 private static SearchService  instance =

   new SearchService ();




 public static SearchService  getInstance() {

  return instance;

 }




 private SearchService () {

 }

 

 public String  searchId(String Name, String Id) throws Exception {

  Connection conn = null;

        Class.forName("com.mysql.jdbc.Driver");

  try {

            String jdbcDriver = "jdbc:mysql://localhost:3306/pollform";

            String dbUser = "root";

            String dbPass = "401sql";

   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

            //DAO 객체를 생성 시 Connection 전달 

   SearchDao SearchDao = new SearchDao(conn);

            String id = SearchDao.searchId(Name, Id);

        //    System.out.println(name);

   return (id);

   } 

  finally {

   if (conn != null) try { conn.close(); } catch(SQLException ex) {};

  }

 }

 public String  searchPwd(String Id, String Phone) throws Exception {

  Connection conn = null;

        Class.forName("com.mysql.jdbc.Driver");

  try {

            String jdbcDriver = "jdbc:mysql://localhost:3306/pollform";

            String dbUser = "root";

            String dbPass = "401sql";

   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

            //DAO 객체를 생성 시 Connection 전달 

   SearchDao SearchDao = new SearchDao(conn);

            String passwd = SearchDao.searchPwd(Id, Phone);

        //    System.out.println(name);

   return (passwd);

   } 

  finally {

   if (conn != null) try { conn.close(); } catch(SQLException ex) {};

  }

 }




}







