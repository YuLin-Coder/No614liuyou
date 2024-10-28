
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客房</title><LINK href="CSS.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
    

  </head>
<%
String sql;
ResultSet RS_result;
    String jdDecode = URLDecoder.decode(request.getParameter("jd"), "UTF-8");
    String jd = URLEncoder.encode(jdDecode, "UTF-8");
%>
  <body >
  <p>已有客房列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索: 酒店：<input name="jiudian" type="text" id="jiudian" /> 客房编号：<input name="kefangbianhao" type="text" id="kefangbianhao" />类型：
   <select name='leixing' id='leixing'>
     <option value="">所有</option>
     <option value="经济型">经济型</option>
     <option value="舒适型">舒适型</option>
     <option value="商务型">商务型</option>
     <option value="总统型">总统型</option>
   </select>
   大小：
   <select name='daxiao' id='daxiao'>
     <option value="">所有</option>
     <option value="单人间">单人间</option>
     <option value="双人间">双人间</option>
     <option value="三人间">三人间</option>
     <option value="多人间">多人间</option>
   </select>
   <input type="submit" name="Submit" value="查找" />
   <input type="button" name="Submit2" value="添加" onClick="javascript:location.href='kefang_add.jsp?jd=<%=jd%>';" />
  </form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>酒店</td><td bgcolor='#CCFFFF'>客房编号</td><td bgcolor='#CCFFFF'>类型</td><td bgcolor='#CCFFFF'>大小</td><td bgcolor='#CCFFFF'>价格</td><td bgcolor='#CCFFFF'>备注</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%
  int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from kefang where jiudian='"+jdDecode+"'";
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
  sql="select * from kefang where jiudian='"+jdDecode+"' and 1=1 ";
  
if(request.getParameter("jiudian")=="" ||request.getParameter("jiudian")==null ){}else{sql=sql+" and jiudian like '%"+new String(request.getParameter("jiudian").getBytes("8859_1"))+"%'";}
if(request.getParameter("kefangbianhao")=="" ||request.getParameter("kefangbianhao")==null ){}else{sql=sql+" and kefangbianhao like '%"+new String(request.getParameter("kefangbianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("leixing")=="所有" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+new String(request.getParameter("leixing").getBytes("8859_1"))+"%'";}
if(request.getParameter("daxiao")=="所有" ||request.getParameter("daxiao")==null ){}else{sql=sql+" and daxiao like '%"+new String(request.getParameter("daxiao").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc limit "+curpage2+","+page_record;
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String jiudian="";String kefangbianhao="";String leixing="";String daxiao="";String jiage="";String beizhu="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
jiudian=RS_result.getString("jiudian");kefangbianhao=RS_result.getString("kefangbianhao");leixing=RS_result.getString("leixing");daxiao=RS_result.getString("daxiao");jiage=RS_result.getString("jiage");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=jiudian %></td><td><%=kefangbianhao %></td><td><%=leixing %></td><td><%=daxiao %></td><td><%=jiage %></td><td><%=beizhu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="kefang_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=kefang" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="kefang_list.jsp?page=1">首页</a>　<a href="kefang_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="kefang_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="kefang_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>

