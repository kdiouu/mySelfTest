<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>查詢名牌</title>
</head>
<body> 
<h2>查詢名牌</h2> 
<form  action="LotteryServlet2" method="POST">
      訪客姓名:<input type="text" name="visitor"  size="10"><br><p/>
   <input type="radio" name="numberType" value="BIG" CHECKED="">大樂透(六個介於1-49的數字)<br>
   <input type="radio" name="numberType" value="MID">中樂透(六個介於1-42的數字)<br>
   <input type="radio" name="numberType" value="SMALL">小樂透(五個介於1-39的數字)<br>
   <input type="radio" name="numberType" value="FOURSTARS">四星彩(四個可重複，介於0-9的數字)<br>   
   <p/>
   <input type="submit" value="確定">  
</form>
</body>
</html>