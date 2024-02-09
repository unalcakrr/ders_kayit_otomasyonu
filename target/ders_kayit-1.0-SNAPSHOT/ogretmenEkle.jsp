<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%
   request.setCharacterEncoding("UTF-8");
%>
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
            var idno = document.getElementById("idno").value;
            var kimlikno = document.getElementById("kimlikno").value;
            var name = document.getElementById("name").value;
            var surname = document.getElementById("surname").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var phone = document.getElementById("phone").value;
            var faculty = document.getElementById("faculty").value;

            var validChars = /^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$/;
            var validUsernameChars = /^[a-zA-Z0-9ğüşıöçĞÜŞİÖÇ]+$/;
            var validEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var validNo = /^\d+$/;
            var validKimlikNo = /^\d{11}$/;
            var validPhone = "^(\\+[0-9]+)?[0-9\\-\\s]+$";

            if (!validKimlikNo.test(kimlikno)) {
                alert("Kimlik numarası sadece sayı içermeli ve 11 haneli olmalı!");
                return false;
            }
            if (!validChars.test(name) || !validChars.test(surname)|| !validChars.test(faculty)) {
                alert("Ad, soyad ve fakülte sadece harf içerebilir!");
                return false;
            }
            if(!validPhone.test(phone)){
                alert("Telefon numarası geçersiz!");
            }
            if (!validNo.test(idno)) {
                alert("ID sadece sayı içerebilir!");
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
    <form action="VT_ogretmenEkle.jsp" method="post" onsubmit="return validateForm()">
        Id: <input type="text" name="id" id="idno" required maxlength="20"><br>
            TC Kimlik No: <input type="text" name="kimlikno" id="kimlikno" required maxlength="11"><br>
                Ad: <input type="text" name="name" id="name" required maxlength="20"><br>
                    Soyad: <input type="text" name="surname" id="surname" required maxlength="20"><br>
                        E-Mail: <input type="text" name="email" id="email" required maxlength="50"><br>
                            Şifre: <input type="password" name="password" id="password" required maxlength="20"><br>
                                Telefon: <input type="text" name="phone" id="phone" required maxlength="20"><br>
                                    Fakülte: <input type="text" name="faculty" id="faculty" required maxlength="50"><br>
        <input type="hidden" name="role" value="ogrenci"><br>
        <input type="submit" value="Gönder">
    </form>
    <br><br><br>
</body>
</html>
