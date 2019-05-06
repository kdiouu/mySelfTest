<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>報明牌</title>
</head>
<body>
<h2>卜籤求明牌</h2>
${visitname},您好,<br>
  <%="九九乘法表<BR>"%> 
    <table border=3 >    
    <%
    for(int i=1; i<=9;i++)
    { 
        out.println("<tr>");
        for(int j=2 ;j<=9;j++)
        {
            out.println("<td width=80 > ");
            out.println(i+"*"+j+"=");
            out.println( j*i);
        }
        out.println("<tr>");
    }    
    %>
<br>
</body>
</html>