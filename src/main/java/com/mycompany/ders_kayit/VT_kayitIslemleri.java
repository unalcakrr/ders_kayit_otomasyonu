package com.mycompany.ders_kayit;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

public class VT_kayitIslemleri {
    
    private static String md5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    public static void ogrenciKaydet(String name, String surname, String username, String password, String email, String danisman, String kimlikno) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "INSERT INTO ogrenciler (ad, soyad, kullaniciadi, sifre, email, alinan_dersler, danisman, kesinlestirme, onay, kimlikno) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            int kesinlestirme = 0;
            int onay = 0;
            
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, username);
            ps.setString(4, md5Hash(password));
            ps.setString(5, email);
            ps.setString(6, "");
            ps.setString(7,danisman);
            ps.setInt(8,kesinlestirme);
            ps.setInt(9,onay);
            ps.setString(10,kimlikno);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Öğrenci başarıyla kaydedildi.");
            } else {
                System.out.println("Öğrenci kaydedilemedi.");
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
    }
    
    public static void ogretmenKaydet(int id, String name, String surname, String email, String password, String phone, String faculty,String kimlikno) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "INSERT INTO ogretim_elemanlari (ogretimelemani_id, ad, soyad, email, sifre, telefon, fakulte, kimlikno) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, surname);
            ps.setString(4, email);
            ps.setString(5, md5Hash(password));
            ps.setString(6, phone);
            ps.setString(7, faculty);
            ps.setString(8, kimlikno);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Öğretim elemanı başarıyla kaydedildi.");
            } else {
                System.out.println("Öğretim elemanı kaydedilemedi.");
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
    }
    
    public static void dersKaydet(int id, String code, String sube, String name, String derslik, String program, String teacher, Time baslangic_saat, Time bitis_saat, String day, int kontenjan) {
        Connection con = null;
        PreparedStatement ps = null;

        int kayitli = 0;
        String ogrenciler_kadi = "";
        
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");
            
            String query = "INSERT INTO dersler (baslangic_saat, bitis_saat, ders_id, ders_kodu, sube, ders_adi, derslik, program, ogretimelemani, kontenjan, gun, kayitli, ogrenciler_kadi) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setTime(1, baslangic_saat);
            ps.setTime(2, bitis_saat);
            ps.setInt(3, id);
            ps.setString(4, code);
            ps.setString(5, sube);
            ps.setString(6, name);
            ps.setString(7, derslik);
            ps.setString(8, program);
            ps.setString(9, teacher);
            ps.setInt(10, kontenjan);
            ps.setString(11, day);
            ps.setInt(12, kayitli);
            ps.setString(13, ogrenciler_kadi);
            

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Ders başarıyla kaydedildi.");
            } else {
                System.out.println("Ders kaydedilemedi.");
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
    }
    
    public static void dersOzellikKaydet(int id, String code, String name, String saat, String kredi, String akts, String sinif, String zorunluluk) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "INSERT INTO dersozellikleri (id, ders_kodu, ders_adi, saat, kredi, akts, sinif, alis) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, id);
            ps.setString(2, code);
            ps.setString(3, name);
            ps.setString(4, saat);
            ps.setString(5, kredi);
            ps.setString(6, akts);
            ps.setString(7, sinif);
            ps.setString(8, zorunluluk);
            

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Ders başarıyla kaydedildi.");
            } else {
                System.out.println("Ders kaydedilemedi.");
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
    }
}