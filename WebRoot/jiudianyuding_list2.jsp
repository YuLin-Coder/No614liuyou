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
    <title>酒店预订</title><LINK href="CSS.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有酒店预订列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索: 酒店名称：<input name="jiudianmingcheng" type="text" id="jiudianmingcheng" /> 客房编号：<input name="kefangbianhao" type="text" id="kefangbianhao" />
   <input type="submit" name="Submit" value="查找" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>酒店名称</td><td bgcolor='#CCFFFF'>客房编号</td><td bgcolor='#CCFFFF'>价格</td><td bgcolor='#CCFFFF'>预订时间</td><td bgcolor='#CCFFFF'>预订天数</td><td bgcolor='#CCFFFF'>您的姓名</td><td bgcolor='#CCFFFF'>您的电话</td><td bgcolor='#CCFFFF'>您的身份证</td><td bgcolor='#CCFFFF'>备注</td><td bgcolor='#CCFFFF'>用户名</td><td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
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
				String fysql="select count(id) as ss from jiudianyuding where yonghuming='"+request.getSession().getAttribute("username")+"'";
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
  sql="select  * from jiudianyuding where yonghuming='"+request.getSession().getAttribute("username")+"' ";
  
if(request.getParameter("jiudianmingcheng")=="" ||request.getParameter("jiudianmingcheng")==null ){}else{sql=sql+" and jiudianmingcheng like '%"+new String(request.getParameter("jiudianmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("kefangbianhao")=="" ||request.getParameter("kefangbianhao")==null ){}else{sql=sql+" and kefangbianhao like '%"+new String(request.getParameter("kefangbianhao").getBytes("8859_1"))+"%'";}
  sql=sql+"order by id desc limit "+curpage2+","+page_record;
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String jiudianmingcheng="";String kefangbianhao="";String jiage="";String yudingshijian="";String yudingtianshu="";String nindexingming="";String nindedianhua="";String nindeshenfenzheng="";String beizhu="";String yonghuming="";String issh="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
jiudianmingcheng=RS_result.getString("jiudianmingcheng");kefangbianhao=RS_result.getString("kefangbianhao");jiage=RS_result.getString("jiage");yudingshijian=RS_result.getString("yudingshijian");yudingtianshu=RS_result.getString("yudingtianshu");nindexingming=RS_result.getString("nindexingming");nindedianhua=RS_result.getString("nindedianhua");nindeshenfenzheng=RS_result.getString("nindeshenfenzheng");beizhu=RS_result.getString("beizhu");yonghuming=RS_result.getString("yonghuming");issh=RS_result.getString("issh");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=jiudianmingcheng %></td><td><%=kefangbianhao %></td><td><%=jiage %></td><td><%=yudingshijian %></td><td><%=yudingtianshu %></td><td><%=nindexingming %></td><td><%=nindedianhua %></td><td><%=nindeshenfenzheng %></td><td><%=beizhu %></td><td><%=yonghuming %></td><td width='80' align='center'><%=issh%></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="jiudianyuding_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=jiudianyuding" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="jiudianyuding_list2.jsp?page=1">首页</a>　<a href="jiudianyuding_list2.jsp?page=<%= curpage-1%>">上一页</a>　<A href="jiudianyuding_list2.jsp?page=<%= curpage+1%>">下一页</A>　<a href="jiudianyuding_list2.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>

