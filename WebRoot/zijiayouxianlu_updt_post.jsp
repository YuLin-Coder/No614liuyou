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
String id=request.getParameter("id");
String sql="update zijiayouxianlu set xianlubianhao='"+xianlubianhao+"',xianlumingcheng='"+xianlumingcheng+"',chufadi='"+chufadi+"',mudedi='"+mudedi+"',jiaotonggongju='"+jiaotonggongju+"',feiyong='"+feiyong+"',chuxingshijian='"+chuxingshijian+"',beizhu='"+beizhu+"',faburen='"+faburen+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='zijiayouxianlu_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


