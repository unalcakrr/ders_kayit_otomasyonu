package com.mycompany.ders_kayit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VT_silmeIslemleri {

    public static void dersSil(int id) {
        Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            //Öğrenciler tablosunda dersi bulur ve çıkarr
            String updateOgrencilerQuery = "UPDATE ogrenciler SET alinan_dersler = REPLACE(alinan_dersler, (SELECT ders_kodu FROM dersler WHERE ders_id = ?), '') WHERE alinan_dersler LIKE CONCAT('%', (SELECT ders_kodu FROM dersler WHERE ders_id = ?), '%')";
            ps1 = con.prepareStatement(updateOgrencilerQuery);
            ps1.setInt(1, id);
            ps1.setInt(2, id);

            ps1.executeUpdate();

            String deleteDersQuery = "DELETE FROM dersler WHERE ders_id = ?";
            ps2 = con.prepareStatement(deleteDersQuery);
            ps2.setInt(1, id);

            int affectedRows = ps2.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Ders başarıyla silindi.");
            } else {
                System.out.println("Ders silinemedi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps1 != null) ps1.close();
                if (ps2 != null) ps2.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    public static void dersOzellikSil(int id) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String query = "DELETE FROM dersOzellikleri WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Ders başarıyla silindi.");
            } else {
                System.out.println("Ders silinemedi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Bağlantıyı ve diğer kaynakları kapat
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void ogrenciSil(String username) {
        Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            //Öğrenci silindiğinde dersler tablosundaki ogrenciler_kdai sütunundaki bilgi de silinir
            String updateDerslerQuery = "UPDATE dersler SET ogrenciler_kadi = REPLACE(ogrenciler_kadi, ?, '') WHERE ders_kodu IN (SELECT ders_kodu FROM ogrenciler WHERE kullaniciadi = ?)";
            ps1 = con.prepareStatement(updateDerslerQuery);
            ps1.setString(1, username);
            ps1.setString(2, username);

            ps1.executeUpdate();

            String updateKayitliQuery = "UPDATE dersler SET kayitli = kayitli - 1 WHERE ders_kodu IN (SELECT alinan_dersler FROM ogrenciler WHERE kullaniciadi = ?)";
            ps2 = con.prepareStatement(updateKayitliQuery);
            ps2.setString(1, username);

            ps2.executeUpdate();

            String deleteOgrenciQuery = "DELETE FROM ogrenciler WHERE kullaniciadi = ?";
            ps3 = con.prepareStatement(deleteOgrenciQuery);
            ps3.setString(1, username);

            int affectedRows = ps3.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Öğrenci başarıyla silindi.");
            } else {
                System.out.println("Öğrenci silinemedi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps1 != null) ps1.close();
                if (ps2 != null) ps2.close();
                if (ps3 != null) ps3.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void ogretmenSil(int id) {
        Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            //danışman sütunu güncelleme
            /*String updateOgrencilerQuery = "UPDATE ogrenciler SET danisman = '' WHERE danisman = (SELECT CONCAT(adi, ' ', soyadi) FROM ogretim_elemanlari WHERE ogretimelemani_id = ?)";
            ps1 = con.prepareStatement(updateOgrencilerQuery);
            ps1.setInt(1, id);

            ps1.executeUpdate();*/

            String deleteOgretimElemaniQuery = "DELETE FROM ogretim_elemanlari WHERE ogretimelemani_id = ?";
            ps2 = con.prepareStatement(deleteOgretimElemaniQuery);
            ps2.setInt(1, id);

            int affectedRows = ps2.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Öğretim elemanı başarıyla silindi.");
            } else {
                System.out.println("Öğretim elemanı silinemedi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps1 != null) ps1.close();
                if (ps2 != null) ps2.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
