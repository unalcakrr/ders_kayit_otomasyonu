<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Çıkış</title>
</head>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    h3 {
        text-align: center;
    }
</style>

<body>
    <h3>Çıkış Yapılıyor...</h3>

    <%
        HttpSession ogrenciSession = request.getSession(false);
        if (ogrenciSession != null) {
            ogrenciSession.removeAttribute("sessionOgrenciUsername");
            ogrenciSession.invalidate();
        }

        HttpSession ogretmenSession = request.getSession(false);
        if (ogretmenSession != null) {
            ogretmenSession.removeAttribute("sessionOgretmenUsername");
            ogretmenSession.invalidate();
        }

        HttpSession adminSession = request.getSession(false);
        if (adminSession != null) {
            adminSession.removeAttribute("sessionAdminUsername");
            adminSession.invalidate();
        }
    %>
    
    <script>
        setTimeout(function() {
            // logout fonksiyonunu çağırarak localStorage'daki önceki sayfa bilgisini sıfırla
            logout();
            // 1 saniye sonra login.jsp sayfasına yönlendir
            setTimeout(function() {
                window.location.href = "login.jsp";
            }, 1000);
        }, 1000);

        function logout() {
            // localStorage'daki previousPage bilgisini temizle
            localStorage.removeItem("previousPage");
        }
    </script>
</body>
</html>