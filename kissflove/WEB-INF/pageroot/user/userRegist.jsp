<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@page errorPage="../error.jsp" %> <%--一旦出现错误后将跳转到error.jsp中 --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <!-- for bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
 
    <title>用户注册页面</title>
    <!-- for jquery easy ui -->
     <link rel="stylesheet"  href="<%=request.getContextPath()%>/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/default/easyui.css">  
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/color.css">   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/demo/demo.css"> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.min.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.easyui.min.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/easyui-lang-zh_CN.js"></script>   
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/beauty/validate.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/beauty/normal.js"></script> 
    
    <style>
        body{
            background: #ffffff;
        }
    </style>

</head>
<body onload="bodyload()">
<header class="container">
    <h2>注册</h2>
    <p>请输入您的手机号,便于我们更好地为您提供服务。谢谢！</p>
</header>
<hr>
 <section class="container">
    <form id="fm" method="post"  enctype="multipart/form-data" novalidate>
        <section class="form-group">
            <label for="mobile">手机号</label>
            <input type="text" placeholder="输入手机号码" id="mobile" name="mobile" class="form-control"/>
        </section>
        <section class="form-group">
           <label id="validCodeLabel" ></label>
            <button  type="button"  value="获取验证码"  id="btnGetMobileValidCode"  class="btn btn-default col-xs-8 col-xs-offset-2 btn-info">获取验证码</button>
        </section>
         <section class="form-group">
            <label for=""> </label>
        </section> 
        <section class="form-group">
            <label for="mobileValidCode">手机验证码</label>
            <input type="text" placeholder="输入手机验证码" id="mobileValidCode" name="mobileValidCode" class="form-control"/>
        </section>
        <section>
            <button type="button"  value="注册"  id="btnSave" onclick="save()" class="btn btn-default col-xs-8 col-xs-offset-2 btn-info">注册</button>
        </section>

    </form>
    
   
</section>


    <script type="text/javascript">
      var openId="${openId}";
      var path="<%=request.getContextPath()%>";
      var wait=60;
       
		function getMobileValidCode(o) {
		
		
		         if($('#mobile').val().trim()=='')
                {
                   $.messager.alert("提示", "请输入手机号码!");
                   return;
                }
                
		        if (wait == 0) {
		            o.removeAttribute("disabled");           
		            o.innerHTML="获取验证码";
		            wait = 60;
		        } else {
		        
		            if(wait==60)
		            {
		                 $.post('<%=request.getContextPath()%>/home/user/getMobileValidCode',{openId:openId,mobile:$('#mobile').val() },function(result){
                            if (result.success){
                                $.messager.alert("提示", result.msg);
                            } else {
                                $.messager.alert("失败", result.errorMsg);
                            }
                        },'json');
		            }
		            o.setAttribute("disabled", true);
		            o.innerHTML="重新发送(" + wait + ")";
		            wait--;
		            setTimeout(function() {getMobileValidCode(o);},1000);
		        }
		 }

       
    
        function bodyload()
        {
            document.getElementById("btnGetMobileValidCode").disabled = false;   
            document.getElementById("btnGetMobileValidCode").onclick=function(){getMobileValidCode(this);}
        }
        

        function save(){
           if($('#mobileValidCode').val().length!=6)
           {
                 $.messager.alert("错误", "请输入6位验证码!");
                 return;
           }
           
           
           $('#fm').form('submit',{
               url: '<%=request.getContextPath()%>/home/user/regist',
               onSubmit: function(param){
                   param.openId=openId;
                   return $(this).form('validate');
               },
               success: function(result){
                   var result = eval('('+result+')');
                   if (result.errorMsg){
                      $.messager.alert("错误", result.errorMsg);
                      
                   } else {
                      if(alert(result.msg))
                      {
		                  WeixinJSBridge.call('closeWindow');  //微信关闭页面
                      }
                      else
                      {
                           WeixinJSBridge.call('closeWindow');  //微信关闭页面
                      }
                   }
               }
           });
            
        }
        
       

      
        
    </script>
   
</body>
</html>

