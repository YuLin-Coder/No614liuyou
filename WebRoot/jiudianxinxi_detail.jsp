
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
    
    <title>酒店信息详细</title><script language="javascript" src="js/Calendar.js"></script>
	
    <LINK href="CSS.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	fewgidsoidfjdkgds
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>

  酒店信息详细:
  <br><br>
  <%
  String sql="select * from jiudianxinxi where id="+id;
  String bianhao="";String mingcheng="";String xingji="";String dizhi="";String dianhua="";String zhaopian="";String beizhu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");xingji=RS_result.getString("xingji");dizhi=RS_result.getString("dizhi");dianhua=RS_result.getString("dianhua");zhaopian=RS_result.getString("zhaopian");beizhu=RS_result.getString("beizhu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <td width='11%'>编号：</td><td width='39%'><%=bianhao%></td><td width='11%'>名称：</td><td width='39%'><%=mingcheng%></td></tr><tr><td width='11%'>星级：</td><td width='39%'><%=xingji%></td><td width='11%'>地址：</td><td width='39%'><%=dizhi%></td></tr><tr><td width='11%'>电话：</td><td width='39%'><%=dianhua%></td><td width='11%'>照片：</td><td width='39%'><%=zhaopian%></td></tr><tr><td width='11%'>备注：</td><td width='39%'><%=beizhu%></td><td>&nbsp;</td><td>&nbsp;</td>
    <tr>
      <td colspan="4" align="center"><input type="button" name="Submit" value="返回" onclick="javascript:history.back()" /></td>
    </tr>
  </table>

  </body>
</html>


