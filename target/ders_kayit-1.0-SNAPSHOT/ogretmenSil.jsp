<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start; /* Sayfanın sol kenarına hizala */
            align-items: flex-start; /* Sayfanın üst kısmına hizala */
            height: 100vh;
        }

        form {
            background-color: #f4f4f4; /* Sayfanın rengiyle aynı arka plan */
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin: 20px; /* Sayfanın üst sol köşesinden 20px uzaklık bırak */
        }

        input {
            padding: 10px;
            margin: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #000; /* Gri arka plan rengi */
            color: #fff; /* Beyaz yazı rengi */
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555; /* Hover durumunda daha koyu bir gri */
        }
    </style>
</head>
<body>
    <form action="VT_ogretmenSil.jsp" action="post">
        Silmek istediğiniz öğretim elemanının id'sini girin: <input type="text" name="id" required><br>
            <input type="submit" value="Gönder">
    </form>
</body>
</html>