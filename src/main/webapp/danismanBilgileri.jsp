<%@page import="com.mycompany.ders_kayit.VT_ogretmenDersler"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danışman Bilgileri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0px;
        }

        .container {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String username = (String)session.getAttribute("sessionOgrenciUsername");
            Map<String, String> danismanBilgileri = VT_ogretmenDersler.getDanismanBilgileri(username);

            if (danismanBilgileri != null && !danismanBilgileri.isEmpty()) {
        %>
                <h2>Danışman Bilgileri</h2>
                <p>Ad: <%= danismanBilgileri.get("ad") %></p>
                <p>Soyad: <%= danismanBilgileri.get("soyad") %></p>
                <p>Email: <%= danismanBilgileri.get("email") %></p>
                <p>Telefon: <%= danismanBilgileri.get("telefon") %></p>
                <p>Fakülte: <%= danismanBilgileri.get("fakulte") %></p>
        <%
            } else {
        %>
                <p>Danışman bilgileri bulunamadı.</p>
        <%
            }
        %>
    </div>
</body>
</html>