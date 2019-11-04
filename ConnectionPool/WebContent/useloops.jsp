<%@ page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>使用连接池</title>
</head>
<body>
	<%
	db.ConnectionPool cp=db.ConnectionPool.getInstance();
	long start=System.currentTimeMillis();
	int loops=Integer.parseInt(request.getParameter("loops"));
	for(int i=0;i<loops;i++){
		Connection cn=cp.getConnection();
		if(cn!=null){
			cp.release(cn);
		}
	}
	out.print("<h1>利用连接池连接"+loops+"次，用时"+(System.currentTimeMillis()-start)+"ms</h1>");
	%>
</body>
</html>