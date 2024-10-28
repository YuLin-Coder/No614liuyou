<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
<head>
    <base href="<%=basePath%>">
    
<title>塞北村镇旅游网站</title>
<style type="text/css">
<!--
*{overflow:hidden; font-size:9pt;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
	background-repeat: repeat-x;
	background-color: #EFF6FE;
}
.STYLE5 {color: #CCFFCC;
	font-size: 26pt;
}
.STYLE7 {color: #333333}
-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<script language="javascript">
function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="")
	{
		alert('请输入完整');
		return false;
	}
}
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="990" height="587" border="0" align="center" cellpadding="0" cellspacing="0" background="images/212.jpg" id="__01">
	<tr>
		<td height="241" colspan="3" background="images/middleh40edbhf_01.png"><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
          <div align="center" class="STYLE5"></div>
      </div></td>
	</tr>
	<tr>
		<td width="400" rowspan="3"><p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>	    </td>
		<td width="367" height="120" valign="top" background="images/middleh40edbhf_03.png"><table width="190" border="0" align="center" cellpadding="0" cellspacing="0">
          <form name="form1" method="post" action="adminyanzheng.jsp">
		  <tr>
            <td width="44" height="30"><span class="STYLE3 STYLE7">用户:</span></td>
            <td width="142" height="30"><input name="username" type="text" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
          </tr>
          <tr>
            <td height="30"><span class="STYLE3 STYLE7">密码:</span></td>
            <td height="30"><input name="pwd" type="password" id="pwd" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
          </tr>
          <tr  >
            <td height="30"><span class="STYLE3 STYLE7">权限:</span></td>
            <td height="30"><select name="cx" id="cx">
        
				<option value="管理员">管理员</option>
              </select></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="登陆" onClick="return check();">&nbsp;
              <input type="reset" name="Submit2" value="重置"> 
              &nbsp;<a href="kehuxixilist.jsp" target="_blank"></a></td>
          </tr></form>
      </table></td>
		<td width="331" rowspan="3">&nbsp;</td>
	</tr>
	<tr>
	  <td height="26">&nbsp;</td>
  </tr>
	<tr>
	  <td height="102"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
	</tr>
</table>

</body>
</html>

