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
String bianhao=request.getParameter("bianhao");String mingcheng=request.getParameter("mingcheng");String xingji=request.getParameter("xingji");String dizhi=request.getParameter("dizhi");String dianhua=request.getParameter("dianhua");String zhaopian=request.getParameter("zhaopian");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update jiudianxinxi set bianhao='"+bianhao+"',mingcheng='"+mingcheng+"',xingji='"+xingji+"',dizhi='"+dizhi+"',dianhua='"+dianhua+"',zhaopian='"+zhaopian+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='jiudianxinxi_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


