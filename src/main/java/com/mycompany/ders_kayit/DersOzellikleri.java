package com.mycompany.ders_kayit;

public class DersOzellikleri {
    private int id;
    private String kod;
    private String ad;
    private String saat;
    private String kredi;
    private String akts;
    private String sinif;
    private String alis;

    public DersOzellikleri() {
    }

    public DersOzellikleri(int id, String kod, String ad, String saat, String kredi, String akts, String sinif, String alis) {
        this.id = id;
        this.kod = kod;
        this.ad = ad;
        this.saat = saat;
        this.kredi = kredi;
        this.akts = akts;
        this.sinif = sinif;
        this.alis = alis;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKod() {
        return kod;
    }

    public void setKod(String kod) {
        this.kod = kod;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }

    public String getKredi() {
        return kredi;
    }

    public void setKredi(String kredi) {
        this.kredi = kredi;
    }

    public String getAkts() {
        return akts;
    }

    public void setAkts(String akts) {
        this.akts = akts;
    }

    public String getSinif() {
        return sinif;
    }

    public void setSinif(String sinif) {
        this.sinif = sinif;
    }

    public String getAlis() {
        return alis;
    }

    public void setAlis(String alis) {
        this.alis = alis;
    }
}
