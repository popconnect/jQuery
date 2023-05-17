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

public class ZipcodeDAO {
    private DataSource dataSource;

    public ZipcodeDAO() {
    	try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/mariadb1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
    }

    public ArrayList<ZipcodeTO> sidoList() {
        ArrayList<ZipcodeTO> lists = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            String sql = "SELECT DISTINCT sido FROM zipcode";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ZipcodeTO to = new ZipcodeTO();
                to.setSido(rs.getString("sido"));
                lists.add(to);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return lists;
    }
    
    public ArrayList<ZipcodeTO> gugunList(String strSido) {

    	ArrayList<ZipcodeTO> lists = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			conn = dataSource.getConnection();
			String sql = "SELECT DISTINCT gugun FROM zipcode WHERE sido = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strSido);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			    ZipcodeTO to = new ZipcodeTO();
			    to.setGugun(rs.getString("gugun"));
			    lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        return lists;
    }

    public ArrayList<ZipcodeTO> dongList(String strSido, String strGugun) {
    	ArrayList<ZipcodeTO> lists = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			conn = dataSource.getConnection();
			String sql = "SELECT DISTINCT dong FROM zipcode WHERE sido = ? and gugun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strSido);
			pstmt.setString(2, strGugun);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			    ZipcodeTO to = new ZipcodeTO();
			    to.setDong(rs.getString("dong"));
			    lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        return lists;
    }
    
    public ArrayList<ZipcodeTO> zipcodeList(String strSido, String strGugun, String strDong) {
    	ArrayList<ZipcodeTO> lists = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			conn = dataSource.getConnection();
			String sql = "SELECT DISTINCT zipcode, sido, gugun, dong, ri, bunji FROM zipcode WHERE sido = ? and gugun = ? and dong = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strSido);
			pstmt.setString(2, strGugun);
			pstmt.setString(3, strDong);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			    ZipcodeTO to = new ZipcodeTO();
			    to.setZipcode(rs.getString("zipcode"));
			    to.setSido(rs.getString("sido"));
			    to.setGugun(rs.getString("gugun"));
			    to.setDong(rs.getString("dong"));
			    to.setRi(rs.getString("ri"));
			    to.setBunji(rs.getString("bunji"));
			    lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        return lists;
    }
    
}
