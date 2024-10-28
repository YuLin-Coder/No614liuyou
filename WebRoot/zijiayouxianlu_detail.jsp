
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
    
    <title>自驾游线路详细</title><script language="javascript" src="js/Calendar.js"></script>
	
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

  自驾游线路详细:
  <br><br>
  <%
  String sql="select * from zijiayouxianlu where id="+id;
  String xianlubianhao="";String xianlumingcheng="";String chufadi="";String mudedi="";String jiaotonggongju="";String feiyong="";String chuxingshijian="";String beizhu="";String faburen="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xianlubianhao=RS_result.getString("xianlubianhao");xianlumingcheng=RS_result.getString("xianlumingcheng");chufadi=RS_result.getString("chufadi");mudedi=RS_result.getString("mudedi");jiaotonggongju=RS_result.getString("jiaotonggongju");feiyong=RS_result.getString("feiyong");chuxingshijian=RS_result.getString("chuxingshijian");beizhu=RS_result.getString("beizhu");faburen=RS_result.getString("faburen");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <td width='11%'>线路编号：</td><td width='39%'><%=xianlubianhao%></td><td width='11%'>线路名称：</td><td width='39%'><%=xianlumingcheng%></td></tr><tr><td width='11%'>出发地：</td><td width='39%'><%=chufadi%></td><td width='11%'>目的地：</td><td width='39%'><%=mudedi%></td></tr><tr><td width='11%'>交通工具：</td><td width='39%'><%=jiaotonggongju%></td><td width='11%'>费用：</td><td width='39%'><%=feiyong%></td></tr><tr><td width='11%'>出行时间：</td><td width='39%'><%=chuxingshijian%></td><td width='11%'>备注：</td><td width='39%'><%=beizhu%></td></tr><tr><td width='11%'>发布人：</td><td width='39%'><%=faburen%></td><td>&nbsp;</td><td>&nbsp;</td>
    <tr>
      <td colspan="4" align="center"><input type="button" name="Submit" value="返回" onclick="javascript:history.back()" /></td>
    </tr>
  </table>

  </body>
</html>


