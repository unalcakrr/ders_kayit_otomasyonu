<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulama"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        out.println(VT_kullaniciSorgulama.sifreDegistirOgretmen(username,password));    
    %>
        
    <script>
        setTimeout(function() {
            window.location.href = "login.jsp";
        }, 2000); 
    </script>
        
</body>
</html>
