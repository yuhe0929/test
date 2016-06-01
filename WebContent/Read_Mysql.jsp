<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>读取数据库中的数据显示</title>
</head>
<body>
<%!
	//定义数据库驱动程序
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL  = "jdbc:mysql://localhost:3306/yuhe";
    public static final String DBUSER   = "root";
    public static final String PASSWORD = "yuhe2923";
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	try{
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL,DBUSER,PASSWORD);
		String sql = "select empno,ename,job,sal,hiredate from emp";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<center>
	<table border="1" width="80%">
		<tr>
			<td>雇员编号</td>
			<td>雇员姓名</td>
			<td>雇员工作</td>
			<td>雇员工资</td>
			<td>雇佣日期</td>
		</tr>
<%
		while(rs.next()){
			int empno = rs.getInt(1);
			String ename = rs.getString(2);
			String job = rs.getString(3);
			float sal = rs.getFloat(4);
			Date data = rs.getDate(5);
%>
		<tr>
			<td><%=empno%></td>
			<td><%=ename%></td>
			<td><%=job%></td>
			<td><%=sal%></td>
			<td><%=data%></td>
		</tr>
<% 
		}
%>
	</table>
</center>
<%
	}catch(Exception e){
		System.out.println(e);
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
       
</body>
</html>