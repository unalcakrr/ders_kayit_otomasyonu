<%@page import="com.mycompany.ders_kayit.DerslerDene"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
</head>
<body>
    <%
    String username = (String) session.getAttribute("sessionOgrenciUsername");
    boolean onayDurumu = DerslerDene.dersOnayKesinlestirmeKontrol(username);

    if (onayDurumu) { //dersler onaylanmışsa
        response.sendRedirect("dersProgrami.jsp");
    } else {
%>
        <script>
            alert("Ders Bulunamadı!");
            window.location.href = "dersKayitKesinlestirildi.jsp";
        </script>
<%
    }
%>
</body>
</html>