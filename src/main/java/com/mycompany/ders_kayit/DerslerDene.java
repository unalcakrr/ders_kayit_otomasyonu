package com.mycompany.ders_kayit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DerslerDene {
    public static List<VT_dersler> dersKontrol(String dersKod, String username) {
        List<VT_dersler> alinanDersler = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM ogrenciler WHERE kullaniciadi=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String alinanDerslerString = rs.getString("alinan_dersler");

                //virgülle ayrılan ders kodları listeye çevir
                String[] dersKodArray = alinanDerslerString.split(",");
                for (String dersKodTemp : dersKodArray) {
                    
                    VT_dersler ders = getDersByKod(dersKodTemp);
                    if (ders != null) {
                        alinanDersler.add(ders);
                    }
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

        return alinanDersler;
    }

    private static VT_dersler getDersByKod(String dersKod) {
        VT_dersler ders = null;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT * FROM dersler WHERE ders_kodu=?";
            ps = con.prepareStatement(query);
            ps.setString(1, dersKod);
            rs = ps.executeQuery();

            if (rs.next()) {
                ders = new VT_dersler();
                ders.setKod(rs.getString("ders_kodu"));
                ders.setSube(rs.getString("sube"));
                ders.setAd(rs.getString("ders_adi"));
                ders.setProgram(rs.getString("program"));
                ders.setOgretim_elemani(rs.getString("ogretimelemani"));
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

        return ders;
    }
    
    public static boolean dersKayitliMiBilgi(String username, String dersKod, String sube) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

        String query = "SELECT alinan_dersler FROM ogrenciler WHERE kullaniciadi=?";
        ps = con.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            String alinanDersler = rs.getString("alinan_dersler");

            if (alinanDersler.contains(dersKod)) { //ders zaten kayıtlıysa false döndürür
                return false;
            } else {
                alinanDersler += (alinanDersler.isEmpty() ? "" : ",") + dersKod;

                String updateQuery = "UPDATE ogrenciler SET alinan_dersler=? WHERE kullaniciadi=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, alinanDersler);
                ps.setString(2, username);
                ps.executeUpdate();

                String updateDerslerQuery = "UPDATE dersler SET ogrenciler_kadi=CONCAT(ogrenciler_kadi, ?), kayitli=kayitli+1 WHERE ders_kodu=? AND sube=?";
                ps = con.prepareStatement(updateDerslerQuery);
                ps.setString(1, "," + username);
                ps.setString(2, dersKod);
                ps.setString(3, sube);
                ps.executeUpdate();

                return true;
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

    return false;
    }

    public static boolean KontenjanKontrol(String dersKod, String dersSube) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String query = "SELECT kontenjan, kayitli FROM dersler WHERE ders_kodu=? AND sube=?";
            ps = con.prepareStatement(query);
            ps.setString(1, dersKod);
            ps.setString(2, dersSube);
            rs = ps.executeQuery();

            if (rs.next()) {
                int kontenjan = rs.getInt("kontenjan");
                int kayitli = rs.getInt("kayitli");

                
                if(kayitli < kontenjan){
                    return false;
                }
                
                else{
                    return true;
                }
                //return kayitli + 1 < kontenjan;//false dönecek
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

        return false;
    }
    
    public static boolean dersiCikar(String username, String dersKod) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String selectQuery = "SELECT alinan_dersler FROM ogrenciler WHERE kullaniciadi=?";
            ps = con.prepareStatement(selectQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                //virgülle ayırıp diziye at
                String[] alinanDersler = rs.getString("alinan_dersler").split(",");

                //Silinecek dersi hariç tut
                StringBuilder yeniDersler = new StringBuilder();
                for (String ders : alinanDersler) {
                    if (!ders.equals(dersKod.trim())) {
                        yeniDersler.append(ders).append(",");
                    }
                }

                String updateQuery = "UPDATE ogrenciler SET alinan_dersler=? WHERE kullaniciadi=?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, yeniDersler.toString());
                ps.setString(2, username);
                ps.executeUpdate();

                String findRowQuery = "SELECT * FROM dersler WHERE ders_kodu=? AND ogrenciler_kadi LIKE ?";
                ps = con.prepareStatement(findRowQuery);
                ps.setString(1, dersKod.trim());
                ps.setString(2, "%" + username + "%");
                rs = ps.executeQuery();

                if (rs.next()) {
                    int kayitli = rs.getInt("kayitli");
                    if (kayitli > 0) {
                        String updateKayitliQuery = "UPDATE dersler SET kayitli=? WHERE ders_kodu=? AND ogrenciler_kadi LIKE ?";
                        ps = con.prepareStatement(updateKayitliQuery);
                        ps.setInt(1, kayitli - 1);
                        ps.setString(2, dersKod.trim());
                        ps.setString(3, "%" + username + "%");
                        ps.executeUpdate();
                        
                        String updateOgrencilerKadiQuery = "UPDATE dersler SET ogrenciler_kadi = REPLACE(ogrenciler_kadi, ?, '') WHERE ders_kodu=?";
                        ps = con.prepareStatement(updateOgrencilerKadiQuery);
                        ps.setString(1, username);
                        ps.setString(2, dersKod.trim());
                        ps.executeUpdate();
                    }
                }
                
                return true; //silinirse true
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

        return false;
    }

    public static String dersKesinlestirme(String username) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        String resultMessage;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String sql = "UPDATE ogrenciler SET kesinlestirme = 1 WHERE kullaniciadi = ?;";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                resultMessage = "Dersler kesinleştirildi.";
            } else {
                resultMessage = "Dersler kesinleştirilemedi.";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resultMessage = "Bir hata oluştu.";
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return resultMessage;
    }

    public static boolean dersKesinlestirmeKontrol(String username) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");
            
            String sql = "SELECT kesinlestirme FROM ogrenciler WHERE kullaniciadi = ?";
            
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                int kesinlestirmeDurumu = resultSet.getInt("kesinlestirme");
                return kesinlestirmeDurumu != 1; //1 değilse true döndür
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return false;
    }

    public static String danismanDersOnayiKontrol(String ogrenciUsername) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String sql = "SELECT onay FROM ogrenciler WHERE kullaniciadi = ?";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, ogrenciUsername);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int onayDurumu = resultSet.getInt("onay");

                if (onayDurumu == 1) {
                    return "Ders zaten onaylanmış";
                } else {
                    sql = "UPDATE ogrenciler SET onay = 1 WHERE kullaniciadi = ?";
                    preparedStatement = con.prepareStatement(sql);
                    preparedStatement.setString(1, ogrenciUsername);

                    int affectedRows = preparedStatement.executeUpdate();

                    if (affectedRows > 0) {
                        return "Ders onaylandı";
                    } else {
                        return "Ders onaylanamadı";
                    }
                }
            } else {
                return "Öğrenci bulunamadı";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return "Hata oluştu";
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    public static boolean danismanDersKesinlestirmeKontrol(String kullaniciadi) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit?useUnicode=true&characterEncoding=UTF-8", "root", "");

            String sql = "SELECT kesinlestirme FROM ogrenciler WHERE kullaniciadi = ?";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, kullaniciadi);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int kesinlestirmeDurumu = resultSet.getInt("kesinlestirme");

                return kesinlestirmeDurumu != 0;
            } else {//öğrenci bulunamazsa
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean dersOnayKesinlestirmeKontrol(String username) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derskayit", "root", "");

            String sql = "SELECT onay FROM ogrenciler WHERE kullaniciadi=?";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int onayDurumu = resultSet.getInt("onay");
                return onayDurumu == 1;
            } else {
                //öğrenci bulunamazsa false
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
