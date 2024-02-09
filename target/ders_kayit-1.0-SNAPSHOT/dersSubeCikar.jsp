<%@page import="com.mycompany.ders_kayit.DerslerDene"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script>
        function dersSilindi(mesaj) {
            alert(mesaj);
            window.location.href = "dersKayit.jsp";
        }
    </script>
    
</head>
<body>
    <%
        String dersKod = request.getParameter("dersKod");
        String username = (String) session.getAttribute("sessionOgrenciUsername");
        
        boolean dersCikarildiMi = DerslerDene.dersiCikar(username,dersKod);
        
        if (dersCikarildiMi) {
            out.println("<script>dersKayitMesaj('Ders çıkarıldı.');</script>");
        } else {
            out.println("<script>dersKayitMesaj('Ders çıkarılamadı.');</script>");
        }
    %>
</body>
</html>
