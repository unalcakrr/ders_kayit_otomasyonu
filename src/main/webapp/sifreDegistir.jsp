<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Özel Sayfa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            height: 100vh;
        }

        form {
            background-color: #f4f4f4; /* Sayfanın rengiyle aynı arka plan */
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin: 20px; /* Sayfanın üst ve sol kısmından 20px uzaklık bırak */
        }

        input[type="password"] {
            padding: 10px;
            margin: 10px 0;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #000; /* Gri arka plan rengi */
            color: #fff; /* Beyaz yazı rengi */
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555; /* Hover durumunda daha koyu bir gri */
        }
    </style>
</head>
<body>
    <% 
        String rol = request.getParameter("rol");
        if ("ogrenci".equals(rol)) {
    %>
        <form action="VT_sifreDegisikligiKontrolMenuden.jsp" method="post">
            Yeni Şifre: <input type="password" name="password" required><br>
                <input type="hidden" name="role" value="ogrencigirisi"><br>
                <input type="submit" value="Gönder">
                    </form>
    <%
        } else if ("ogretmen".equals(rol)) {
    %>
        <form action="VT_sifreDegisikligiKontrolMenuden.jsp" method="post">
            Yeni Şifre: <input type="password" name="password" required><br>
                <input type="hidden" name="role" value="ogretmengirisi"><br>
                <input type="submit" value="Gönder">
                    </form>
    <%
        } else if ("admin".equals(rol)) {
    %>
        <form action="VT_sifreDegisikligiKontrolMenuden.jsp" method="post">
            Yeni Şifre: <input type="password" name="password" required><br>
                <input type="hidden" name="role" value="admingirisi"><br>
                <input type="submit" value="Gönder">
                    </form>
    <%
        }
    %>
    <br><br><br>
</body>
</html>
