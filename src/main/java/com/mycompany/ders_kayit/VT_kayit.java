package com.mycompany.ders_kayit;
//Kullanıcı adının olup olmadığını kontrol ediyor
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VT_kayit {
    public static boolean kullaniciadiVarmi(String name, String surname, String username, String password, String kimlikno, String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM ogrenciler WHERE kullaniciadi=? OR kimlikno=? OR email=?";
            ps = con.prepareStatement(query);
            
            ps.setString(1, username);
            ps.setString(2, kimlikno);
            ps.setString(3, email);

            rs = ps.executeQuery();
            
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
    
    public static boolean OgretimElemaniVarmi(int id, String kimlikno, String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM ogretim_elemanlari WHERE ogretimelemani_id=? OR kimlikno=? OR email=?";
            ps = con.prepareStatement(query);
            
            ps.setInt(1, id);
            ps.setString(2, kimlikno);
            ps.setString(3, email);

            rs = ps.executeQuery();
            
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
    
    public static boolean DersVarMi(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM dersler WHERE ders_id=?";
            ps = con.prepareStatement(query);
            
            ps.setInt(1, id);

            rs = ps.executeQuery();
            
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
    
    public static boolean DersOzellikVarMi(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM dersozellikleri WHERE id=?";
            ps = con.prepareStatement(query);
            
            ps.setInt(1, id);

            rs = ps.executeQuery();
            
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
}
