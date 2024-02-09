<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menü</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        #menu {
            width: 250px;
            height: 100%;
            background-color: #333;
            position: fixed;
            left: 0;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
            color: #fff;
        }

        #menu a {
            padding: 8px 16px;
            text-decoration: none;
            font-size: 18px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        #menu a:hover {
            color: #f1f1f1;
        }

        #content {
            margin-left: 250px;
            padding: 16px;
        }
    </style>
    
    
    
</head>
<body>

    <%
        try{
        Map<String, String> userMap = (Map<String, String>) application.getAttribute("ogrenciMap");
        String username = userMap.get(session.getId());

        if (username != null) {
    %>
    
<div id="menu">
    <a href="#" onclick="loadPage('danismanBilgileri.jsp')">Ana Menü</a>
    <a href="#" onclick="loadPage('dersKayitKesinlestirmeKontrol.jsp')">Ders Kayıt</a>
    <a href="#" onclick="loadPage('alinanDerslerOnayKontrol.jsp')">Alınan Dersler</a>
    <a href="#" onclick="loadPage('dersProgramiOnayKontrol.jsp')">Ders Programı</a>
    <a href="#" onclick="loadPage('bolumDersProgramiMenu.jsp')">Bölüm Ders Programı</a>
    <a href="#" onclick="loadPage('sifreDegistir.jsp?rol=ogrenci')">Şifre Değiştir</a>
    <a href="cikisYap.jsp" target="_self">Çıkış Yap</a>
</div>

<div id="content">
    <iframe id="page-frame" src="" style="width: 100%; height: 100%; border: none; display: none;"></iframe>
</div>

<script>
    function loadPage(pageURL) {
        var iframe = document.getElementById("page-frame");
        iframe.src = pageURL;
        iframe.style.display = "block";

        iframe.onload = function() {
            iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
        };
    }

    /*function adjustIframeHeight() {
        var iframe = document.getElementById('page-frame');
        if (iframe) {
            iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
        }
    }

    // Sayfa yüklendiğinde iframe'in yüksekliğini ayarla
    document.getElementById('page-frame').onload = adjustIframeHeight;
*/
</script>

<script>
    // Sayfa yüklendiğinde çağrılacak fonksiyon
    window.onload = function() {
        // Önceki sayfa durumunu kontrol et
        var previousPage = localStorage.getItem("previousPage");
        if (previousPage) {
            // Önceki sayfa varsa, loadPage fonksiyonunu çağırarak içeriği tekrar yükle
            loadPage(previousPage);
        } else {
            // Önceki sayfa yoksa, varsayılan olarak ana menüyü yükle
            loadPage('danismanBilgileri.jsp');
        }
    };

    function loadPage(pageURL) {
        // Sayfa yüklenirken önceki sayfa bilgisini sakla
        localStorage.setItem("previousPage", pageURL);

        var iframe = document.getElementById("page-frame");
        iframe.src = pageURL;
        iframe.style.display = "block";

        iframe.onload = function() {
            iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
        };
    }

    function logout() {
        // Çıkış yapıldığında önceki sayfa bilgisini temizle
        localStorage.removeItem("previousPage");
        // İsteğe bağlı olarak çıkış işlemlerini gerçekleştir
        // ...
    }
</script>




<%
        } else {
            response.sendRedirect("login.jsp");
        }

        }catch(Exception e){
            response.sendRedirect("login.jsp");
        }
    %>

</body>
</html>