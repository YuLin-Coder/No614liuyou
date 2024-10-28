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
                        <td width="95%" class="STYLE2"><strong>景点信息</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><form name="form1" id="form1" method="post" action="">
                          搜索:名称:
                          <input name="bianhao" type="text" id="bianhao" />
                          星级
  <input name="mingcheng" type="text" id="mingcheng" />
  <input type="submit" name="Submit5" value="查找" />
                        </form>
                          <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
                            <tr>
                              <td width="37" align="center" bgcolor="CCFFFF">序号</td>
                              <td width="82" bgcolor='#CCFFFF'>名称</td>
                              <td width="49" bgcolor='#CCFFFF'>星级</td>
                              <td width="82" bgcolor='#CCFFFF'>地址</td>
                              <td width="106" bgcolor='#CCFFFF'>电话</td>
                              <td width="131" bgcolor='#CCFFFF'>简介</td>
                              <td width="98" bgcolor='#CCFFFF'>照片</td>
                              <td width="73" bgcolor='#CCFFFF'>票价</td>
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
                              <td width="37" align="center"><%=i %></td>
                              <td><%=mingcheng %></td>
                              <td><%=xingji %></td>
                              <td><%=dizhi %></td>
                              <td><%=dianhua %></td>
                              <td><%=jianjie %></td>
                              <td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td>
                              <td><%=piaojia %></td>
                              </tr>
                            <%
  }
   %>
                          </table>
                          <br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a><p align="center">&nbsp;</p>
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