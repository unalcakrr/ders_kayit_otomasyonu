<%@page import="com.mycompany.ders_kayit.VT_kayit"%>
<%@page import="com.mycompany.ders_kayit.VT_kayitIslemleri"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<%
   request.setCharacterEncoding("UTF-8");
%>
<body>
<%
    String kimlikNo = request.getParameter("kimlikno").trim();
    String name = request.getParameter("name").trim();
    String surname = request.getParameter("surname").trim();
    String username = request.getParameter("username").trim();
    String email = request.getParameter("email").trim();
    String password = request.getParameter("password").trim();
    String danisman = request.getParameter("danisman").trim();
    
    if (kimlikNo.isEmpty() || name.isEmpty() || surname.isEmpty() || username.isEmpty() || email.isEmpty() || !email.contains("@") || password.isEmpty() || danisman.isEmpty()) {
%>
        <script>
            alert("Boş değer girilemez!");
        </script>
<%
    } else {
        boolean k_adivarmi = VT_kayit.kullaniciadiVarmi(name, surname, username, password, kimlikNo, email);

        if (k_adivarmi) {
%>
            <script>
                alert("Böyle bir kullanıcı var");
            </script>
<%
        } else {
            VT_kayitIslemleri kayit = new VT_kayitIslemleri();
            kayit.ogrenciKaydet(name, surname, username, password, email, danisman, kimlikNo);
%>
            <script>
                alert("Öğrenci eklendi");
            </script>
<%
        }
    }
%>
<br><br><br>
</body>
</html>
