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
String jiudianmingcheng=request.getParameter("jiudianmingcheng");String kefangbianhao=request.getParameter("kefangbianhao");String jiage=request.getParameter("jiage");String yudingshijian=request.getParameter("yudingshijian");String yudingtianshu=request.getParameter("yudingtianshu");String nindexingming=request.getParameter("nindexingming");String nindedianhua=request.getParameter("nindedianhua");String nindeshenfenzheng=request.getParameter("nindeshenfenzheng");String beizhu=request.getParameter("beizhu");String yonghuming=request.getParameter("yonghuming");
String id=request.getParameter("id");
String sql="update jiudianyuding set jiudianmingcheng='"+jiudianmingcheng+"',kefangbianhao='"+kefangbianhao+"',jiage='"+jiage+"',yudingshijian='"+yudingshijian+"',yudingtianshu='"+yudingtianshu+"',nindexingming='"+nindexingming+"',nindedianhua='"+nindedianhua+"',nindeshenfenzheng='"+nindeshenfenzheng+"',beizhu='"+beizhu+"',yonghuming='"+yonghuming+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='jiudianyuding_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


