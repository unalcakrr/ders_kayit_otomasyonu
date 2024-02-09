<%@page import="com.mycompany.ders_kayit.VT_kullaniciSorgulamaAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ders_kayit.OgretimElemanlari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğretim Elemanı Bilgileri</title>
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
    <h2>Öğretim Elemanı Bilgileri</h2>

    <table>
        <tr>
            <th>Id</th>
            <th>Ad</th>
            <th>Soyad</th>
            <th>E-Mail</th>
            <th>Telefon</th>
            <th>Fakülte</th>
        </tr>
        <%
            List<OgretimElemanlari> ogretimelemanlari = VT_kullaniciSorgulamaAdmin.getTeachers();
            
            for (OgretimElemanlari ogretimelemani : ogretimelemanlari) {
        %>
                <tr>
                    <td><%= ogretimelemani.getId() %></td>
                    <td><%= ogretimelemani.getName() %></td>
                    <td><%= ogretimelemani.getSurname() %></td>
                    <td><%= ogretimelemani.getEmail() %></td>
                    <td><%= ogretimelemani.getPhone() %></td>
                    <td><%= ogretimelemani.getFaculty() %></td>
                </tr>
        <%
            }
        %>
    </table>

    <div class="footer">
        <a href="ogretmenEkle.jsp">Yeni Öğretim Elemanı Ekle</a><br>
        <a href="ogretmenSil.jsp">Öğretim Elemanı Kaldır</a>
    </div>
</body>
</html>
