<%@ page language="java"  pageEncoding="gb2312"%>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
}
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
                        <td width="95%" class="STYLE2"><strong>线路加团</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top">
						  <%
  String sql="select * from zijiayouxianlu where id="+id;
  String xianlubianhao="";String xianlumingcheng="";String chufadi="";String mudedi="";String jiaotonggongju="";String feiyong="";String chuxingshijian="";String beizhu="";String faburen="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xianlubianhao=RS_result.getString("xianlubianhao");xianlumingcheng=RS_result.getString("xianlumingcheng");chufadi=RS_result.getString("chufadi");mudedi=RS_result.getString("mudedi");jiaotonggongju=RS_result.getString("jiaotonggongju");feiyong=RS_result.getString("feiyong");chuxingshijian=RS_result.getString("chuxingshijian");beizhu=RS_result.getString("beizhu");faburen=RS_result.getString("faburen");
  }
   %>
						  <form name="form1" method="post" action="xianlujiatuan_add_post.jsp">
						    <table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D5EAA9" style="border-collapse:collapse">
                              <tr>
                                <td>线路编号：</td>
                                <td><input name='xianlubianhao' type='text' id='xianlubianhao' value='<%= xianlubianhao%>' />                                  &nbsp;*</td>
                              </tr>
                              <tr>
                                <td>线路名称：</td>
                                <td><input name='xianlumingcheng' type='text' id='xianlumingcheng' size='50' value='<%=xianlumingcheng%>' />                                  &nbsp;*</td>
                              </tr>
                              <tr>
                                <td>出发地：</td>
                                <td><input name='chufadi' type='text' id='chufadi' value='<%= chufadi%>' /></td>
                              </tr>
                              <tr>
                                <td>目的地：</td>
                                <td><input name='mudedi' type='text' id='mudedi' value='<%= mudedi%>' /></td>
                              </tr>
                              <tr>
                                <td>交通工具：</td>
                                <td><input name='jiaotonggongju' type='text' id='jiaotonggongju' value='<%=jiaotonggongju%>' /></td>
                              </tr>
                              <tr>
                                <td>费用：</td>
                                <td><input name='feiyong' type='text' id='feiyong' value='<%= feiyong%>' /></td>
                              </tr>
                              <tr>
                                <td>出行时间：</td>
                                <td><input name='chuxingshijian' type='text' id='chuxingshijian' value='<%= chuxingshijian%>' onClick="getDate(form1.chuxingshijian,'2')" need="1"  /></td>
                              </tr>
                              <tr>
                                <td>发布人：</td>
                                <td><input name='faburen' type='text' id='faburen' value='<%=faburen%>' /></td>
                              </tr>
                              <tr>
                                <td>参加人：</td>
                                <td><input name='canjiaren' type='text' id='canjiaren' value='<%=request.getSession().getAttribute("username")%>' />
                                  &nbsp;*</td>
                              </tr>
                              <tr>
                                <td>备注：</td>
                                <td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td><input type="submit" name="Submit5" value="提交" onClick="return check();" />
                                    <input type="reset" name="Submit22" value="重置" /></td>
                              </tr>
                            </table>
                              </form>
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