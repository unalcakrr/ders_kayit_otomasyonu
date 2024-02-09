<%@page import="com.mycompany.ders_kayit.VT_silmeIslemleri"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String username = request.getParameter("username");

        if (username != null && !username.trim().isEmpty()) {
            try {
                VT_silmeIslemleri ogrSil = new VT_silmeIslemleri();
                ogrSil.ogrenciSil(username);
                response.sendRedirect("ogrenciBilgileri.jsp");
            } catch (Exception e) {
    %>
                <p>Girilen kullanıcı adı geçerli değil. Lütfen geçerli bir kullanıcı adı girin.</p>
                <a href="ogrenciSil.jsp">Geri Dön</a>
    <%
            }
        } else {
    %>
            <p>Kullanıcı adı boş olamaz. Lütfen bir kullanıcı adı girin.</p>
            <a href="ogrenciSil.jsp">Geri Dön</a>
    <%
        }
    %>
</body>
</html>
