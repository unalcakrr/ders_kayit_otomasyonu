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
    boolean kesinleştirmeDurumu = DerslerDene.dersKesinlestirmeKontrol(username);

    if (kesinleştirmeDurumu) { //dersler kesinleştirilmemişse
        response.sendRedirect("dersKayit.jsp");
    } else { //dersler kesinleştirilmişse
%>
        <script>
            alert("Dersleriniz kesinleştirildi. Değişiklik yapılamaz!");
            window.location.href = "dersKayitKesinlestirildi.jsp";
        </script>
<%
    }
%>
</body>
</html>