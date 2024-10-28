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
 

String xianlubianhao=request.getParameter("xianlubianhao");String xianlumingcheng=request.getParameter("xianlumingcheng");String chufadi=request.getParameter("chufadi");String mudedi=request.getParameter("mudedi");String jiaotonggongju=request.getParameter("jiaotonggongju");String feiyong=request.getParameter("feiyong");String chuxingshijian=request.getParameter("chuxingshijian");String beizhu=request.getParameter("beizhu");String faburen=request.getParameter("faburen");
//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

// if(RS_result.next())
//{
//out.print("<script>alert('该班级已经存在,请换其他名称的班级!');window.history.go(-1);</script>");
//	}
//else{

	
  	  	String sql="insert into zijiayouxianlu(xianlubianhao,xianlumingcheng,chufadi,mudedi,jiaotonggongju,feiyong,chuxingshijian,beizhu,faburen) values('"+xianlubianhao+"','"+xianlumingcheng+"','"+chufadi+"','"+mudedi+"','"+jiaotonggongju+"','"+feiyong+"','"+chuxingshijian+"','"+beizhu+"','"+faburen+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='zijiayouxianlu_add.jsp';</script>");
  	  
//	}
//RS_result.close();

 %>
  </body>
</html>

