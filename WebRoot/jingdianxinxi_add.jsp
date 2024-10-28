
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
    
    <title>景点信息</title><LINK href="CSS.css" type=text/css rel=stylesheet>
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
	if(document.form1.mingcheng.value==""){alert("请输入名称");document.form1.mingcheng.focus();return false;}if(document.form1.xingji.value==""){alert("请输入星级");document.form1.xingji.focus();return false;}
}
function gow()
{
	document.location.href="jingdianxinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <form name="form1" id="form1" method="post" action="jingdianxinxi_add_post.jsp">
  添加景点信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>名称：</td><td><input name='mingcheng' type='text' id='mingcheng' value='' size='50' />&nbsp;*</td></tr><tr><td>星级：</td><td><select name='xingji' id='xingji'>
     <option value="一星级">一星级</option>
     <option value="二星级">二星级</option>
     <option value="三星级">三星级</option>
     <option value="四星级">四星级</option>
     <option value="五星级">五星级</option>
   </select>&nbsp;*</td></tr><tr><td>地址：</td><td><input name='dizhi' type='text' id='dizhi' value='' size='50' /></td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' /></td></tr><tr><td>简介：</td><td><textarea name='jianjie' cols='50' rows='5' id='jianjie'></textarea></td></tr><tr><td>照片：</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='' />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')"/></td></tr><tr><td>票价：</td><td><input name='piaojia' type='text' id='piaojia' value='' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

