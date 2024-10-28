<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
  </head>
  <body>
  <%
String xinwenID=request.getParameter("xinwenID");String pinglunneirong=request.getParameter("pinglunneirong");String pinglunren=request.getParameter("pinglunren");
String id=request.getParameter("id");
String sql="update pinglun set xinwenID='"+xinwenID+"',pinglunneirong='"+pinglunneirong+"',pinglunren='"+pinglunren+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='pinglun_list.jsp';</script>");
%>
  </body>
</html>


