package com.mycompany.ders_kayit;

import java.sql.Time;
import java.util.List;

public class VT_dersler {
    private Time baslangic_saat;
    private Time bitis_saat;
    private int id;
    private String kod;
    private String sube;
    private String ad;
    private String derslik;
    private String program;
    //private int ogretim_elemani_id;
    private String ogretim_elemani;
    private int kayitli;
    private int kontenjan;
    private String gun;
    private List<String> ogrenciler_kadi;

    public VT_dersler() {
    }

    public VT_dersler(Time baslangic_saat, Time bitis_saat, int id, String kod,String sube, String ad, String derslik, String program, String ogretim_elemani, String gun) {
        this.baslangic_saat = baslangic_saat;
        this.bitis_saat = bitis_saat;
        this.id = id;
        this.kod = kod;
        this.sube = sube;
        this.ad = ad;
        this.derslik = derslik;
        this.program = program;
        this.ogretim_elemani = ogretim_elemani;
    }

    public Time getBaslangic_saat() {
        return baslangic_saat;
    }

    public void setBaslangic_saat(Time baslangic_saat) {
        this.baslangic_saat = baslangic_saat;
    }

    public Time getBitis_saat() {
        return bitis_saat;
    }

    public void setBitis_saat(Time bitis_saat) {
        this.bitis_saat = bitis_saat;
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

    public String getDerslik() {
        return derslik;
    }

    public void setDerslik(String derslik) {
        this.derslik = derslik;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    /*public int getOgretim_elemani_id() {
        return ogretim_elemani_id;
    }

    public void setOgretim_elemani_id(int ogretim_elemani_id) {
        this.ogretim_elemani_id = ogretim_elemani_id;
    }*/
    
    public String getOgretim_elemani() {
        return ogretim_elemani;
    }

    public void setOgretim_elemani(String ogretim_elemani) {
        this.ogretim_elemani = ogretim_elemani;
    }
    
    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }
    
    public int getKayitli() {
        return kayitli;
    }

    public void setKayitli(int kayitli) {
        this.kayitli = kayitli;
    }
    
    public int getKontenjan() {
        return kontenjan;
    }

    public void setKontenjan(int kontenjan) {
        this.kontenjan = kontenjan;
    }
    
    public String getSube() {
        return sube;
    }

    public void setSube(String sube) {
        this.sube = sube;
    }
}