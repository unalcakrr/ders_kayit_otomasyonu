<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulama"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function showAlert(message) {
                alert(message);
            }
        </script>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String mail = request.getParameter("mail");
            
            try {
                boolean kullaniciVarMid = VT_kullaniciSorgulama.kullaniciVarMi(username, mail);

                if (kullaniciVarMid) {
                    // Kullanıcı varsa sifre degisikligi sayfasina yonlendir
                    response.sendRedirect("VT_sifreDegisikligi.jsp");
                } else {
                    // Kullanıcı yoksa alert ile mesaj göster
        %>
                    <jsp:include page="VT_ogrenciSifre.jsp"/>
                    <script>
                        showAlert('Böyle bir kullanıcı yok. Tekrar deneyin.');
                    </script>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
