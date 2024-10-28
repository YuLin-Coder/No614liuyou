
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
    
    <title>自驾游线路</title><script language="javascript" src="js/Calendar.js"></script>
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
	if(document.form1.xianlubianhao.value==""){alert("请输入线路编号");document.form1.xianlubianhao.focus();return false;}if(document.form1.xianlumingcheng.value==""){alert("请输入线路名称");document.form1.xianlumingcheng.focus();return false;}if(document.form1.faburen.value==""){alert("请输入发布人");document.form1.faburen.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="zijiayouxianlu_updt_post.jsp?id=<%=id %>">
  修改自驾游线路:
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
     <tr><td>线路编号：</td><td><input name='xianlubianhao' type='text' id='xianlubianhao' value='<%= xianlubianhao%>' /></td></tr><tr><td>线路名称：</td><td><input name='xianlumingcheng' type='text' id='xianlumingcheng' size='50' value='<%=xianlumingcheng%>' /></td></tr><tr><td>出发地：</td><td><input name='chufadi' type='text' id='chufadi' value='<%= chufadi%>' /></td></tr><tr><td>目的地：</td><td><input name='mudedi' type='text' id='mudedi' value='<%= mudedi%>' /></td></tr><tr><td>交通工具：</td><td><select name='jiaotonggongju' id='jiaotonggongju'>
       <option value="火车">火车</option>
       <option value="汽车">汽车</option>
	   <option value="飞机">飞机</option>
       <option value="轮船">轮船</option>
       <option value="步行">步行</option>
       <option value="自行车">自行车</option>
     </select></td></tr><script language="javascript">document.form1.jiaotonggongju.value='<%=jiaotonggongju%>';</script><tr><td>费用：</td><td><input name='feiyong' type='text' id='feiyong' value='<%= feiyong%>' /></td></tr><tr><td>出行时间：</td><td><input name='chuxingshijian' type='text' id='chuxingshijian' value='<%= chuxingshijian%>' onClick="getDate(form1.chuxingshijian,'2')" need="1"  /></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'><%=beizhu%></textarea></td></tr><tr><td>发布人：</td><td><input name='faburen' type='text' id='faburen' value='<%= faburen%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


