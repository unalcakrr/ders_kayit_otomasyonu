package com.mycompany.ders_kayit;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VT_kullaniciSorgulama {
    public static boolean kullaniciVarMi(String username, String mail) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM ogrenciler WHERE kullaniciadi=? AND email=?";
            ps = con.prepareStatement(query);
            
            ps.setString(1, username);
            ps.setString(2, mail);

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

        //yoksa false döndürür
        return false;
    }
    
    public static boolean ogretmenVarMi(String kimlikno, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM ogretim_elemanlari WHERE email=? AND kimlikno=?";
            ps = con.prepareStatement(query);
            
            ps.setString(1, username);
            ps.setString(2, kimlikno);

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

        //yoksa false döndürür
        return false;
    }
    
    public static String sifreDegistir(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            
            
            String md5Password = hashMD5(password);

            String updateQuery = "UPDATE ogrenciler SET sifre=? WHERE kullaniciadi=?";
            ps = con.prepareStatement(updateQuery);
            //ps.setString(1, password);
            ps.setString(1, md5Password); //yenisifre md5

            ps.setString(2, username);
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                return "Şifre başarıyla güncellendi!\nAna sayfaya yönlendiriliyor...";
            } else {
                return "Şifre güncellenemedi!\nAna sayfaya yönlendiriliyor...";
            }
            
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

        return "Hata";
    }
    
    public static String sifreDegistirOgretmen(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            
            String md5Password = hashMD5(password);
            
            String updateQuery = "UPDATE ogretim_elemanlari SET sifre=? WHERE email=?";
            ps = con.prepareStatement(updateQuery);
            //ps.setString(1, password);  // Yeni şifre
            ps.setString(1, md5Password); //yenisifre md5
            ps.setString(2, username);
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                return "Şifre başarıyla güncellendi!\nAna sayfaya yönlendiriliyor...";
            } else {
                return "Şifre güncellenemedi!\nAna sayfaya yönlendiriliyor...";
            }
            
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

        return "Hata";
    }
    
    public static String sifreDegistirMenuden(String username, String password, String role) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            //Gelen şifreyi md5 ile hash'leme
            String md5Password = hashMD5(password);

            if ("ogrencigirisi".equals(role)) {
                String updateQuery = "UPDATE ogrenciler SET sifre=? WHERE kullaniciadi=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, md5Password);
                ps.setString(2, username);
            } else if ("ogretmengirisi".equals(role)) {
                String updateQuery = "UPDATE ogretim_elemanlari SET sifre=? WHERE email=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, md5Password);
                ps.setString(2, username);
            } else if ("admingirisi".equals(role)){
                String updateQuery = "UPDATE admin SET sifre=? WHERE kullaniciadi=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, md5Password);
                ps.setString(2, username);
            }

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
            return "<div style='background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; padding: 8px; margin-bottom: 10px;'>"
                    + "Şifre başarıyla güncellendi!"
                    + "</div>";
        } else {
            return "<div style='background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 8px; margin-bottom: 10px;'>"
                    + "Şifre güncellenemedi!"
                    + "</div>";
        }

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

        return "Hata";
    }

    private static String hashMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("MD5 hashing failed.", e);
        }
    }
}