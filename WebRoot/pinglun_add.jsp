
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
    
    <title>评论</title><LINK href="CSS.css" type=text/css rel=stylesheet>
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
	if(document.form1.xinwenID.value==""){alert("请输入新闻ID");document.form1.xinwenID.focus();return false;}if(document.form1.pinglunneirong.value==""){alert("请输入评论内容");document.form1.pinglunneirong.focus();return false;}if(document.form1.pinglunren.value==""){alert("请输入评论人");document.form1.pinglunren.focus();return false;}
}
function gow()
{
	document.location.href="pinglun_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <form name="form1" id="form1" method="post" action="pinglun_add_post.jsp">
  添加评论:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>新闻ID：</td><td><input name='xinwenID' type='text' id='xinwenID' value='' />&nbsp;*</td></tr><tr><td>评论内容：</td><td><textarea name='pinglunneirong' cols='50' rows='5' id='pinglunneirong'></textarea>&nbsp;*</td></tr><tr><td>评论人：</td><td><input name='pinglunren' type='text' id='pinglunren' value='' />&nbsp;*</td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

