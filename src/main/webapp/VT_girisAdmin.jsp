<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.ders_kayit.VT_dersKayit"%>
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
            String password = request.getParameter("password");
            
            boolean kullaniciKontrol = VT_dersKayit.kullaniciVarmi(username, password, "admin");
            
            if (kullaniciKontrol) {
                HttpSession sessionAdminUsername = request.getSession();
                
                sessionAdminUsername.setAttribute("sessionAdminUsername", username);
                
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(60);
                response.addCookie(cookie);
                
                Map<String, String> userMap = (Map<String, String>) application.getAttribute("userMap");
                
                if (userMap == null) {
                    userMap = new HashMap<>();
                    application.setAttribute("adminMap", userMap);
                }
                
                userMap.put(session.getId(), username);
                
                out.println("giris basarili");
                response.sendRedirect("adminPaneli.jsp");
            } else {
        %>
                <jsp:include page="adminLogin.jsp"/>
                <script>
                    alert('Tekrar dene!');
                </script>
        <%
            }
        %>
    </body>
</html>
