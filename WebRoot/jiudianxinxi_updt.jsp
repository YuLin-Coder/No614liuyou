
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
    
    <title>酒店信息</title><script language="javascript" src="js/Calendar.js"></script>
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
    <LINK href="CSS.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.bianhao.value==""){alert("请输入编号");document.form1.bianhao.focus();return false;}if(document.form1.mingcheng.value==""){alert("请输入名称");document.form1.mingcheng.focus();return false;}if(document.form1.dianhua.value==""){alert("请输入电话");document.form1.dianhua.focus();return false;}if(document.form1.zhaopian.value==""){alert("请输入照片");document.form1.zhaopian.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="jiudianxinxi_updt_post.jsp?id=<%=id %>">
  修改酒店信息:
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
     <tr><td>编号：</td><td><input name='bianhao' type='text' id='bianhao' value='<%= bianhao%>' /></td></tr><tr><td>名称：</td><td><input name='mingcheng' type='text' id='mingcheng' size='50' value='<%=mingcheng%>' /></td></tr><tr><td>星级：</td><td><select name='xingji' id='xingji'>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
     </select></td></tr><script language="javascript">document.form1.xingji.value='<%=xingji%>';</script><tr><td>地址：</td><td><input name='dizhi' type='text' id='dizhi' size='50' value='<%=dizhi%>' /></td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<%= dianhua%>' /></td></tr><tr><td>照片：</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')"/></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'><%=beizhu%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


