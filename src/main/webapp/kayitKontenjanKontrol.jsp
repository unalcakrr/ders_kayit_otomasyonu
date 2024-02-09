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
        String dersKod = request.getParameter("dersKod");
        String dersSube = request.getParameter("dersSube");
        
        boolean kontenjanKontrol = DerslerDene.KontenjanKontrol(dersKod,dersSube);
        
        if (!kontenjanKontrol) { //kontenjanda yer varsa
            response.sendRedirect("dersSubeKontrol.jsp?dersKod=" + dersKod + "&dersSube=" + dersSube);
        } else {
            out.println("Kontenjan dolu.");
        }
    %>
</body>
</html>
