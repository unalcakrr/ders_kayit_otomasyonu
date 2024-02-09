package com.mycompany.ders_kayit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VT_dersProgrami {

    public static List<Map<String, String>> getDersProgrami() {
        List<Map<String, String>> dersProgrami = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM dersler");

            while (rs.next()) {
                Map<String, String> ders = new HashMap<>();
                ders.put("baslangic_saat", rs.getString("baslangic_saat"));
                ders.put("bitis_saat", rs.getString("bitis_saat"));
                ders.put("ders_id", rs.getString("ders_id"));
                ders.put("ders_kodu", rs.getString("ders_kodu"));
                ders.put("sube", rs.getString("sube"));
                ders.put("ders_adi", rs.getString("ders_adi"));
                ders.put("derslik", rs.getString("derslik"));
                ders.put("program", rs.getString("program"));
                ders.put("ogretimelemani", rs.getString("ogretimelemani"));
                ders.put("kontenjan", rs.getString("kontenjan"));
                ders.put("gun", rs.getString("gun"));

                dersProgrami.add(ders);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dersProgrami;
    }
    
    public static List<Map<String, String>> getSubeler(String ders_kod) {
        List<Map<String, String>> dersler = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM dersler WHERE ders_kodu = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, ders_kod);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, String> ders = new HashMap<>();
                ders.put("ders_id", rs.getString("ders_id"));
                ders.put("ders_kodu", rs.getString("ders_kodu"));
                ders.put("sube", rs.getString("sube"));
                ders.put("ders_adi", rs.getString("ders_adi"));
                ders.put("ogretimelemani", rs.getString("ogretimelemani"));
                
                
                //ders.put("kontenjan", rs.getString("kontenjan"));
                //ders.put("gun", rs.getString("gun"));

                dersler.add(ders);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dersler;
    }

    public static List<Map<String, String>> getDersProgramiByUsername(String username) {
        List<Map<String, String>> dersProgrami = new ArrayList<>();

        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String sql = "SELECT * FROM dersler WHERE FIND_IN_SET(?, ogrenciler_kadi) > 0";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Map<String, String> ders = new HashMap<>();
                ders.put("baslangic_saat", rs.getString("baslangic_saat"));
                ders.put("bitis_saat", rs.getString("bitis_saat"));
                ders.put("ders_id", rs.getString("ders_id"));
                ders.put("ders_kodu", rs.getString("ders_kodu"));
                ders.put("sube", rs.getString("sube"));
                ders.put("ders_adi", rs.getString("ders_adi"));
                ders.put("derslik", rs.getString("derslik"));
                ders.put("program", rs.getString("program"));
                ders.put("ogretimelemani", rs.getString("ogretimelemani"));
                ders.put("kontenjan", rs.getString("kontenjan"));
                ders.put("gun", rs.getString("gun"));

                dersProgrami.add(ders);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dersProgrami;
    }

    
}
