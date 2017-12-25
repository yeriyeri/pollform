package check;
import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;
import check.SearchService;



public class SearchDao {

  private Connection conn;

     

     public SearchDao(Connection conn){

         this.conn = conn;

      }

     

     public String searchId(String Name, String Phone) throws SQLException {

      PreparedStatement pstmt = null;

         ResultSet rs = null;

   try {

    pstmt = conn.prepareStatement( 

      "select id from member " +

      "where name = ? and phone = ? ");

    pstmt.setString(1, Name);

       pstmt.setString(2, Phone);

    rs = pstmt.executeQuery();

             if( rs.next() )

               return (rs.getString("id"));

              else

                 return null;

   } finally {

    if(rs!=null)try { rs.close(); } catch(SQLException ex) {}

    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}

   }




   

  }

     public String searchPwd(String Id, String Phone) throws SQLException {

      PreparedStatement pstmt = null;

         ResultSet rs = null;

   try {

    pstmt = conn.prepareStatement( 

      "select passwd from member " +

      "where id = ? and phone = ? ");

    pstmt.setString(1, Id);

       pstmt.setString(2, Phone);

    rs = pstmt.executeQuery();

             if( rs.next() )

               return (rs.getString("passwd"));

              else

                 return null;

   } finally {

    if(rs!=null)try { rs.close(); } catch(SQLException ex) {}

    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}

   }




  }




}



