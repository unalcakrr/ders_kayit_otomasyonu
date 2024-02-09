<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ders Kayıt</title>
    <script>
        function logout() {
            // Çıkış yapıldığında önceki sayfa bilgisini temizle
            localStorage.removeItem("previousPage");
        }
    </script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        div {
            width: 80%;
            margin: 20px auto;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            display: inline-block;
            margin-right: 20px;
        }

        a {
            display: block;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 16px;
            padding: 10px;
            border: 2px solid #333;
            border-radius: 5px;
            background-color: #fff;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
    
</head>
<body>
    <h2>Ders Kayıt Sistemi</h2>
    
    <div>
        <ul>
            <li><a href="ogrenciLogin.jsp">Öğrenci</a></li>
            <li><a href="ogretmenLogin.jsp">Öğretmen</a></li>
            <li><a href="adminLogin.jsp">Admin Girişi</a></li>
            <li><a href="kayitOl.jsp">Kayıt Ol</a></li>
        </ul>
    </div>
</body>
</html>