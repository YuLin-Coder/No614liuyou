
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
    
    <title>吉他购物网站</title>
    

  </head>
  <%
  String id=request.getParameter("id");
   %>
  <body >
<DIV align=center><LINK href="qtimages/CSS.css" type=text/css 
rel=stylesheet>
<DIV align=center></DIV>
<table width="99%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><table width="100%" height="35"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="2%" align="left" background="qtimages/bian-bian.gif">&nbsp;</td>
        <td width="44%" align="left" valign="middle" background="qtimages/bian-bian.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="24" valign="bottom" class="big STYLE2">修改图书数量</td>
          </tr>
        </table></td>
        <td width="54%" align="left" background="qtimages/bian-bian.gif"><table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td height="23" align="right" valign="bottom"><font color="#FFFFFF">您现在的位置：首页 &gt;&gt;<span class="big STYLE2">用户注册</span></font> </td>
          </tr>
        </table></td>
      </tr>
    </table>
        <form name="form1" id="form1" method="post" action="sl_post.jsp">
          修改图书数量 <br>
          <br>
          <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
            <tr>
              <td>数量：</td>
              <td><input name='sl' type='text' id='sl' value='<%=request.getParameter("yuan")%>' />
                <input name='id' type='hidden' id='id' value='<%=id %>' size="15" />
                *</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
                <input type="reset" name="Submit2" value="重置" /></td>
            </tr>
          </table>
        </form></td>
  </tr>
</table>
  </body>
</html>

