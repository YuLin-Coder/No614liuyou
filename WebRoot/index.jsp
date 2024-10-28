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
-->
</style></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="qttop.jsp"%>
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
                <td><table id="__01" width="758" height="240" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="337" height="240" align="center"><SCRIPT type=text/javascript>
var focus_width=320;
var focus_height=210;
var text_height=20;
var swf_height = focus_height+text_height;
var pics="";
var links="";
var texts="";
<%
	String sqlbht;
	sqlbht="select id,biaoti,shouyetupian from xinwentongzhi where shouyetupian<>'' and shouyetupian<>'null' order by id desc limit 0,5";
	ResultSet RS_resultbht=connDbBean.executeQuery(sqlbht);
	String idbht="";
	String biaotibht="";
	String shouyetupianbht="";
	 while(RS_resultbht.next()){
 shouyetupianbht=shouyetupianbht+RS_resultbht.getString("shouyetupian")+"|";
 idbht=idbht+"gg_detail.jsp?id="+RS_resultbht.getString("id")+"|";
 biaotibht=biaotibht+RS_resultbht.getString("biaoti")+"|";
 }
 shouyetupianbht=shouyetupianbht.substring(0,shouyetupianbht.length()-1);
 idbht=idbht.substring(0,idbht.length()-1);
 biaotibht=biaotibht.substring(0,biaotibht.length()-1);
%>
pics="<%=shouyetupianbht%>";
links="<%=idbht%>";
texts="<%=biaotibht%>";
document.write('<embed src="qtimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#ffffff" quality="Best" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');

</SCRIPT></td>
                    <td><table id="__01" width="421" height="240" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="421" height="42" background="qtimages/1_02_02_01_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="14%">&nbsp;</td>
                            <td width="86%" class="STYLE1"><strong>站内新闻</strong></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table id="__01" width="421" height="187" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="qtimages/1_02_02_01_02_02_01.jpg" width="10" height="187" alt=""></td>
                            <td width="399" height="187" valign="top"><table class="newsline" cellspacing="0" cellpadding="0" width="98%" 
                  align="center" border="0">
                              <tbody>
                                <%
							String sql="";
							sql="select id,biaoti,addtime from xinwentongzhi where leibie='news' order by id desc limit 0,4";
							 String id="";
 String biaoti="";
 String addtime="";
 int i=0;
  ResultSet RS_result=connDbBean.executeQuery(sql);
							while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
biaoti=RS_result.getString("biaoti");
if(biaoti.length() >=24)
{
biaoti=biaoti.substring(0,24);
}
 addtime=RS_result.getString("addtime");
 
 
							
							%>
                                <tr>
                                  <td width="4%" height="28" align="center" ><img src="qtimages/1.jpg" width="9" height="9"></td>
                                  <td width="80%" height="28"><a 
                        href="gg_detail.jsp?id=<%=id%>"><%=biaoti%></a> </td>
                                  <td width="16%" height="28"><%
                              
out.print(addtime.substring(0,10));
%>
                                  </td>
                                </tr>
                                <%
							}
							%>
                              </tbody>
                            </table></td>
                            <td><img src="qtimages/1_02_02_01_02_02_03.jpg" width="12" height="187" alt=""></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><img src="qtimages/1_02_02_01_02_03.jpg" width="421" height="11" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="758" height="236" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="95%" class="STYLE2">酒店推荐</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="758" height="183" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_02_02_02_01.jpg" width="12" height="183" alt=""></td>
                        <td width="733" height="183"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <%
					  
   sql="";
  sql="select  * from jiudianxinxi where zhaopian<>''";
  
  sql=sql+" order by id desc limit 0,5";
  RS_result=connDbBean.executeQuery(sql);
  id="";
  biaoti="";
 String tupian="";

  i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
biaoti=RS_result.getString("mingcheng");tupian=RS_result.getString("zhaopian");

 
 

					  %>
                            <td><table width="89%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="134" align="center"><a href="jiudianxinxidetail.jsp?id=<%=id%>"><img src="<%=tupian%>" width="117" height="117" border="0"></a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><%=biaoti%></td>
                                </tr>
                            </table></td>
                            <%
  }
   %>
                          </tr>
                        </table></td>
                        <td><img src="qtimages/1_02_02_02_02_03.jpg" width="13" height="183" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="758" height="236" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="5%">&nbsp;</td>
                          <td width="95%" class="STYLE2">系统简介</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="758" height="183" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="12" background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                          <td width="733" height="183"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>

                                <td valign="top"><p align="center">
                                  <%
							 sql="select content from dx where leibie='系统简介'";
  String neirong="";
   RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
neirong=RS_result.getString("content");
   %>
                                </p>
                                  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#F6C978" style="border-collapse:collapse" class="newsline">
                                    <tr>
                                      <td height="110" align="left"><%=neirong %></td>
                                    </tr>
                                  </table>
                                  <%}%></td>
                               
                              </tr>
                          </table></td>
                          <td width="13" background="qtimages/1_02_02_02_02_03.jpg">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
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