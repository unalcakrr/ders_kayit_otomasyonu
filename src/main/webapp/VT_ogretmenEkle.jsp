<%@page import="com.mycompany.ders_kayit.VT_kayitIslemleri"%>
<%@page import="com.mycompany.ders_kayit.VT_kayit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
<%
try {
    String idString = request.getParameter("id");
    String kimlikNo = request.getParameter("kimlikno");
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String faculty = request.getParameter("faculty");

    if (idString != null && !idString.trim().isEmpty() &&
            kimlikNo != null && !kimlikNo.trim().isEmpty() &&
            name != null && !name.trim().isEmpty() &&
            surname != null && !surname.trim().isEmpty() &&
            email != null && !email.trim().isEmpty() && email.contains("@") &&
            password != null && !password.trim().isEmpty() &&
            phone != null && !phone.trim().isEmpty() &&
            faculty != null && !faculty.trim().isEmpty()) {

        int id = Integer.parseInt(idString);

        boolean ogretimElemaniVarmid = VT_kayit.OgretimElemaniVarmi(id, kimlikNo,email);

        if (ogretimElemaniVarmid) {
            %>
            <script>
                showAlert("Id, TC kimlik no ve email farklı olmalı!");
            </script>
            <jsp:include page="ogretmenEkle.jsp"/>
            <%
        } else {
            VT_kayitIslemleri ogretmenKayit = new VT_kayitIslemleri();
            ogretmenKayit.ogretmenKaydet(id, name, surname, email, password, phone, faculty, kimlikNo);

            %>
            <script>
                showAlert("Kayıt Başarılı");
            </script>
            <jsp:include page="ogretimElemaniBilgileri.jsp"/>
            <%
        }
    } else {
        %>
        <script>
            showAlert("Eksik bilgi var!");
        </script>
        <jsp:include page="ogretmenEkle.jsp"/>
        <%
    }

} catch (NumberFormatException e) {
    %>
    <script>
        showAlert("ID sayı olmalı!");
    </script>
    <jsp:include page="ogretmenEkle.jsp"/>
    <%
}
%>
</body>
</html>
