<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin.SubeBilgisi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ders Bilgileri</title>
</head>
<body>
    <h2>Ders Bilgileri</h2>

    <form action="" method="post">
        <label for="dersId">Ders Seç:</label>
        <select name="dersId" id="dersId">
            <option value="1">Ders 1</option>
            <option value="2">Ders 2</option>
        </select>
        <input type="submit" value="Getir">
    </form>

    <% 
        // Form submit edildiyse
        if (request.getMethod().equalsIgnoreCase("post")) {
            int selectedDersId = Integer.parseInt(request.getParameter("dersId"));
            List<SubeBilgisi> subeBilgileri = VT_kullaniciSorgulamaAdmin.getSubeBilgileri(selectedDersId);

            // SubeBilgisi listesini ekrana yazdır
            for (SubeBilgisi sube : subeBilgileri) {
    %>
                <p>Ogretim Elemani: <%= sube.getOgretimElemani() %>, Saat: <%= sube.getSaat() %></p>
    <%
            }
        }
    %>
</body>
</html>
