<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <form action="VT_sifre.jsp" method="post">
        Ad: <input type="text" name="name"><br>
            Soyad: <input type="text" name="surname"><br>
                Kullanıcı Adı: <input type="text" name="username"><br>
                    <input type="hidden" name="role" value="sifredegistir"><br>
        <input type="submit" value="Giriş">
    </form>
    
    
</body>
</html>
