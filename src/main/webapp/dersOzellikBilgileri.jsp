<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ders_kayit.DersOzellikleri"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ders Bilgileri</title>
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
    <h2>Ders Bilgileri</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Ders Kodu</th>
            <th>Ders Adı</th>
            <th>Saat</th>
            <th>Kredi</th>
            <th>AKTS</th>
            <th>Sınıf</th>
            <th>Alış</th>
            
        </tr>
        <%
            List<DersOzellikleri> dersOzellikleri = VT_kullaniciSorgulamaAdmin.getLecturesFeatures();
            
            for (DersOzellikleri dersOzellik : dersOzellikleri) {
        %>
                <tr>
                    <td><%= dersOzellik.getId() %></td>
                    <td><%= dersOzellik.getKod() %></td>
                    <td><%= dersOzellik.getAd() %></td>
                    <td><%= dersOzellik.getSaat() %></td>
                    <td><%= dersOzellik.getKredi() %></td>
                    <td><%= dersOzellik.getAkts() %></td>
                    <td><%= dersOzellik.getSinif() %></td>
                    <td><%= dersOzellik.getAlis() %></td>
                </tr>
        <%
            }
        %>
    </table>

    <div class="footer">
        <a href="dersOzellikEkle.jsp">Yeni Ders Ekle</a><br>
        <a href="dersOzellikSil.jsp">Ders Kaldır</a>
    </div>
</body>
</html>
