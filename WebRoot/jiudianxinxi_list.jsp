<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>酒店信息</title><LINK href="CSS.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有酒店信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索: 编号：<input name="bianhao" type="text" id="bianhao" /> 名称：<input name="mingcheng" type="text" id="mingcheng" />星级：
   <select name='xingji' id='xingji'>
      <option value="">所有</option>
     <option value="1">1</option>
     <option value="2">2</option>
     <option value="3">3</option>
     <option value="4">4</option>
     <option value="5">5</option>
   </select> 
   电话：
   <input name="dianhua" type="text" id="dianhua" />
   <input type="submit" name="Submit" value="查找" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>编号</td><td bgcolor='#CCFFFF'>名称</td><td bgcolor='#CCFFFF'>星级</td><td bgcolor='#CCFFFF'>地址</td><td bgcolor='#CCFFFF'>电话</td><td bgcolor='#CCFFFF' width='90' align='center'>照片</td><td bgcolor='#CCFFFF'>备注</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">客房管理</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%
   int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from jiudianxinxi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
				  int curpage2=curpage-1;
   sql="";
  sql="select * from jiudianxinxi where 1=1 ";
  
if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+new String(request.getParameter("bianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("mingcheng")=="" ||request.getParameter("mingcheng")==null ){}else{sql=sql+" and mingcheng like '%"+new String(request.getParameter("mingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("xingji")=="所有" ||request.getParameter("xingji")==null ){}else{sql=sql+" and xingji like '%"+new String(request.getParameter("xingji").getBytes("8859_1"))+"%'";}
if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+new String(request.getParameter("dianhua").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc limit "+curpage2+","+page_record;
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String bianhao="";String mingcheng="";String xingji="";String dizhi="";String dianhua="";String zhaopian="";String beizhu="";
 String addtime="";
 int i=0;
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");xingji=RS_result.getString("xingji");dizhi=RS_result.getString("dizhi");dianhua=RS_result.getString("dianhua");zhaopian=RS_result.getString("zhaopian");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
     String mingchengEncode = URLEncoder.encode(mingcheng, "UTF-8");
  %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=bianhao %></td><td><%=mingcheng %></td><td><%=xingji %></td><td><%=dizhi %></td><td><%=dianhua %></td><td width='90'><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=beizhu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="kefang_list.jsp?jd=<%=mingchengEncode%>">客房管理</a></td>
    <td width="90" align="center"><a href="jiudianxinxi_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=jiudianxinxi" onClick="return confirm('真的要删除？')">删除</a> <a href="jiudianxinxidetail.jsp?id=<%=id%>" target="_blank">详细</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="jiudianxinxi_list.jsp?page=1">首页</a>　<a href="jiudianxinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="jiudianxinxi_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="jiudianxinxi_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>
