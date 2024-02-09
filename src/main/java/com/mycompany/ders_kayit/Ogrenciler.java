package com.mycompany.ders_kayit;

import java.util.Arrays;
import java.util.List;

public class Ogrenciler {
    private int id;
    private String name;
    private String surname;
    private String username;
    private String password;
    private String email;
    private List<String> alinan_dersler;
    private String alinanDerslerString;
    private String danisman;
    private int kesinlestirme;
    private int onay;

    public int getId(){
        return id;
    } 
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getName(){
        return name;
    } 
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getSurname(){
        return surname;
    }
    
    public void setSurname(String surname){
        this.surname = surname;
    }
    
    public String getUsername(){
        return username;
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public List<String> getAlinanDersler(){
        return alinan_dersler;
    }
    
    public void setAlinanDersler(List<String> alinan_dersler){
        this.alinan_dersler = alinan_dersler;
        updateAlinanDerslerString();
    }
    
    public String getAlinanDerslerString(){
        return alinanDerslerString;
    }

    public void setAlinanDerslerString(String alinanDerslerString){
        this.alinanDerslerString = alinanDerslerString;
        //alinandersler'i güncelleme çünkü alinanDerslerString değişti
        updateAlinanDerslerList();
    }

    private void updateAlinanDerslerString(){
        //virgül ile string'e dönüştürür
        this.alinanDerslerString = String.join(",", alinan_dersler);
    }

    private void updateAlinanDerslerList(){
        //stringi liste yapar
        this.alinan_dersler = Arrays.asList(alinanDerslerString.split(","));
    }
    
    public String getDanisman(){
        return danisman;
    }
    
    public void setDanisman(String danisman){
        this.danisman = danisman;
    }
    
    public int getKesinlestirme(){
        return kesinlestirme;
    }
    
    public void setKesinlestirme(int kesinlestirme){
        this.kesinlestirme = kesinlestirme;
    }
    
    public int getOnay(){
        return onay;
    }
    
    public void setOnay(int onay){
        this.onay = onay;
    }
}
