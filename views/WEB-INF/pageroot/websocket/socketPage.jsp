<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page errorPage="../error.jsp" %> <%--一旦出现错误后将跳转到error.jsp中 --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh">
<head  >
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=request.getContextPath()%>/res/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/res/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/res/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/res/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/res/js/html5shiv.js"></script>
      <script src="<%=request.getContextPath()%>/res/js/respond.min.js"></script>
    <![endif]-->
    
    <title>平台管理员主界面</title>
    <!-- for jquery easy ui -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/default/easyui.css">  
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/themes/color.css">   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyui1_4/demo/demo.css"> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.min.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyui1_4/jquery.easyui.min.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/beauty/validate.js"></script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/beauty/normal.js"></script> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/beauty/sysconst.js"></script> 
</head>
<body onload="bodyload()">
   <div class="easyui-layout" style="width:100%;height:100%;">
           <div data-options="region:'west',split:true" title="扫描结果列表" style="width:250px;">
                <div class="panel panel-info">
			        <div class="panel-heading">
			            <a href="javascript:clickLeft()" id="totalUser" ></a>
			        </div>
			        <div class="panel-body" style="text-align: center">
			            <a href="javascript:clickLeft()" ><img src="<%=request.getContextPath()%>/res/images/pageimage/home/notconfirm.png" /> </a>
			        </div>
		        </div>
		        
		        <div class="panel panel-info">
			        <div class="panel-heading">
			            <a href="javascript:clickLeft()" id="currentPage" ></a>
			        </div>
			        <div class="panel-body" style="text-align: center">
			            <a href="javascript:clickLeft()" ><img src="<%=request.getContextPath()%>/res/images/pageimage/home/notstart.png" /> </a>
			        </div>
		        </div>
        </div> <!-- end of west -->
        
        <div data-options="region:'center',split:true" style="width:50px;">
                  <!-- 表格 -->
			      <table id="dg" title="用户列表" class="easyui-datagrid" style="width:100%;height:100%"
							           data-options="singleSelect:true,border:true,fit:true, fitColumns: true,scrollbarSize:0,url:'<%=request.getContextPath()%>/home/user/queryUsers',method:'post'"
							            toolbar="#toolbar" pagination="true"
							            rownumbers="true" fitColumns="true" singleSelect="true">		            
			        <thead>
			            <tr>
			                <th field="username" width="50%" >用户姓名</th>
			                <th field="password" width="50%" >用户密码</th>
			            </tr>
			        </thead>
			      </table>
			      <!-- 菜单条 -->
			      <div id="toolbar">
			        <table width='100%'>
				      <tr>
					      <td align="left">
					             <span>用户姓名:</span><input type="text" id="qusername" value="" style="width:160px;" />
					            
						         <a href="javascript:Query()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> 
						         
						         
					      </td>
					      <td align="right">
					            
					      </td>
				      </tr>
				      </table>
			      </div>   
    </div>
    
    <div id="opTaskSoundDiv" style="display:none">
    </div>

    <script type="text/javascript">
    
    ////////////////////////////////////////////以下是WebSocket相关代码//////////////////////////////////////////////////////////
    //var webSocket = new WebSocket('ws://localhost:8080/knowledge/websocket');
     var path="<%=request.getContextPath()%>";
     var userId="<%=request.getSession().getAttribute("userId")%>";
    //var ff="<%=application.getAttribute("webSocketServerAddress")%>";
    var webSocket = new WebSocket('<%=application.getAttribute("webSocketServerAddress")%>');
		webSocket.onerror = function(event) {
			onError(event);
		};
		webSocket.onopen = function(event) {
			onOpen(event);
		};
		webSocket.onmessage = function(event) {
			onMessage(event);
		};
		function onMessage(event) {
		    var result = eval('('+event.data+')');
			document.getElementById('totalUser').innerHTML 
				= "共有用户:"+result.total;
			document.getElementById('currentPage').innerHTML 
				= "当前页:"+result.page;
		   	
			
			 if(result.users!=null)
		    {
                 $('#dg').datagrid('loadData',result.users); 
                 mentionBySound("opTaskSoundDiv",path + "/res/sounds/song","opTaskSound","opTaskSoundObj");
		    }
		    else
		    {
		       console.log(result.tasks);
		    }
		    
		}
		function onOpen(event) {
			socketStart();
			
		}
		function onError(event) {
			//alert(event.data);
		}
		function socketStart() {
		    if(userId=='null')
		    {
		        alert("未登录或session超时，请先登录!");
		        window.open("<%=request.getContextPath()%>/home/user/login?format=html","_parent");
		        return;
		    }
		    else
		    {
		        //alert('sarting...'+userId);
		        webSocket.send(userId);
		    }
		    
			return false;
		}
		/*
                            基于js的定时器
        function startRequest() {  
            //alert("I'm coming!");
                          //$("#Logo1_lblTime").text((new Date()).toLocaleDateString() + " " + (new Date()).toLocaleTimeString());   
        }  
        //设定每隔60秒定时刷新页面
	    $(function() {  
	       // startRequest();  
	        //setInterval("startRequest()", 60000);  
	    });  
        */
        
        function clickLeft()
        {
           alert('hello, you have clicked the left panel!');
        }
        
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
       
        function bodyload()
        {
            
        }

        //根据查询条件取得所有信息
        function Query(){  
        $('#dg').datagrid('load',{  
            username:$('#qusername').val()  
            });  
        } 
       
    </script>
  
</body>
</html>






