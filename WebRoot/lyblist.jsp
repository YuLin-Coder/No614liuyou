<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>塞北村镇旅游网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {color: #006666}
.STYLE2 {color: #006666; font-weight: bold; }
.STYLE5 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE6 {color: #FFCC33}
.STYLE7 {	color: #0066CC;
	font-weight: bold;
}
-->
</style></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><%@ include file="qttop.jsp"%>

<table width="978" height="1081" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td valign="top"><table id="__01" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
            <td valign="top"><table id="__01" width="758" height="785" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td height="785" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="81%" class="STYLE2"><strong>在线留言</strong></td>
                        <td width="14%" ><strong><a href="lyb.jsp"><font class="STYLE2">我要留言</font></a></strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><p align="center">
                          <%
    int curpage=1;//当前页
				int page_record=4;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from liuyanban";
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
				//out.print(curpage);
				String sql;
				if (curpage==1)
				{
				sql="select   * from liuyanban limit 0,"+page_record;
				}
				else
				{
				sql="select  * from liuyanban where 1=1 ";
				 int curpage2=(curpage-1)*page_record;
				  sql=sql+" order by id desc  limit "+curpage2+","+page_record;
				}
				
				  


  ResultSet RS_result=connDbBean.executeQuery(sql);
  String id="";
 String nicheng="";String xingbie="";String QQ="";String youxiang="";String dianhua="";String neirong="";String huifuneirong="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
nicheng=RS_result.getString("cheng");xingbie=RS_result.getString("xingbie");QQ=RS_result.getString("QQ");youxiang=RS_result.getString("youxiang");dianhua=RS_result.getString("dianhua");neirong=RS_result.getString("neirong");huifuneirong=RS_result.getString("huifuneirong");
 addtime=RS_result.getString("addtime");
 
 
%>
</p>
                          <table width="95%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#797A5B" class="tb" style="border-collapse:collapse">
                            <!--DWLayoutTable-->
                            <tr>
                              <td width="85" rowspan="4" align="center" valign="middle"><img width='70'height='70' src=img/<%=xingbie %>.gif border=0> </td>
                              <td height="20" align="left" valign="middle">&nbsp; &nbsp; 留言于:<%=addtime%> &nbsp;</td>
                            </tr>
                            <tr>
                              <td height="78" align="left" valign="top">&nbsp;<%=neirong%></td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle" style="height: 25px">&nbsp; &nbsp;昵称：<%=nicheng%> &nbsp; &nbsp;电话：<%=dianhua %>&nbsp;&nbsp;邮 箱:<%=youxiang%> &nbsp; QQ:<%=QQ%>&nbsp; &nbsp; </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle" style="height: 25px">&nbsp; &nbsp;管理员回复：<%=huifuneirong%></td>
                            </tr>
                          </table>
                          <%}%>
                          <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="lyblist.jsp?page=1">首页</a>　<a href="lyblist.jsp?page=<%= curpage-1%>">上一页</a>　<A 
                        
                        href="lyblist.jsp?page=<%= curpage+1%>">下一页</A>　<a href="lyblist.jsp?page=<%=zys %>">尾页</A>　当前第<FONT 
                        color=red><%=curpage %></FONT>页/共<FONT 
                        color=red><%=zys %></FONT>页</p>
                          <p align="center">&nbsp;</p>
</td>
                        <td width="13" background="qtimages/1_02_02_02_02_03.jpg">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="11"><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
      </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>

</body>
</html>