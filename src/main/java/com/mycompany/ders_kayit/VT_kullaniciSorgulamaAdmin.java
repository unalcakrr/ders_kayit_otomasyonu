package com.mycompany.ders_kayit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VT_kullaniciSorgulamaAdmin {
    public static List<Ogrenciler> getStudents() {
        List<Ogrenciler> ogrenciler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM ogrenciler";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Ogrenciler ogrenci = new Ogrenciler();
                //ogrenci.setId(rs.getInt("id"));
                ogrenci.setName(rs.getString("ad"));
                ogrenci.setSurname(rs.getString("soyad"));
                ogrenci.setUsername(rs.getString("kullaniciadi"));
                ogrenci.setPassword(rs.getString("sifre"));
                ogrenci.setEmail(rs.getString("email"));
                ogrenci.setAlinanDerslerString(rs.getString("alinan_dersler"));
                ogrenci.setDanisman(rs.getString("danisman"));

                ogrenciler.add(ogrenci);
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

        return ogrenciler;
    }
    
    public static List<OgretimElemanlari> getTeachers() {
        List<OgretimElemanlari> ogretimelemanlari = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM ogretim_elemanlari";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                OgretimElemanlari ogretimelemani = new OgretimElemanlari();
                ogretimelemani.setId(rs.getInt("ogretimelemani_id"));
                ogretimelemani.setName(rs.getString("ad"));
                ogretimelemani.setSurname(rs.getString("soyad"));
                ogretimelemani.setEmail(rs.getString("email"));
                ogretimelemani.setPassword(rs.getString("sifre"));
                ogretimelemani.setPhone(rs.getString("telefon"));
                ogretimelemani.setFaculty(rs.getString("fakulte"));
                ogretimelemanlari.add(ogretimelemani);
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

        return ogretimelemanlari;
    }
    
    public static List<VT_dersler> getLectures() {
        List<VT_dersler> dersler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM dersler";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                VT_dersler ders = new VT_dersler();
                ders.setBaslangic_saat(rs.getTime("baslangic_saat"));
                ders.setBitis_saat(rs.getTime("bitis_saat"));
                ders.setId(rs.getInt("ders_id"));
                ders.setKod(rs.getString("ders_kodu"));
                ders.setSube(rs.getString("sube"));
                ders.setAd(rs.getString("ders_adi"));
                ders.setDerslik(rs.getString("derslik"));
                ders.setProgram(rs.getString("program"));
                //ders.setOgretim_elemani_id(rs.getInt("ogretimelemani_id"));
                ders.setOgretim_elemani(rs.getString("ogretimelemani"));
                ders.setKontenjan(rs.getInt("kontenjan"));
                ders.setGun(rs.getString("gun"));
                ders.setKayitli(rs.getInt("kayitli"));

                dersler.add(ders);
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

        return dersler;
    }
    
    public static List<DersOzellikleri> getLecturesFeatures() {
        List<DersOzellikleri> dersOzellikleri = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM dersOzellikleri";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                DersOzellikleri dersOzellik = new DersOzellikleri();
                dersOzellik.setId(rs.getInt("id"));
                dersOzellik.setKod(rs.getString("ders_kodu"));
                dersOzellik.setAd(rs.getString("ders_adi"));
                dersOzellik.setSaat(rs.getString("saat"));
                dersOzellik.setKredi(rs.getString("kredi"));
                dersOzellik.setAkts(rs.getString("akts"));
                dersOzellik.setSinif(rs.getString("sinif"));
                dersOzellik.setAlis(rs.getString("alis"));

                dersOzellikleri.add(dersOzellik);
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

        return dersOzellikleri;
    }
    
    public static List<VT_dersler> getLecturesByCode(String ders_kodu, String ders_adi) {
        List<VT_dersler> dersler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM dersler WHERE ders_kodu=? AND ders_adi=?";
            ps = con.prepareStatement(query);
            ps.setString(1, ders_kodu);
            ps.setString(2, ders_adi);
            rs = ps.executeQuery();

            while (rs.next()) {
                VT_dersler ders = new VT_dersler();

                ders.setSube(rs.getString("sube"));
                ders.setKod(rs.getString("ders_kodu"));
                ders.setAd(rs.getString("ders_adi"));
                ders.setOgretim_elemani(rs.getString("ogretimelemani"));

                dersler.add(ders);
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

        return dersler;
    }
    
    public static List<DersOzellikleri> getSelectedLecturesFeatures(String username) {
        List<DersOzellikleri> dersOzellikleri = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String ogrenciQuery = "SELECT alinan_dersler FROM ogrenciler WHERE kullaniciadi=?";
            ps = con.prepareStatement(ogrenciQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String alinanDersler = rs.getString("alinan_dersler");

                //ders kodları virgül ile ayrilir
                String[] dersKodlari = alinanDersler.split(",");

                String dersQuery = "SELECT * FROM dersOzellikleri WHERE ders_kodu IN (" + getQuestionMarks(dersKodlari.length) + ")";
                ps = con.prepareStatement(dersQuery);

                // ? işaretlerine değerler eklenir
                for (int i = 0; i < dersKodlari.length; i++) {
                    ps.setString(i + 1, dersKodlari[i]);
                }

                rs = ps.executeQuery();

                while (rs.next()) {
                    DersOzellikleri dersOzellik = new DersOzellikleri();
                    dersOzellik.setId(rs.getInt("id"));
                    dersOzellik.setKod(rs.getString("ders_kodu"));
                    dersOzellik.setAd(rs.getString("ders_adi"));
                    dersOzellik.setSaat(rs.getString("saat"));
                    dersOzellik.setKredi(rs.getString("kredi"));
                    dersOzellik.setAkts(rs.getString("akts"));
                    dersOzellik.setSinif(rs.getString("sinif"));
                    dersOzellik.setAlis(rs.getString("alis"));

                    dersOzellikleri.add(dersOzellik);
                }
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

        return dersOzellikleri;
    }

    public static List<Ogrenciler> getStudentsByDanismanEmail(String danisman_mail) {
        List<Ogrenciler> ogrenciler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String danismanQuery = "SELECT ad, soyad FROM ogretim_elemanlari WHERE email=?";
            ps = con.prepareStatement(danismanQuery);
            ps.setString(1, danisman_mail);
            rs = ps.executeQuery();

            String danismanAd = "";
            String danismanSoyad = "";

            if (rs.next()) {
                danismanAd = rs.getString("ad");
                danismanSoyad = rs.getString("soyad");
            }

            String ogrenciQuery = "SELECT * FROM ogrenciler WHERE danisman=?";
            ps = con.prepareStatement(ogrenciQuery);
            ps.setString(1, danismanAd + " " + danismanSoyad);
            rs = ps.executeQuery();

            while (rs.next()) {
                Ogrenciler ogrenci = new Ogrenciler();
                ogrenci.setName(rs.getString("ad"));
                ogrenci.setSurname(rs.getString("soyad"));
                ogrenci.setUsername(rs.getString("kullaniciadi"));
                ogrenci.setPassword(rs.getString("sifre"));
                ogrenci.setEmail(rs.getString("email"));
                ogrenci.setAlinanDerslerString(rs.getString("alinan_dersler"));

                ogrenciler.add(ogrenci);
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

        return ogrenciler;
    }
    
    public static List<VT_dersler> getLecturesByDanismanEmail(String danisman_mail) {
        List<VT_dersler> dersler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String danismanQuery = "SELECT ad, soyad FROM ogretim_elemanlari WHERE email=?";
            ps = con.prepareStatement(danismanQuery);
            ps.setString(1, danisman_mail);
            rs = ps.executeQuery();

            String danismanAd = "";
            String danismanSoyad = "";

            if (rs.next()) {
                danismanAd = rs.getString("ad");
                danismanSoyad = rs.getString("soyad");
            }

            String dersQuery = "SELECT * FROM dersler WHERE ogretimelemani=?";
            ps = con.prepareStatement(dersQuery);
            ps.setString(1, danismanAd + " " + danismanSoyad);
            rs = ps.executeQuery();

            while (rs.next()) {
                VT_dersler ders = new VT_dersler();
                ders.setBaslangic_saat(rs.getTime("baslangic_saat"));
                ders.setBitis_saat(rs.getTime("bitis_saat"));
                ders.setId(rs.getInt("ders_id"));
                ders.setKod(rs.getString("ders_kodu"));
                ders.setSube(rs.getString("sube"));
                ders.setAd(rs.getString("ders_adi"));
                ders.setDerslik(rs.getString("derslik"));
                ders.setProgram(rs.getString("program"));
                ders.setKontenjan(rs.getInt("kontenjan"));
                ders.setGun(rs.getString("gun"));
                ders.setKayitli(rs.getInt("kayitli"));
                
                dersler.add(ders);
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

        return dersler;
    }
    
    private static String getQuestionMarks(int count) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < count; i++) {
            sb.append("?");
            if (i < count - 1) {
                sb.append(",");
            }
        }
        return sb.toString();
    }
    
    public static List<VT_dersler> getStudentCoursesByUsername(String username) {
        List<VT_dersler> dersBilgileri = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String dersQuery = "SELECT * FROM dersler WHERE FIND_IN_SET(?, ogrenciler_kadi)";
            ps = con.prepareStatement(dersQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                VT_dersler ders = new VT_dersler();
                ders.setId(rs.getInt("ders_id"));
                ders.setKod(rs.getString("ders_kodu"));
                ders.setSube(rs.getString("sube"));
                ders.setAd(rs.getString("ders_adi"));
                ders.setDerslik(rs.getString("derslik"));
                ders.setProgram(rs.getString("program"));
                ders.setKontenjan(rs.getInt("kontenjan"));
                ders.setGun(rs.getString("gun"));
                ders.setKayitli(rs.getInt("kayitli"));
                ders.setBaslangic_saat(rs.getTime("baslangic_saat"));
                ders.setBitis_saat(rs.getTime("bitis_saat"));
                ders.setOgretim_elemani(rs.getString("ogretimelemani"));

                dersBilgileri.add(ders);
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

        return dersBilgileri;
    }


}
