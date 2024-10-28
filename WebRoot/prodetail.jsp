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
  String id=request.getParameter("id");
   %>
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
                        <td width="95%" class="STYLE2"><strong>内容详细</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><p align="center">
                          <%
  String sql="select * from shangpinxinxi where id="+id;
  String bianhao="";String mingcheng="";String leibie="";String tupian="";String beizhu="";String jiage="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  jiage=RS_result.getString("jiage");  bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");leibie=RS_result.getString("leibie");tupian=RS_result.getString("tupian");beizhu=RS_result.getString("beizhu");
  }
   %>
</p>
                          <table width="97%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F89828" style="border-collapse:collapse">
                            <tr>
                              <td width="17%">编号：</td>
                              <td width="41%" height="30"><%= bianhao%></td>
                              <td width="42%" height="30" rowspan="4" align="center"><img src="<%=tupian%>" width="220" height="140"></td>
                            </tr>
                            <tr>
                              <td>名称：</td>
                              <td height="30"><%= mingcheng%></td>
                            </tr>
                            <tr>
                              <td>类别：</td>
                              <td height="30"><%=leibie%></td>
                            </tr>
                            <tr>
                              <td>价格：</td>
                              <td height="30"><%=jiage%> 元</td>
                            </tr>
                            <tr>
                              <td>备注：</td>
                              <td height="77" colspan="2"><%= beizhu%></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><a href="gwc.jsp?bianhao=<%=bianhao%>&mingcheng=<%=mingcheng %>&tupian=<%=tupian %>&jiage=<%=jiage %>" onClick="javascript:return confirm('确定要购买此物品?');">购买</a> <a href="#" onClick="javascript:history.back();">返回</a></td>
                            </tr>
                          </table>
                          <p></p>
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