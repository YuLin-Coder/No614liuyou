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
  <%
  String lb=new String(request.getParameter("lb").getBytes("8859_1"));
  
   %>
<table width="978" height="1013" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td height="864" valign="top"><table id="__01" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
            <td valign="top"><table id="__01" width="758" height="785" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td height="785" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="95%" class="STYLE2"><strong><%=lb%></strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><p align="center">
                          <%
							String sql="select content from dx where leibie='"+lb+"'";
  String neirong="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
neirong=RS_result.getString("content");
   %>
</p>
                          <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#F6C978" style="border-collapse:collapse" class="newsline">
                            <tr>
                              <td height="110" align="left"><%=neirong %></td>
                            </tr>
                            <tr>
                              <td align="right"><input type="button" name="Submit5" value="返回" onClick="javascript:history.back();" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
                            </tr>
                          </table>
                          <%}%>
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