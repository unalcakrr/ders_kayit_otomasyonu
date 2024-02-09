<%@page import="java.util.List"%>
<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="com.mycompany.ders_kayit.VT_dersler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!-- ... DERS ÖZELLİKLERİNİ GÖRÜNTÜLEMEK İÇİN  getLecturesFeatures metodu... -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alınan Dersler</title>
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
    <% 
        String username = (String) session.getAttribute("sessionOgrenciUsername");
        List<VT_dersler> alinanDersBilgileri = VT_kullaniciSorgulamaAdmin.getStudentCoursesByUsername(username);
    %>
    
    <table>
        <tr>
            <th>Ders Kodu</th>
            <th>Şube</th>
            <th>Ders Adı</th>
            <th>Derslik</th>
            <th>Program</th>
            <th>Kayıtlı</th>
            <th>Kontenjan</th>
            <th>Gun</th>
            <th>Baslangic Saat</th>
            <th>Bitis Saat</th>
            <th>Öğretim Elemanı</th>
        </tr>
        <% for (VT_dersler ders : alinanDersBilgileri) { %>
            <tr>
                <td><%= ders.getKod() %></td>
                <td><%= ders.getSube() %></td>
                <td><%= ders.getAd() %></td>
                <td><%= ders.getDerslik() %></td>
                <td><%= ders.getProgram() %></td>
                <td><%= ders.getKayitli() %></td>
                <td><%= ders.getKontenjan() %></td>
                <td><%= ders.getGun() %></td>
                <td><%= ders.getBaslangic_saat() %></td>
                <td><%= ders.getBitis_saat() %></td>
                <td><%= ders.getOgretim_elemani() %></td>
            </tr>
        <% } %>
    </table>
    <br><br><br>
</body>
</html>
