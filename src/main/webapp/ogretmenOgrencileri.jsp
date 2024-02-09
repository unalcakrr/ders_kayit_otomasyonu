<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="com.mycompany.ders_kayit.Ogrenciler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğrenci Bilgileri</title>
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
    <h2>Öğrenci Bilgileri</h2>

    <table>
        <tr>
            <th>Ad</th>
            <th>Soyad</th>
            <th>Kullanıcı Adı</th>
            <th>E-Mail</th>
            <th>Aldığı Dersler</th>
            <th>İşlem</th>
        </tr>
        <%
            String danisman_mail = (String)session.getAttribute("sessionOgretmenUsername");
            
            List<Ogrenciler> ogrenciler = VT_kullaniciSorgulamaAdmin.getStudentsByDanismanEmail(danisman_mail);
            
            for (Ogrenciler ogrenci : ogrenciler) {
        %>
                <tr>
                    <td><%= ogrenci.getName() %></td>
                    <td><%= ogrenci.getSurname() %></td>
                    <td><%= ogrenci.getUsername() %></td>
                    <td><%= ogrenci.getEmail() %></td>
                    <td><%= ogrenci.getAlinanDerslerString() %></td>
                    <td><a href="danismanDersOnayla.jsp?ogrenci_username=<%= ogrenci.getUsername() %>">Ders Seçimini Onayla</a></td>
                </tr>
        <%
            }
        %>
    </table>
    <br><br><br>
</body>
</html>
