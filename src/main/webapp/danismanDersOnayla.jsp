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
        String ogrenci_username = request.getParameter("ogrenci_username");
        
        boolean dersKesinlestirilmisMi = DerslerDene.danismanDersKesinlestirmeKontrol(ogrenci_username);
        String redirectPage = "ogretmenOgrencileri.jsp";

        if(dersKesinlestirilmisMi){ //ders kesinleştirilmişse
            String dersOnaylanmisMiBilgi = DerslerDene.danismanDersOnayiKontrol(ogrenci_username);
    %>
            <script>
                alert("<%= dersOnaylanmisMiBilgi %>");
                window.location.href = "<%= redirectPage %>";

            </script>
    <%
        } 
        else{ //ders kesinleştirilmemişse
    %>
            <script>
                alert("Kesinleştirilmiş ders bulunamadı");
                window.location.href = "<%= redirectPage %>";

            </script>
    <%
        }
    %>
</body>
</html>