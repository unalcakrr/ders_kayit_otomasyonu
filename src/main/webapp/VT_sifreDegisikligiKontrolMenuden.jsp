<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulama"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        if("ogrencigirisi".equals(role)){
            String username = (String)session.getAttribute("sessionOgrenciUsername");
            out.println(VT_kullaniciSorgulama.sifreDegistirMenuden(username, password, "ogrencigirisi"));  
        }
          
        else if("ogretmengirisi".equals(role)){
            String username = (String)session.getAttribute("sessionOgretmenUsername");
            out.println(VT_kullaniciSorgulama.sifreDegistirMenuden(username, password, "ogretmengirisi"));  
        }
        
        else if("admingirisi".equals(role)){
            String username = (String)session.getAttribute("sessionAdminUsername");
            out.println(VT_kullaniciSorgulama.sifreDegistirMenuden(username, password, "admingirisi"));  
        }
    %>
        
    <script>
        //setTimeout(function() {
          //  window.location.href = "ogrenciMenu.jsp";
        //}, 2000); 
    </script>
        
        
</body>
</html>
