<%@ page language="java"  pageEncoding="gb2312"%>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
	{
		out.print("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
	}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>塞北村镇旅游网站</title><script language="javascript" src="js/Calendar.js"></script>
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
  connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
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
                        <td width="95%" class="STYLE2"><strong>酒店预订</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><form name="form1" method="post" action="jiudianyuding_add_post.jsp">
                          <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                            <tr>
                              <td>酒店名称：</td>
                              <td><input name='jiudianmingcheng' type='text' id='jiudianmingcheng' value='<%=URLDecoder.decode(request.getParameter("jd"), "UTF-8")%>' size='50' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>客房编号：</td>
                              <td><input name='kefangbianhao' type='text' id='kefangbianhao' value='<%=new String(request.getParameter("kfbh").getBytes("8859_1"))%>' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>价格：</td>
                              <td><input name='jiage' type='text' id='jiage' value='<%=new String(request.getParameter("jg").getBytes("8859_1"))%>' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>预订时间：</td>
                              <td><input name='yudingshijian' type='text' id='yudingshijian' value=''  onClick="getDate(document.form1.yudingshijian,'2')" need='1' />
                                &nbsp;*  填写格式如：2020-05-05</td>
                            </tr>
                            <tr>
                              <td>预订天数：</td>
                              <td><input name='yudingtianshu' type='text' id='yudingtianshu' value='' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>您的姓名：</td>
                              <td><input name='nindexingming' type='text' id='nindexingming' value='' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>您的电话：</td>
                              <td><input name='nindedianhua' type='text' id='nindedianhua' value='' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>您的身份证：</td>
                              <td><input name='nindeshenfenzheng' type='text' id='nindeshenfenzheng' value='' size='50' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>备注：</td>
                              <td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td>
                            </tr>
                            <tr>
                              <td>用户名：</td>
                              <td><input name='yonghuming' type='text' id='yonghuming' value='<%=request.getSession().getAttribute("username")%>' />
                                &nbsp;*</td>
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