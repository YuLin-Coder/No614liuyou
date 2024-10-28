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
//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

// if(RS_result.next())
//{
//out.print("<script>alert('该班级已经存在,请换其他名称的班级!');window.history.go(-1);</script>");
//	}
//else{

	
  	  	String sql="insert into jingdianxinxi(mingcheng,xingji,dizhi,dianhua,jianjie,zhaopian,piaojia) values('"+mingcheng+"','"+xingji+"','"+dizhi+"','"+dianhua+"','"+jianjie+"','"+zhaopian+"','"+piaojia+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='jingdianxinxi_add.jsp';</script>");
  	  
//	}
//RS_result.close();

 %>
  </body>
</html>

