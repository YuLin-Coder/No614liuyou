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
//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

// if(RS_result.next())
//{
//out.print("<script>alert('该班级已经存在,请换其他名称的班级!');window.history.go(-1);</script>");
//	}
//else{

	
  	  	String sql="insert into jiudianyuding(jiudianmingcheng,kefangbianhao,jiage,yudingshijian,yudingtianshu,nindexingming,nindedianhua,nindeshenfenzheng,beizhu,yonghuming) values('"+jiudianmingcheng+"','"+kefangbianhao+"','"+jiage+"','"+yudingshijian+"','"+yudingtianshu+"','"+nindexingming+"','"+nindedianhua+"','"+nindeshenfenzheng+"','"+beizhu+"','"+yonghuming+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('操作成功!!');location.href='jiudianxinxilist.jsp';</script>");
  	  
//	}
//RS_result.close();

 %>
  </body>
</html>

