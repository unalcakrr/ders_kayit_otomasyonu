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
            String kimlikNo = request.getParameter("kimlikno");
            String username = request.getParameter("username");
            
            try {
                boolean ogretmenVarMid = VT_kullaniciSorgulama.ogretmenVarMi(kimlikNo, username);

                if (ogretmenVarMid) {
                    // Ogretmen varsa sifre degisikligi ogretmen sayfasina yonlendir
                    response.sendRedirect("VT_sifreDegisikligiOgretmen.jsp");
                } else {
                    // Ogretmen yoksa alert ile mesaj goster
        %>
                    <jsp:include page="VT_ogretmenSifre.jsp"/>
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
