<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start; /* Sayfanın sol kenarına hizala */
            align-items: flex-start; /* Sayfanın üst kısmına hizala */
            height: 100vh;
        }

        form {
            background-color: #f4f4f4; /* Sayfanın rengiyle aynı arka plan */
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin: 20px; /* Sayfanın üst sol köşesinden 20px uzaklık bırak */
        }

        input {
            padding: 10px;
            margin: 10px;
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
    <script>
        function validateForm() {
            var kimlikno = document.getElementById("kimlikno").value;
            var email = document.getElementById("username").value;

            var validChars = /^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$/;
            var validEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var validKimlikNo = /^\d{11}$/;

            if (!validKimlikNo.test(kimlikno)) {
                alert("Kimlik no sadece sayılardan oluşmalı ve 11 haneli olmalı.");
                return false;
            }
            if (!validEmail.test(email)) {
                alert("E-mail geçersiz");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form action="VT_sifreOgretmen.jsp" method="post" onsubmit="return validateForm()">
        TC Kimlik No: <input type="text" name="kimlikno" id="kimlikno" required maxlength="11"><br>
            Email: <input type="text" name="username" id="username" required maxlength="50"><br>
                <input type="hidden" name="role" value="ogretmen"><br>
        <input type="submit" value="Giriş">
    </form>
    
    
</body>
</html>
