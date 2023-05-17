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
    public DataSource dataSource;
    
    public ZipcodeDAO() {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb1");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<ZipcodeTO> zipcodeList(String strDong) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ArrayList<ZipcodeTO> dong = new ArrayList<>();
        
        try {
            conn = this.dataSource.getConnection();
            String sql = "SELECT zipcode, sido, gugun, dong, bunji, ri FROM zipcode WHERE dong LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + strDong + "%");
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                ZipcodeTO to = new ZipcodeTO();
                to.setZipcode(rs.getString("zipcode"));
                to.setSido(rs.getString("sido"));
                to.setGugun(rs.getString("gugun"));
                to.setDong(rs.getString("dong"));
                to.setBunji(rs.getString("bunji"));
                to.setRi(rs.getString("ri"));
                dong.add(to);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return dong;
    }
}
