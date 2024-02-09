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
            width: 100%;
            padding: 10px;
            margin: 5px 0;
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
            var id = document.getElementById("idno").value;
            var kod = document.getElementById("kod").value;
            var sube = document.getElementById("sube").value;
            var ad = document.getElementById("ad").value;
            var derslik = document.getElementById("derslik").value;
            var program = document.getElementById("program").value;
            var ogretim_elemani = document.getElementById("ogretim_elemani").value;
            var kontenjan = document.getElementById("kontenjan").value;
            var gun = document.getElementById("gun").value;

            var validChars = /^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$/;
            var validNo = /^\d+$/;
            
            if (!validNo.test(id) || !validNo.test(sube) || !validNo.test(kontenjan)) {
                alert("ID, şube ve kontenjan sayı olmalı!");
                return false;
            }

            if (!validChars.test(kod) || !validChars.test(ad) || !validChars.test(derslik) || !validChars.test(program) || !validChars.test(ogretim_elemani) || !validChars.test(gun)) {
                alert("Ders Kodu, Ders Adı, Derslik, Program, Öğretim Elemanı ve Gün özel karakter içermemelidir.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <form action="VT_dersEkle.jsp" method="post" onsubmit="return validateForm()">
        Başlangıç Saati: <input type="time" name="baslangic_saat" required><br>
            Bitiş Saati: <input type="time" name="bitis_saat" required><br>
                Ders ID: <input type="text" name="id" id="idno" required maxlength="20"><br>
                    Ders Kodu: <input type="text" name="kod" id="kod" required maxlength="20"><br>
                        Şube: <input type="text" name="sube" id="sube" required maxlength="20"><br>
                            Ders Adı: <input type="text" name="ad" id="ad" required maxlength="50"><br>
                                Derslik: <input type="text" name="derslik" id="derslik" required maxlength="20"><br>
                                    Program: <input type="text" name="program" id="program" required maxlength="50"><br>
                                        Öğretim Elemanı: <input type="text" name="ogretim_elemani" id="ogretim_elemani" required maxlength="50"><br>
                                            Kontenjan: <input type="text" name="kontenjan"  id="kontenjan" required maxlength="20"><br>
                                                Gün: <input type="text" name="gun" id="gun" required maxlength="20"><br>
        <input type="submit" value="Ders Ekle">
    </form>
</body>
</html>
