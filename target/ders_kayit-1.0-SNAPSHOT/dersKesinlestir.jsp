<%@page import="com.mycompany.ders_kayit.DerslerDene"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script>
        function dersKesinlestirMesaj(mesaj) {
            alert(mesaj);
            window.location.href = "alinanDersler.jsp";
        }
    </script>
</head>
<body>
    <%
        String username = (String) session.getAttribute("sessionOgrenciUsername");
        
        String kesinlestirme = DerslerDene.dersKesinlestirme(username);
        
        out.println("<script>dersKesinlestirMesaj('" + kesinlestirme + "');</script>");
    %>
</body>
</html>
