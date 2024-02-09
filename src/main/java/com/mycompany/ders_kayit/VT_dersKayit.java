package com.mycompany.ders_kayit;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VT_dersKayit {

    private static String md5(String input) {
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
            return null;
        }
    }

    public static boolean kullaniciVarmi(String username, String password, String role) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query;

            if ("ogrenci".equals(role)) {
                query = "SELECT * FROM ogrenciler WHERE kullaniciadi=? AND sifre=?";
            } else if ("ogretmen".equals(role)) {
                query = "SELECT * FROM ogretim_elemanlari WHERE email=? AND sifre=?";
            } else if ("admin".equals(role)) {
                query = "SELECT * FROM admin WHERE kullaniciadi=? AND sifre=?";
            } else {
                return false;
            }

            ps = con.prepareStatement(query);
            ps.setString(1, username);

            //Gelen şifreyi md5 ile hash'ler
            ps.setString(2, md5(password));

            rs = ps.executeQuery();

            return rs.next();  //doğruysa true, yanlışsa false
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