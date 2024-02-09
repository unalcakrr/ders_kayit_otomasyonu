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
    <title>VT_dersEkle.jsp</title>
    <%
   request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
    try {
        String baslangic_saat_str = request.getParameter("baslangic_saat").trim();
        String bitis_saat_str = request.getParameter("bitis_saat").trim();
        String idString = request.getParameter("id");
        String kontString = request.getParameter("kontenjan");
        //String ogretim_elemani_idString = request.getParameter("ogretim_elemani_id");
        String code = request.getParameter("kod");
        String sube = request.getParameter("sube");
        String name = request.getParameter("ad");
        String derslik = request.getParameter("derslik");
        String program = request.getParameter("program");
        String teacher = request.getParameter("ogretim_elemani");
        String day = request.getParameter("gun");

        if (idString != null && !idString.trim().isEmpty() &&
                kontString != null && !kontString.trim().isEmpty() &&
                //ogretim_elemani_idString != null && !ogretim_elemani_idString.trim().isEmpty() &&
                code != null && !code.trim().isEmpty() &&
                sube != null && !sube.trim().isEmpty() &&
                name != null && !name.trim().isEmpty() &&
                derslik != null && !derslik.trim().isEmpty() &&
                program != null && !program.trim().isEmpty() &&
                teacher != null && !teacher.trim().isEmpty() &&
                baslangic_saat_str != null && !baslangic_saat_str.trim().isEmpty() &&
                bitis_saat_str != null && !bitis_saat_str.trim().isEmpty() &&
                day != null && !day.trim().isEmpty()) {

            int id = Integer.parseInt(idString);
            int kontenjan = Integer.parseInt(kontString);
            //int ogretim_elemani_id = Integer.parseInt(ogretim_elemani_idString);

            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            Time baslangic_saat = new Time(sdf.parse(baslangic_saat_str).getTime());
            Time bitis_saat = new Time(sdf.parse(bitis_saat_str).getTime());

            boolean dersVarMi = VT_kayit.DersVarMi(id);

            if (dersVarMi) {
                %>
                <jsp:include page="dersEkle.jsp"/>
                <p>ID farklı olmalı!</p>
                <%
            } else {
                VT_kayitIslemleri kayit = new VT_kayitIslemleri();
                kayit.dersKaydet(id, code, sube, name, derslik, program, teacher, baslangic_saat, bitis_saat, day, kontenjan);
                
                //VT_ogretmenDersler ogDers = new VT_ogretmenDersler();
                //ogDers.derseAta(id, code, sube, name, derslik, program, teacher, baslangic_saat, bitis_saat);

                response.sendRedirect("dersMenu.jsp");
            }
        } else {
            %>
            <jsp:include page="dersEkle.jsp"/>
            <p>Eksik bilgi var!</p><br>
            <%
        }

    } catch (NumberFormatException e) {
        %>
        <jsp:include page="dersEkle.jsp"/>
        <p>ID veya ogretim_elemani_id sayi olmalı!</p><br>
        <%
    } 
%>
</body>
</html>
