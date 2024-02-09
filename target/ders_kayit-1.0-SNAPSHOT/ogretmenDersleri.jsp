<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="com.mycompany.ders_kayit.VT_dersler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Verilen Dersler</title>
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
    <h2>Ders Bilgileri</h2><table>
        <tr>
            <th>Başlangıç Saati</th>
            <th>Bitiş Saati</th>
            <th>Ders Kodu</th>
            <th>Şube</th>
            <th>Ders Adı</th>
            <th>Derslik</th>
            <th>Program</th>
            <th>Kayıtlı</th>
            <th>Kontenjan</th>
            <th>Gün</th>
        </tr>
        <%
            String danisman_mail = (String)session.getAttribute("sessionOgretmenUsername");
            
            List<VT_dersler> dersler = VT_kullaniciSorgulamaAdmin.getLecturesByDanismanEmail(danisman_mail);
            
            for (VT_dersler ders : dersler) {
        %>
                <tr>
                    <td><%= ders.getBaslangic_saat() %></td>
                    <td><%= ders.getBitis_saat() %></td>
                    <td><%= ders.getKod() %></td>
                    <td><%= ders.getSube()%></td>
                    <td><%= ders.getAd() %></td>
                    <td><%= ders.getDerslik() %></td>
                    <td><%= ders.getProgram() %></td>
                    <td><%= ders.getKayitli() %></td>
                    <td><%= ders.getKontenjan() %></td>
                    <td><%= ders.getGun() %></td>
                </tr>
        <%
            }
        %>
    </table>
    <br><br><br>
</body>
</html>