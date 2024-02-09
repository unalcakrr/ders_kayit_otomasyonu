package com.mycompany.ders_kayit;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class dersZamanlari {
    public static void main(String[] args) {
        Ders webProgramlama = new Ders("Web Programlama");
        webProgramlama.ekleSube(new Sube(DayOfWeek.MONDAY, LocalTime.parse("09:00"), LocalTime.parse("11:00"), 1, "Ahmet Anıl Müngen", 50));
        webProgramlama.ekleSube(new Sube(DayOfWeek.TUESDAY, LocalTime.parse("11:00"), LocalTime.parse("13:00"), 2, "Ahmet Anıl Müngen",50));
        webProgramlama.ekleSube(new Sube(DayOfWeek.MONDAY, LocalTime.parse("09:00"), LocalTime.parse("11:00"), 3, "Can Güldüren",50));

        Ders algoritmaAnalizi = new Ders("Algoritmaların Analizi");
        algoritmaAnalizi.ekleSube(new Sube(DayOfWeek.TUESDAY, LocalTime.parse("12:00"), LocalTime.parse("15:00"), 1, "Ramin Abbaszadi",40));
        algoritmaAnalizi.ekleSube(new Sube(DayOfWeek.WEDNESDAY, LocalTime.parse("09:00"), LocalTime.parse("12:00"), 2, "Ramin Abbaszadi",40));

        Ders isletimSistemleri = new Ders("İşletim Sistemleri");
        isletimSistemleri.ekleSube(new Sube(DayOfWeek.THURSDAY, LocalTime.parse("09:00"), LocalTime.parse("12:00"),1, "Cemal Gemci",50));
        isletimSistemleri.ekleSube(new Sube(DayOfWeek.FRIDAY, LocalTime.parse("13:00"), LocalTime.parse("16:00"),2,"Cemal Gemci",50));
        
        Ders istatistik = new Ders("Yazılım Mühendisliği için Olasılık ve İstatistik");
        istatistik.ekleSube(new Sube(DayOfWeek.THURSDAY,LocalTime.parse("09:00"),LocalTime.parse("12:00"),1,"Sema Çiftçi",40));
        istatistik.ekleSube(new Sube(DayOfWeek.FRIDAY,LocalTime.parse("13:00"),LocalTime.parse("16:00"),2,"Sema Çiftçi",40));
        
        Ders formalDiller = new Ders("Formal Diller ve Automata");
        formalDiller.ekleSube(new Sube(DayOfWeek.TUESDAY,LocalTime.parse("13:00"),LocalTime.parse("16:00"),1,"Rayan Abri",50));
        formalDiller.ekleSube(new Sube(DayOfWeek.TUESDAY,LocalTime.parse("16:00"),LocalTime.parse("19:00"),2,"Rayan Abri",50));
    }
    //Alttaki kod ders kayıtta seçilen derslerin şubelerine göre yeniden düzenlenecek
    private static boolean kontrolEt(Ders... dersler) {
        for (int i = 0; i < dersler.length - 1; i++) {
            for (int j = i + 1; j < dersler.length; j++) {
                List<Sube> subeler1 = dersler[i].getSubeler();
                List<Sube> subeler2 = dersler[j].getSubeler();

                for (Sube sube1 : subeler1) {
                    for (Sube sube2 : subeler2) {
                        if (sube1.gun.equals(sube2.gun) &&
                            !(sube1.bitis.isBefore(sube2.baslangic) || sube2.bitis.isBefore(sube1.baslangic))) {
                            return true; // Çakışma bulundu
                        }
                    }
                }
            }
        }
        return false; // Çakışma bulunamadı
    }
}

class Ders {
    private String ad;
    private List<Sube> subeler;

    public Ders(String ad) {
        this.ad = ad;
        this.subeler = new ArrayList<>();
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public List<Sube> getSubeler() {
        return subeler;
    }

    public void setSubeler(List<Sube> subeler) {
        this.subeler = subeler;
    }

    public void ekleSube(Sube sube) {
        subeler.add(sube);
    }
}

class Sube {
    public DayOfWeek gun;
    public LocalTime baslangic;
    public LocalTime bitis;
    private int subeno;
    private String ogretmen;
    private int kontenjan;

    public Sube(DayOfWeek gun, LocalTime baslangic, LocalTime bitis, int subeno, String ogretmen, int kontenjan) {
        this.gun = gun;
        this.baslangic = baslangic;
        this.bitis = bitis;
        this.subeno = subeno;
        this.ogretmen = ogretmen;
    }

    public DayOfWeek getGun() {
        return gun;
    }

    public void setGun(DayOfWeek gun) {
        this.gun = gun;
    }

    public LocalTime getBaslangic() {
        return baslangic;
    }

    public void setBaslangic(LocalTime baslangic) {
        this.baslangic = baslangic;
    }

    public LocalTime getBitis() {
        return bitis;
    }

    public void setBitis(LocalTime bitis) {
        this.bitis = bitis;
    }
    
    public int getSubeno(){
        return subeno;
    }
    
    public void setSubeno(int subeno){
        this.subeno = subeno;
    }
    
    public String getOgretmen(){
        return ogretmen;
    }
    
    public void setOgretmen(String ogretmen){
        this.ogretmen = ogretmen;
    }
    
    public int getKontenjan(){
        return kontenjan;
    }
    
    public void setKontenjan(int kontenjan){
        this.kontenjan = kontenjan;
    }
}
