
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>景点信息</title><LINK href="CSS.css" type=text/css 
rel=stylesheet>
    

  </head>

  <body >
  <p>已有景点信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:名称:
     <input name="bianhao" type="text" id="bianhao" />
     星级
     <input name="mingcheng" type="text" id="mingcheng" />
     <input type="submit" name="Submit" value="查找" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>名称</td><td bgcolor='#CCFFFF'>星级</td><td bgcolor='#CCFFFF'>地址</td><td bgcolor='#CCFFFF'>电话</td><td bgcolor='#CCFFFF'>简介</td><td bgcolor='#CCFFFF'>照片</td><td bgcolor='#CCFFFF'>票价</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%
  String sql="";
  sql="select * from jingdianxinxi where 1=1";
  if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null )
  {}
  else
  {
  	sql=sql+" and mingcheng like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";
  }
  if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null )
  {}
  else
  {
  	sql=sql+" and xingji like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";
  }
  sql=sql+" order by id desc";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 String id="";
 String mingcheng="";String xingji="";String dizhi="";String dianhua="";String jianjie="";String zhaopian="";String piaojia="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
mingcheng=RS_result.getString("mingcheng");xingji=RS_result.getString("xingji");dizhi=RS_result.getString("dizhi");dianhua=RS_result.getString("dianhua");jianjie=RS_result.getString("jianjie");zhaopian=RS_result.getString("zhaopian");piaojia=RS_result.getString("piaojia");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=mingcheng %></td><td><%=xingji %></td><td><%=dizhi %></td><td><%=dianhua %></td><td><%=jianjie %></td><td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=piaojia %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="jingdianxinxi_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=jingdianxinxi" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
  </body>
</html>

