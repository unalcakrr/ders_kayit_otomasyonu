package com.mycompany.ders_kayit;

public class OgretimElemanlari {
    private int id;
    private String name;
    private String surname;
    private String email;
    private String password;
    private String phone;
    private String faculty;

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
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }
}
