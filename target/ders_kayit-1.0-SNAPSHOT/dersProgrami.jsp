<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Arrays"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.mycompany.ders_kayit.VT_dersProgrami" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ders Programı</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        h2 {
            text-align: center;
        }

        table {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 80%;
            margin: 20px 0;
            overflow-x: auto;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        
        .footer {
            margin-top: 20px;
            padding: 10px;
            text-align: left;
        }

        .footer a {
            font-family: Arial, sans-serif;
            display: block;
            margin-bottom: 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <h2>Ders Programı</h2>

    <%  
        String username = (String)session.getAttribute("sessionOgrenciUsername");
        
        List<Map<String, String>> dersProgrami = VT_dersProgrami.getDersProgramiByUsername(username);

        // Tüm günleri içeren bir liste oluştur
        Set<String> gunler = new LinkedHashSet<>();
        for (Map<String, String> ders : dersProgrami) {
            gunler.add(ders.get("gun"));
        }

        Iterator<String> gunIterator = gunler.iterator();

        while (gunIterator.hasNext()) {
            String gun = gunIterator.next();
    %>
            <h3><%= gun %></h3>
            <table>
                <tr>
                    <th>Başlangıç Saati</th>
                    <th>Bitiş Saati</th>
                    <th>Ders Kodu</th>
                    <th>Şube</th>
                    <th>Ders Adı</th>
                    <th>Derslik</th>
                    <th>Program</th>
                    <th>Öğretim Elemanı</th>
                </tr>
                <% 
                    for (Map<String, String> ders : dersProgrami) {
                        if (ders.get("gun").equals(gun)) {
                %>
                            <tr>
                                <td><%= ders.get("baslangic_saat") %></td>
                                <td><%= ders.get("bitis_saat") %></td>
                                <td><%= ders.get("ders_kodu") %></td>
                                <td><%= ders.get("sube") %></td>
                                <td><%= ders.get("ders_adi") %></td>
                                <td><%= ders.get("derslik") %></td>
                                <td><%= ders.get("program") %></td>
                                <td><%= ders.get("ogretimelemani") %></td>
                            </tr>
                <% } } %>
            </table>
            <br><br><br>
    <% } %>
</body>
</html>
