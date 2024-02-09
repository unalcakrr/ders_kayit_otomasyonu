<%@page import="com.mycompany.ders_kayit.VT_dersler"%>
<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ders_kayit.DersOzellikleri"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ders Bilgileri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        h2 {
            text-align: center;
        }

        table {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 80%;
            margin: 20px 0;
            overflow-x: auto;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        
        .footer {
            margin-top: 20px;
            padding: 10px;
            text-align: left;
        }

        .footer a {
            font-family: Arial, sans-serif;
            display: block;
            margin-bottom: 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <h2>Uygun Şubeler</h2>

    <%
        String ders_kod =  request.getParameter("dersKod");
        String ders_ad = request.getParameter("dersAd");
        List<VT_dersler> dersler = VT_kullaniciSorgulamaAdmin.getLecturesByCode(ders_kod,ders_ad);
    %>
    
    <table>
        <tr>
            <th>Şube</th>
            <th>Ders Kodu</th>
            <th>Ders Adı</th>
            <th>Öğretim Elemanı</th>
            <th>İşlem</th>
        </tr>
        <%
            for (VT_dersler ders : dersler) {
        %>
                <tr>
                    <td><%= ders.getSube() %></td>
                    <td><%= ders.getKod() %></td>
                    <td><%= ders.getAd() %></td>
                    <td><%= ders.getOgretim_elemani()%></td>
                    <td>
                        <a href="javascript:void(0);" onclick="selectCourse('<%= ders.getKod() %>', '<%= ders.getSube() %>')">Seç</a>
                    </td>

<script>
    function selectCourse(dersKod, dersSube) {
        window.location.href = 'kayitKontenjanKontrol.jsp?dersKod=' + dersKod + '&dersSube=' + dersSube;
    }
</script>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
