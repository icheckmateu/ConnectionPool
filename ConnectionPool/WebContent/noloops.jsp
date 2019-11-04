<%@ page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>不使用连接池</title>
</head>
<body>
	<%
	long start=System.currentTimeMillis();
	int loops=Integer.parseInt(request.getParameter("loops"));
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	for(int i=0;i<loops;i++){
		Connection cn;
		try{
			cn=DriverManager.getConnection(
					"jdbc:odbc:tt");
			}catch (Exception e){
				System.out.println(e);
				break;
		}
		if(cn!=null){
			cn.close();
		}
	}
	out.print("<h1>不用连接池连接"+loops+"次，用时"+(System.currentTimeMillis()-start)+"ms</h1>");
	%>
</body>
</html>