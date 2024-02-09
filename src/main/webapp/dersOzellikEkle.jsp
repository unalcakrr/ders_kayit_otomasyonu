<%@page import="com.mycompany.ders_kayit.VT_dersler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ders Ekle</title>
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
            var id = document.getElementById("idno").value;
            var kod = document.getElementById("kod").value;
            var ad = document.getElementById("ad").value;
            var saat = document.getElementById("saat").value;
            var kredi = document.getElementById("kredi").value;
            var akts = document.getElementById("akts").value;
            var sinif = document.getElementById("sinif").value;
            var zorunluluk = document.getElementById("zorunluluk").value;

            var validChars = /^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$/;
            var validNo = /^\d+$/;
            
            if (!validNo.test(id) || !validNo.test(kredi) || !validNo.test(akts) || !validNo.test(saat) || !validNo.test(sinif)) {
                alert("Ders ID, Kredi, Saat, AKTS ve Sınıf sayı olmalı!");
                return false;
            }

            if (!validChars.test(kod) || !validChars.test(ad) || !validChars.test(zorunluluk)) {
                alert("Ders Kodu, Ders Adı ve zorunluluk özel karakter içermemelidir.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <form action="VT_dersOzellikEkle.jsp" method="post" onsubmit="return validateForm()">
        Ders ID: <input type="number" name="id" id="idno" required maxlength="20"><br>
        Ders Kodu: <input type="text" name="kod" id="kod" required maxlength="20"><br>
        Ders Adı: <input type="text" name="ad" id="ad" required maxlength="50"><br>
        Saat: <input type="text" name="saat" id="saat" required maxlength="20"><br>
        Kredi: <input type="text" name="kredi" id="kredi" required maxlength="20"><br>
        AKTS: <input type="text" name="akts" id="akts" required maxlength="20"><br>
        Sınıf: <input type="text" name="sinif" id="sinif" required maxlength="20"><br>
        Zorunluluk: <input type="text" name="zorunluluk" id="zorunluluk" required maxlength="20"><br>
        <input type="submit" value="Ders Ekle">
    </form>
</body>
</html>
