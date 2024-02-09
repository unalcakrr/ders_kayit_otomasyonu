<%@page import="com.mycompany.ders_kayit.DerslerDene"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script>
        function dersKayitMesaj(mesaj) {
            alert(mesaj);
            window.location.href = "dersKayit.jsp";
        }
    </script>
</head>
<body>
    <%
        String dersKod = request.getParameter("dersKod");
        String dersSube = request.getParameter("dersSube");
        String username = (String) session.getAttribute("sessionOgrenciUsername");
        
        boolean dersKayitliMi = DerslerDene.dersKayitliMiBilgi(username,dersKod,dersSube);
        
        if (!dersKayitliMi) {
            out.println("<script>dersKayitMesaj('Ders zaten kayıtlı.');</script>");
        } else {
            out.println("<script>dersKayitMesaj('Ders kaydedildi.');</script>");
        }
    %>
</body>
</html>
