
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
    
    <title>酒店预订</title><script language="javascript" src="js/Calendar.js"></script>
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
	if(document.form1.jiudianmingcheng.value==""){alert("请输入酒店名称");document.form1.jiudianmingcheng.focus();return false;}if(document.form1.kefangbianhao.value==""){alert("请输入客房编号");document.form1.kefangbianhao.focus();return false;}if(document.form1.jiage.value==""){alert("请输入价格");document.form1.jiage.focus();return false;}if(document.form1.yudingshijian.value==""){alert("请输入预订时间");document.form1.yudingshijian.focus();return false;}if(document.form1.yudingtianshu.value==""){alert("请输入预订天数");document.form1.yudingtianshu.focus();return false;}if(document.form1.nindexingming.value==""){alert("请输入您的姓名");document.form1.nindexingming.focus();return false;}if(document.form1.nindedianhua.value==""){alert("请输入您的电话");document.form1.nindedianhua.focus();return false;}if(document.form1.nindeshenfenzheng.value==""){alert("请输入您的身份证");document.form1.nindeshenfenzheng.focus();return false;}if(document.form1.yonghuming.value==""){alert("请输入用户名");document.form1.yonghuming.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="jiudianyuding_updt_post.jsp?id=<%=id %>">
  修改酒店预订:
  <br><br>
  <%
  String sql="select * from jiudianyuding where id="+id;
  String jiudianmingcheng="";String kefangbianhao="";String jiage="";String yudingshijian="";String yudingtianshu="";String nindexingming="";String nindedianhua="";String nindeshenfenzheng="";String beizhu="";String yonghuming="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  jiudianmingcheng=RS_result.getString("jiudianmingcheng");kefangbianhao=RS_result.getString("kefangbianhao");jiage=RS_result.getString("jiage");yudingshijian=RS_result.getString("yudingshijian");yudingtianshu=RS_result.getString("yudingtianshu");nindexingming=RS_result.getString("nindexingming");nindedianhua=RS_result.getString("nindedianhua");nindeshenfenzheng=RS_result.getString("nindeshenfenzheng");beizhu=RS_result.getString("beizhu");yonghuming=RS_result.getString("yonghuming");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>酒店名称：</td><td><input name='jiudianmingcheng' type='text' id='jiudianmingcheng' size='50' value='<%=jiudianmingcheng%>' /></td></tr><tr><td>客房编号：</td><td><input name='kefangbianhao' type='text' id='kefangbianhao' value='<%= kefangbianhao%>' /></td></tr><tr><td>价格：</td><td><input name='jiage' type='text' id='jiage' value='<%= jiage%>' /></td></tr><tr><td>预订时间：</td><td><input name='yudingshijian' type='text' id='yudingshijian' value='<%= yudingshijian%>' onclick="getDate(form1.yudingshijian,'2')" need="1"  /></td></tr><tr><td>预订天数：</td><td><input name='yudingtianshu' type='text' id='yudingtianshu' value='<%= yudingtianshu%>' /></td></tr><tr><td>您的姓名：</td><td><input name='nindexingming' type='text' id='nindexingming' value='<%= nindexingming%>' /></td></tr><tr><td>您的电话：</td><td><input name='nindedianhua' type='text' id='nindedianhua' value='<%= nindedianhua%>' /></td></tr><tr><td>您的身份证：</td><td><input name='nindeshenfenzheng' type='text' id='nindeshenfenzheng' size='50' value='<%=nindeshenfenzheng%>' /></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'><%=beizhu%></textarea></td></tr><tr><td>用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='<%= yonghuming%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


