<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*"  pageEncoding="UTF-8"%>
<%@page errorPage="../error.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>登录界面</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4//themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.easyui.min.js"></script>
<script type="text/javascript">

function tijiao()
{
    
    var username=document.getElementById("username").value;
    var password=document.getElementById("password").value;
    if(username==""||username==null)
	{
		alert("请输入用户名！");
		return false;
	}
	else if(password==""||password==null)
    {
		alert("请输入密码！");
		return false;
	}else
	{
			 jQuery.ajax({
				url:"<%=request.getContextPath()%>/home/user/login",
				type : "post",
				data : {
					username : username,
					password:password,
					time : (new Date()).getTime(),
					cache : false
				},
				success:function(result) {
				    if(result.success==true)
				    {
				        window.open("<%=request.getContextPath()%>/home/home/frame?format=html","_self");
				    }
				    else
				    {
				       $.messager.alert('提示','用户名或密码不正确!');
					}
				   },
			    failure:function(result){
			        alert("网络连接错误！");
			       $.messager.alert('错误','网络连接错误!','error');
			    }
			}); 
    } 
}

</script>




</head>
<body style="background: url('<%=request.getContextPath()%>/res/images/login/dlbj.jpg'); width: 100%; height: 100%;">
<table width="100%" height="100%">
<tr >
<td height="250">      

</td>
</tr>
<tr >
   <td>
    <form	name="myform" class="STYLE3" action="/login" >
			<table width="550" height="321" border="0" align="center"  
				cellpadding="0" cellspacing="0">
				<tr valign="middle">
					<td width="550" height="252"
						background="<%=request.getContextPath()%>/res/images/login/logins.jpg"
						valign="middle">
						<table width="255" height="132" border="0" align="right"
							cellpadding="0" cellspacing="0"
							style="margin-right: 35px; margin-top: 45px;">
							<tr>
								<td align="center" style="color: 'red'; font-size: 18"
									colspan="2">
								</td>
							</tr>
							<tr>
								<td align="center" class="STYLE3">
									<img src="<%=request.getContextPath()%>/res/images/login/pp01.gif" border="0" align="left" style="top: 114px; left: 197px; width: 89px; height: 22px;">
								</td>
								<td>
								<input type="text" id="username" name="username" size="18"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="STYLE3">
									
									<img src="<%=request.getContextPath()%>/res/images/login/pp02.gif" border="0" align="left" style="top: 114px; left: 197px; width: 89px; height: 22px;">
								</td>
								<td>
									<INPUT title=登录密码 id="password" type=password maxLength=18 size="18" name="password" >
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2" class="fontsizecom">
						             <input  onclick="tijiao();" type="button" value="登录" width=50 />
						             <input  type="reset" value="重置"/>
		                        </td>
								<td  align="left">
								     
								</td>
								<td>
								</td>
								</tr>
							</table>
					</td>
				</tr>
				<tr>
					<td>
						<table align="center">
							<tr>
								<td align="center">
									<font color="red" size="2"> ${test}</font>
									<br />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		</td>
</tr>
<tr >
<td height="30%"></td>
</tr>
</table>  

	

		  
	



</body>
</html>