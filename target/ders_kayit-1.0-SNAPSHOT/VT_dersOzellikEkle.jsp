<%@page import="com.mycompany.ders_kayit.VT_ogretmenDersler"%>
<%@page import="com.mycompany.ders_kayit.VT_kayitIslemleri"%>
<%@page import="com.mycompany.ders_kayit.VT_kayit"%>
<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ders Özellik Ekleme</title>
    <%
   request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
    try {
        String idString = request.getParameter("id");
        String code = request.getParameter("kod");
        String name = request.getParameter("ad");
        String saat = request.getParameter("saat");
        String kredi = request.getParameter("kredi");
        String akts = request.getParameter("akts");
        String sinif = request.getParameter("sinif");
        String zorunluluk = request.getParameter("zorunluluk");

        if (idString != null && !idString.trim().isEmpty() &&
                code != null && !code.trim().isEmpty() &&
                name != null && !name.trim().isEmpty() &&
                saat != null && !saat.trim().isEmpty() &&
                kredi != null && !kredi.trim().isEmpty() &&
                akts != null && !akts.trim().isEmpty() &&
                sinif != null && !sinif.trim().isEmpty() &&
                zorunluluk != null && !zorunluluk.trim().isEmpty()) {

            int id = Integer.parseInt(idString);

            boolean dersOzellikVarMi = VT_kayit.DersOzellikVarMi(id);

            if (dersOzellikVarMi) { //geri döndürr
                %> 
                <jsp:include page="dersOzellikEkle.jsp"/>
                <p>ID farklı olmalı!</p>
                <%
            } else {
                VT_kayitIslemleri kayit = new VT_kayitIslemleri();
                kayit.dersOzellikKaydet(id, code, name, saat, kredi, akts, sinif, zorunluluk);
                
                //VT_ogretmenDersler ogDers = new VT_ogretmenDersler();
                //ogDers.derseAta(id, code, sube, name, derslik, program, teacher, baslangic_saat, bitis_saat);

                response.sendRedirect("dersOzellikBilgileri.jsp");
            }
        } else {
            %>
            <jsp:include page="dersOzellikEkle.jsp"/>
            <p>Eksik bilgi var!</p><br>
            <%
        }

    } catch (NumberFormatException e) {
        %>
        <jsp:include page="dersOzellikEkle.jsp"/>
        <p>ID veya Öğretim elemanı id sayi olmalı!</p><br>
        <%
    } 
%>
</body>
</html>
