<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>塞北村镇旅游网站</title>
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


  String sc=new String(request.getParameter("sc").getBytes("8859_1"));
  String ltt=new String(request.getParameter("ltt").getBytes("8859_1"));
  String qd=new String(request.getParameter("qd").getBytes("8859_1"));

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
                        <td width="95%" class="STYLE2"><strong>旅游商品</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="__01" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top"><form name="form1" id="form1" method="post" action="prolist.jsp">
                          <TABLE height=32 cellSpacing=0 cellPadding=0 width="100%" 
              border=0>
                            <TBODY>
                              <TR>
                                <TD width=40>&nbsp;</TD>
                                <TD class=lancu align=middle width=187>搜索</TD>
                                <TD align=left width=553><select name="ltt" id="ltt">
                                    <option value="mingcheng">名称</option>
                                    <option value="leibie">类别</option>
                                  </select>
                                    <INPUT name=qd class=kuang id=qd size="35" 
                  maxLength=50>
                                    <input name="sc" type="hidden" id="sc" value="1"></TD>
                                <TD align=middle width=243><input type="submit" name="Submit5" value="提交" style=" height:19px; border:solid 1px #000000; color:#666666"></TD>
                              </TR>
                                </TABLE>
                        </form>
                          <table width="100%" height="205" border="0">
                            <tr>
                              <%
				  int i=0;
				  int j=0;
				  String id="";
				  String bianhao="";
				  String mingcheng="";
				  String tupian="";
				  String leibie="";
				   
				   int curpage=1;//当前页
				int page_record=8;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from shangpinxinxi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
				//out.print(curpage);
	
				String sql="select top "+page_record+" * from shangpinxinxi where id not in (select top "+((curpage-1)*page_record)+" id from shangpinxinxi order by id desc) ";
				  
				  if( sc.equals(""))
				  {}
				  else
				  {
				  	sql=sql+" and "+ltt+" like '%"+qd+"%'";
				  }
				  sql=sql+" order by id desc";
				  
				  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
					i=i+1;
					j=j+1;
					id=RS_result.getString("id");
					bianhao=RS_result.getString("bianhao");
					mingcheng=RS_result.getString("mingcheng");
					tupian=RS_result.getString("tupian");
										leibie=RS_result.getString("leibie");
				  %>
                              <td align="center"><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F8A838" style="border-collapse:collapse">
                                  <tr>
                                    <td height="161" align="center"><p><a href="prodetail.jsp?id=<%=id%>"><img src="<%=tupian %>" width="143" height="134" border="0"></a></p></td>
                                  </tr>
                                  <tr>
                                    <td align="center"><%=mingcheng%>(类别：<%=leibie%>)</td>
                                  </tr>
                              </table></td>
                              <%
					
					if (j==4)
					{
						j=0;
						
						out.print("</tr><tr>");
						}
					
					}
					%>
                            </tr>
                          </table>
                          <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>首/页　<a href="prolist.jsp?page=1&qd=<%=qd%>&sc=<%=sc%>&ltt=<%=ltt%>">首页</a>　<a href="prolist.jsp?page=<%= curpage-1%>&qd=<%=qd%>&sc=<%=sc%>&ltt=<%=ltt%>">上一页</a>　<A 
                        
                        href="prolist.jsp?page=<%= curpage+1%>&qd=<%=qd%>&sc=<%=sc%>&ltt=<%=ltt%>">下一页</A>　<a href="prolist.jsp?page=<%=zys %>&qd=<%=qd%>&sc=<%=sc%>&ltt=<%=ltt%>">尾页</A>　当前第<FONT 
                        color=red><%=curpage %></FONT>页/共<FONT 
                        color=red><%=zys %></FONT>页</p>
                          <p align="center">&nbsp;</p>
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