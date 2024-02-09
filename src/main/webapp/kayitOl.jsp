<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğrenci Ekle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start; /* Ekranın soluna hizala */
            align-items: flex-start;
            height: 100vh;
        }

        form {
            background-color: #f4f4f4;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
    <script>
        function validateForm() {
        }
    </script>
    <script>
        function validateForm() {
            // TC Kimlik No doğrulama
            var kimlikno = document.getElementById("kimlikno").value;
            var validKimlikNo = /^\d{11}$/;
            if (!validKimlikNo.test(kimlikno)) {
                alert("Kimlik numarası sadece sayı içermeli ve 11 haneli olmalı!");
                return false;
            }

            // Ad ve Soyad doğrulama
            var name = document.getElementById("name").value;
            var surname = document.getElementById("surname").value;
            var danisman = document.getElementById("danisman").value;
            var validChars = /^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$/;
            if (!validChars.test(name) || !validChars.test(surname) || !validChars.test(danisman)) {
                alert("Ad, soyad ve danışman sadece harf içerebilir!");
                return false;
            }

            // Kullanıcı Adı doğrulama
            var username = document.getElementById("username").value;
            var validNo = /^\d+$/;
            if (!validNo.test(username)) {
                alert("ID sadece sayı içerebilir!");
                return false;
            }

            // E-Mail doğrulama
            var email = document.getElementById("email").value;
            var validEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!validEmail.test(email)) {
                alert("E-mail geçersiz");
                return false;
            }

            /*var password = document.getElementById("password").value;
            if (password.length < 6) {
                alert("Şifre en az 6 karakter uzunluğunda olmalıdır.");
                return false;
            }*/


            return true; // Form gönderilebilir.
        }
    </script>
</head>
<body>
    <form action="VT_kayitOl.jsp" method="post" onsubmit="return validateForm()">
        <label for="kimlikno">TC Kimlik No:</label>
        <input type="text" name="kimlikno" id="kimlikno" required maxlength="11">

        <label for="name">Ad:</label>
        <input type="text" name="name" id="name" required maxlength="20">

        <label for="surname">Soyad:</label>
        <input type="text" name="surname" id="surname" required maxlength="20">

        <label for="username">Kullanıcı Adı:</label>
        <input type="number" name="username" id="username" required maxlength="20">

        <label for="email">E-Mail:</label>
        <input type="text" name="email" id="email" required maxlength="30">

        <label for="password">Şifre:</label>
        <input type="password" name="password" id="password" required maxlength="20">

        <label for="danisman">Danışman:</label>
        <input type="text" name="danisman" id="danisman" required maxlength="30">

        <input type="hidden" name="role" value="ogrenci">
        <input type="submit" value="Gönder">
    </form>
</body>
</html>
