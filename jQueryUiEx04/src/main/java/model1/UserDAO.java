package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource dataSource;

    public UserDAO() {
    	try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/mariadb1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
    }
    
    public ArrayList<UserTO> viewList() {
    	ArrayList<UserTO> lists = new ArrayList<>();
    	
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			conn = dataSource.getConnection();
			String sql = "SELECT SEQ, NAME, EMAIL, ADDRESS, WDATE FROM USER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			    UserTO to = new UserTO();
			    to.setSeq(rs.getString("seq"));
			    to.setName(rs.getString("name"));
			    to.setEmail(rs.getString("email"));
			    to.setAddress(rs.getString("address"));
			    to.setWdate(rs.getString("wdate"));
			    lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
        
    	return lists;
    }
    
    public int userWrite(UserTO to) {
    	Connection conn = null;
		PreparedStatement pstmt = null;
	       
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
	       
			String sql = "insert into user values ( 0, ?, ?, ?, ?, now() )";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getName() );
			pstmt.setString( 2, to.getPassword() );
			pstmt.setString( 3, to.getEmail() );
			pstmt.setString( 4, to.getAddress() );
	           
			int result = pstmt.executeUpdate();
			if( result == 1 ) {
				flag = 0;
			}
		} catch( SQLException e ) {
			System.out.println( e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return flag;
	}
    
    public UserTO userModify(String strSeq) {
    	UserTO to = new UserTO();
    	
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			conn = dataSource.getConnection();
			String sql = "SELECT SEQ, NAME, EMAIL, ADDRESS, WDATE FROM USER WHERE SEQ = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strSeq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			    to.setSeq(rs.getString("seq"));
			    to.setName(rs.getString("name"));
			    to.setEmail(rs.getString("email"));
			    to.setAddress(rs.getString("address"));
			    to.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return to;
    }
    
    public int Modify_ok(UserTO to) {
    	
    	Connection conn = null;
		PreparedStatement pstmt = null;
	       
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
	       
			String sql = "UPDATE user SET name=?, email=?, address=? WHERE SEQ=? AND PASSWORD=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getName());
			pstmt.setString(2, to.getEmail());
			pstmt.setString(3, to.getAddress());
			pstmt.setString(4, to.getSeq());
			pstmt.setString(5, to.getPassword());


			int result = pstmt.executeUpdate();
			if( result == 1 ) {
				flag = 0;
			}
		} catch( SQLException e ) {
			System.out.println( e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return flag;
    }
    
    public int userDelete_Ok(UserTO to) {
    	
    	Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println(to.getSeq());
		System.out.println(to.getPassword());
	       
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
	       
			String sql = "DELETE FROM user WHERE SEQ=? AND PASSWORD=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.setString(2, to.getPassword());

			int result = pstmt.executeUpdate();
			if( result == 1 ) {
				flag = 0;
			}
		} catch( SQLException e ) {
			System.out.println( e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return flag;
    }
}
