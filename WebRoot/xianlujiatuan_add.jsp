
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
    
    <title>线路加团</title><LINK href="CSS.css" type=text/css rel=stylesheet>
    <script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	</script>
  </head>
<script language="javascript">
function check()
{
	if(document.form1.xianlubianhao.value==""){alert("请输入线路编号");document.form1.xianlubianhao.focus();return false;}if(document.form1.xianlumingcheng.value==""){alert("请输入线路名称");document.form1.xianlumingcheng.focus();return false;}if(document.form1.canjiaren.value==""){alert("请输入参加人");document.form1.canjiaren.focus();return false;}
}
function gow()
{
	document.location.href="xianlujiatuan_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <form name="form1" id="form1" method="post" action="xianlujiatuan_add_post.jsp">
  添加线路加团:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>线路编号：</td><td><input name='xianlubianhao' type='text' id='xianlubianhao' value='' />&nbsp;*</td></tr><tr><td>线路名称：</td><td><input name='xianlumingcheng' type='text' id='xianlumingcheng' value='' size='50' />&nbsp;*</td></tr><tr><td>出发地：</td><td><input name='chufadi' type='text' id='chufadi' value='' /></td></tr><tr><td>目的地：</td><td><input name='mudedi' type='text' id='mudedi' value='' /></td></tr><tr><td>交通工具：</td><td><input name='jiaotonggongju' type='text' id='jiaotonggongju' value='' /></td></tr><tr><td>费用：</td><td><input name='feiyong' type='text' id='feiyong' value='' /></td></tr><tr><td>出行时间：</td><td><input name='chuxingshijian' type='text' id='chuxingshijian' value='' /></td></tr><tr><td>发布人：</td><td><input name='faburen' type='text' id='faburen' value='' /></td></tr><tr><td>参加人：</td><td><input name='canjiaren' type='text' id='canjiaren' value='<%=request.getSession().getAttribute("username")%>' />&nbsp;*</td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

