<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp代码片段</title>
</head>
<body>
	<%
		long startTime = System.nanoTime();
	%>
	输出九九乘法表
	<br>
	<%
		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= i; j++) {
				String str = j + "*" + i + "=" + j * i;
				out.print(str + "&nbsp");
			}
			out.print("<br>");
		}
		long time = System.nanoTime() - startTime;
	%>
	生成九九乘法表用时
	<%=time / 1000%>
	ms。
</body>
</html>