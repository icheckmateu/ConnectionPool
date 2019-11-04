<%@ page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>连接池举例</title>
</head>
<body>
	<h1>数据库连接池实例</h1><hr>
	<li><a href="useloops.jsp?loops=50000"> 使用连接池连接50000次</a>
	<br>
	<li><a href="noloops.jsp?loops=50"> 不使用连接池连接50次</a>
</body>
</html>