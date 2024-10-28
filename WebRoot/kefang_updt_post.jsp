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
String jiudian=request.getParameter("jiudian");String kefangbianhao=request.getParameter("kefangbianhao");String leixing=request.getParameter("leixing");String daxiao=request.getParameter("daxiao");String jiage=request.getParameter("jiage");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update kefang set jiudian='"+jiudian+"',kefangbianhao='"+kefangbianhao+"',leixing='"+leixing+"',daxiao='"+daxiao+"',jiage='"+jiage+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='kefang_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


