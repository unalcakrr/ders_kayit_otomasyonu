<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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

            if (username == null || username.trim().isEmpty()) {
        %>
                <jsp:include page="ogretmenLogin.jsp"/>
                <script>
                    alert('Email boş olamaz!');
                </script>
        <%
            } else {
                boolean kullaniciKontrol = VT_dersKayit.kullaniciVarmi(username, password, "ogretmen");

                if (kullaniciKontrol) {
                    HttpSession sessionOgretmenUsername = request.getSession();
            
                    sessionOgretmenUsername.setAttribute("sessionOgretmenUsername", username);

                    Cookie cookie = new Cookie("email",username);
                    cookie.setMaxAge(60);
                    response.addCookie(cookie);

                    Map<String, String> userMap = (Map<String, String>) application.getAttribute("userMap");

                    if (userMap == null) {
                        userMap = new HashMap<>();
                        application.setAttribute("ogretmenMap", userMap);
                    }

                    userMap.put(session.getId(), username);

                    out.println("giris basarili");
                    response.sendRedirect("ogretmenMenu.jsp");
                } else {
        %>
                    <jsp:include page="ogretmenLogin.jsp"/>
                    <script>
                        alert('Kullanıcı bulunamadı!');
                    </script>
        <%
                }
            }
        %>
    </body>
</html>
