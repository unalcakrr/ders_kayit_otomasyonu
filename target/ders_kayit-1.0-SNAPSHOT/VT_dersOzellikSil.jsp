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
        String idString = request.getParameter("id");

        if (idString != null && !idString.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idString);
                
                VT_silmeIslemleri dersOzellikSil = new VT_silmeIslemleri();
                dersOzellikSil.dersOzellikSil(id);
                response.sendRedirect("dersOzellikBilgileri.jsp");
            } catch (NumberFormatException e) {
    %>
                <p>Girilen ID geçerli değil. Lütfen geçerli bir ID girin.</p>
                <a href="dersOzellikSil.jsp">Geri Dön</a>
    <%
            }
        } else {
    %>
            <p>ID boş olamaz. Lütfen bir ID girin.</p>
            <a href="dersOzellikSil.jsp">Geri Dön</a>
    <%
        }
    %>
</body>
</html>
