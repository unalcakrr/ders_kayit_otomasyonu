package com.mycompany.ders_kayit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class VT_ogretmenDersler {
    public static boolean derseAta(String name, String surname, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "INSERT INTO ogrenciler (ad, soyad, kullaniciadi, sifre, email) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, surname);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Derse hoca başarıyla kaydedildi.");
            } else {
                System.out.println("Derse hoca kaydedilemedi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    public static Map<String, String> getDanismanBilgileri(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Map<String, String> danismanBilgileri = new HashMap<>();

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT danisman FROM ogrenciler WHERE kullaniciadi = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String danismanAdSoyad = rs.getString("danisman");

                //danışmanın adını ve soyadını boşluk ile ayırma ve array'e kaydetme
                String[] danismanAdSoyadArray = danismanAdSoyad.split(" ");
                String danismanAd = danismanAdSoyadArray[0];
                String danismanSoyad = "";

                // Eğer sadece ad olarak kaydedilmişse
                if (danismanAdSoyadArray.length > 1) {
                    danismanSoyad = danismanAdSoyadArray[1];
                }

                // Danışmanın öğretim elemanları arasında var olup olmadığını kontrol et
                if (ogretimElemaniVarMi(danismanAd, danismanSoyad)) {
                    // Danışman varsa ikinci sorguyu gerçekleştir
                    String danismanQuery = "SELECT ad, soyad, email, telefon, fakulte FROM ogretim_elemanlari WHERE ad = ? AND soyad = ?";
                    ps = con.prepareStatement(danismanQuery);
                    ps.setString(1, danismanAd);
                    ps.setString(2, danismanSoyad);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        danismanBilgileri.put("ad", rs.getString("ad"));
                        danismanBilgileri.put("soyad", rs.getString("soyad"));
                        danismanBilgileri.put("email", rs.getString("email"));
                        danismanBilgileri.put("telefon", rs.getString("telefon"));
                        danismanBilgileri.put("fakulte", rs.getString("fakulte"));
                    }
                }
            }
        } catch (SQLException e) {
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

        return danismanBilgileri;
    }

    private static boolean ogretimElemaniVarMi(String ad, String soyad) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "SELECT * FROM ogretim_elemanlari WHERE ad = ? AND soyad = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, ad);
            ps.setString(2, soyad);
            rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
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