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
        Map<String, String> userMap = (Map<String, String>) application.getAttribute("ogretmenMap");
        String username = userMap.get(session.getId());

        if (username != null) {
    %>
    
<div id="menu">
    <a href="ogretmenMenu.jsp" target="_self" onclick="resetMenu()">Ana Menü</a>
    <a href="#" onclick="loadPage('ogretmenOgrencileri.jsp')">Öğrencilerim</a>
    <a href="#" onclick="loadPage('ogretmenDersleri.jsp')">Derslerim</a>
    <a href="#" onclick="loadPage('bolumDersProgramiMenu.jsp')">Bölüm Ders Programi</a>
    <a href="#" onclick="loadPage('sifreDegistir.jsp?rol=ogretmen')">Şifre Değiştir</a>
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

    function resetMenu() {
        // Ana menü bağlantısına tıklandığında önceki sayfa bilgisini sıfırla
        localStorage.removeItem("previousPage");
    }
</script>

</script>

<script>
    window.onload = function() {
        // Önceki sayfa durumunu kontrol et
        var previousPage = localStorage.getItem("previousPage");
        if (previousPage) {
            // Önceki sayfa varsa, loadPage fonksiyonunu çağırarak içeriği tekrar yükle
            loadPage(previousPage);
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