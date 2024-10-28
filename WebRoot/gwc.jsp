<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
}
else
{
 %>
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
 
String bianhao=request.getParameter("bianhao");
 String mingcheng=new String(request.getParameter("mingcheng").getBytes("8859_1"));
 String tupian=request.getParameter("tupian");
 String jiage=request.getParameter("jiage");
 String sql="insert into gwc(username,bianhao,mingcheng,tupian,jiage) values('"+request.getSession().getAttribute("username")+"','"+bianhao+"','"+mingcheng+"','"+tupian+"','"+jiage+"')";
 connDbBean.executeUpdate(sql);
 
 out.print("<script>alert('操作成功!!');window.history.go(-1);</script>");
  	
 %>
  </body>
</html>

<%}%>