<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giriş</title>
</head>
<body>
    <%
        String role = request.getParameter("role");
        if(role != null) {
            if(role.equals("ogrenci")){
                response.sendRedirect("ogrenciLogin.jsp");
            }else if(role.equals("ogretmen")){
                response.sendRedirect("ogretmenLogin.jsp");
            }else if(role.equals("admin")){
                response.sendRedirect("adminPaneli.jsp");
            }else if(role.equals("kayit")){
                response.sendRedirect("kayitOl.jsp");
            }else if(role.equals("sifredegistir")){
                response.sendRedirect("VT_kullaniciSorgu.jsp");
            }
        }else{
            out.println("<h3>Lütfen bir giriş seçeneği seçin.</h3>");
        }
    %>
</body>
</html>
