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
String mingcheng=request.getParameter("mingcheng");String xingji=request.getParameter("xingji");String dizhi=request.getParameter("dizhi");String dianhua=request.getParameter("dianhua");String jianjie=request.getParameter("jianjie");String zhaopian=request.getParameter("zhaopian");String piaojia=request.getParameter("piaojia");
String id=request.getParameter("id");
String sql="update jingdianxinxi set mingcheng='"+mingcheng+"',xingji='"+xingji+"',dizhi='"+dizhi+"',dianhua='"+dianhua+"',jianjie='"+jianjie+"',zhaopian='"+zhaopian+"',piaojia='"+piaojia+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='jingdianxinxi_list.jsp';</script>");
%>
  </body>
</html>


