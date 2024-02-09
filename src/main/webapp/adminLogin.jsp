<%@page import="com.mycompany.ders_kayit.VT_dersKayit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Girişi</title>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;

            var validUsernameChars = /^[a-zA-Z0-9ğüşıöçĞÜŞİÖÇ]+$/;
            
            if (!validUsernameChars.test(username)) {
                alert("Kullanıcı adı özel karakter içeremez!");
                return false;
            }

            return true;
        }
    </script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            margin: 0 auto;
        }

        h2 {
            color: #333;
        }

        input {
            padding: 10px;
            margin: 10px;
            width: calc(100% - 20px);
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="password"] {
            margin-bottom: 20px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    
   
    <form action="VT_girisAdmin.jsp" method="post" onsubmit="return validateForm()">
        <h2>Admin Girişi</h2>
        Kullanıcı Adı <input type="text" name="username" id="username" required maxlength="30"><br>
            Şifre <input type="password" name="password" id="password" required maxlength="20"><br>
        <input type="hidden" name="role" value="admin"><br>
        <input type="submit" value="Giriş">
    </form>
    
    
</body>
</html>
