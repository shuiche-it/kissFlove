<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@page errorPage="../error.jsp" %> <%--一旦出现错误后将跳转到error.jsp中 --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta charset="UTF-8">
    <meta name="viewport"  content="width=device-width,user-scalable=no">
    <meta name="copyright" content="Copyright (c) 水车 2016">
    <meta name="Keywords" content="这里是，关键字">
    <meta name="description" content="这里是网站的说明">
    <title>项目列表</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/banner.css">
    <link rel=" stylesheet" href = '<%=request.getContextPath()%>/res/css/list.css'>
    <!-- <link rel="stylesheet" type="text/css" href="at.alicdn.com/t/font_1456386232_3118882.css"> -->

</head>

<script src="<%=request.getContextPath()%>/res/js/TouchSlide.1.1.js"></script>

<style type="text/css">
    @font-face {font-family: 'iconfont';
    src: url('<%=request.getContextPath()%>/res/font/iconfont.eot'); /* IE9*/
    src: url('<%=request.getContextPath()%>/res/font/iconfont.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
    url('<%=request.getContextPath()%>/res/font/iconfont.woff') format('woff'), /* chrome、firefox */
    url('<%=request.getContextPath()%>/res/font/iconfont.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
    url('<%=request.getContextPath()%>/res/font/iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
    }

</style>
<script>
    var NUM = 0; // 记录导航条现在在哪一栏显示；
    window.onload = function () {
        titleCenter('title');
        navClick('navList','option');
    };

    function navClick(className,optionClassName){
        var obj= {
            dom :document.getElementsByClassName(className),
            fn: function (ev){ // 导航条点击后的效果
                if(ev.targetTouches.length == 1){
                    ev.preventDefault();
                    var touch = event.targetTouches[0];
                    // 导航条点击事件点击以后的事件
                    for(var i = 0; i<obj.dom.length; i++){
                        obj.dom[i].getElementsByTagName('a')[0].style.color = '#626262';
                    }
                    obj.dom[this.index].getElementsByTagName('a')[0].style.color = 'red';
                    NUM = this.index;
                    obj.optionChange(this.index)
                }
            },
            optionChange : function (a) { // 导航条被点击了以后,选项卡的切换；
                var options = document.getElementsByClassName('option');
                for(var i = 0; i < options.length; i++){
                    options[i].style.display = 'none';
                }
                options[NUM].style.display = 'block';
            },
            addEvent:function (obj, event, fn){ // 添加事件
                if(obj.attachEvent){
                    obj.attachEvent('on'+ event, fn);
                }
                else{
                    obj.addEventListener(event, fn, false);
                }
            }
        };
        for(var i = 0; i<obj.dom.length; i++){
            obj.addEvent(obj.dom[i],'touchstart',obj.fn);
            obj.dom[i].index = i;
        }
    }

    function AddEvent(obj, sevent, fn) {
        if (obj.attachEvent) {
            obj.attachEvent('on' + sevent, fn);
        }
        else {
            obj.addEventListener(sevent, fn, false);
        }
    }
    function titleCenter (className){ // 让标题居中显示
        var title = document.getElementsByClassName(className);
        var titleArr = [];
        for(var i=0; i<title.length; i++){
            titleArr[i] = title[i].offsetWidth;
            title[i].style.marginLeft = -titleArr[i]/2 + 'px';
        }
    }

</script>
<body>
<!-- banner轮播图 -->
<div id="content">
    
    <!-- 本例主要代码 Start ================================ -->
    <div id="slideBox" class="slideBox">

        <div class="bd">
            <ul>
                    <li>
                        <a class="pic" href="#"><img src="<%=request.getContextPath()%>/res/images/item/m1.jpg" /></a>

                    </li>
                    <li>
                        <a class="pic" href="#"><img src="<%=request.getContextPath()%>/res/images/item/m2.png"/></a>
                    </li>
                    <li>
                        <a class="pic" href="#"><img src="<%=request.getContextPath()%>/res/images/item/m3.png"/></a>
                    </li>
                    <li>
                        <a class="pic" href="#"><img src="<%=request.getContextPath()%>/res/images/item/m4.png"/></a>
                    </li>
            </ul>
        </div>

        <div class="hd">
            <ul></ul>
        </div>
    </div>
    <!-- banner轮播图配置 -->
    <script type="text/javascript">
        TouchSlide({ 
            slideCell:"#slideBox",
            titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
            mainCell:".bd ul", 
            effect:"leftLoop", 
            autoPage:true,//自动分页
            autoPlay:true //自动播放
        });
    </script>
</div>

<!-- 搜索框 -->
<!--
<div class="seek">
    <input type="text" class="seekInput" placeholder="项目搜索:请输入项目关键字">
    <i class="iconfont icon-sousuo"></i>
</div>
-->
<!-- 首页顶部导航栏 -->

<nav class="headerNav">
    <ul class="navBar">
        <li class="navList"><a href="javascript:void (0)" style="color: red;">热销</a></li>
        <li class="navList"><a href="javascript:void (0)">面部</a></li>
        <li class="navList"><a href="javascript:void (0)">身体</a></li>
        <li class="navList"><a href="javascript:void (0)">经络</a></li>
    </ul>
</nav>
<!-- --------1---------- -->
<!-- 主要项目
<div class="mainLine">
    <p class="title">今日推荐</p>
</div>

<div class="main">
    <div class="mainList"><img src="images/1b.jpg" alt=""></div>
    <div class="mainList"><img src="images/2b.jpg" alt=""></div>
    <div class="mainList"><img src="images/3b.jpg" alt=""></div>
    <div class="mainList"><img src="images/4b.jpg" alt=""></div>
</div>

&lt;!&ndash; &#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;2&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45; &ndash;&gt;
<div class="mainLine">
    <p class="title">热销项目</p>
</div>-->

<div class="items">
    <!-- 第一个项目 -->
    <div style="display: block" class="option">
       <!--  
        <div class="itemList">
            <a href="javascript:void (0)" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】1</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        -->
    </div>


    <!-- 第二个项目 -->
    <div class="option">
        <div class="itemList">
            <a href="javascript:void (0)" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】2</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <!-- 第三个项目 -->
    <div class="option">
        <div class="itemList">
            <a href="javascript:void (0)" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】3</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <!-- 第四个项目 -->
    <div class="option">
        <div class="itemList">
            <a href="javascript:void (0)" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】4</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】4</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="itemList">
            <a href="" title="第一个项目名字">
                <div class="aItem">
                    <div class="itemImg">
                        <img src="<%=request.getContextPath()%>/res/images/item/c3.jpg" alt="此项目的名字"/>
                    </div>
                    <div class="itemDetails">
                        <h3 class="name">【钻石微整形面膜】</h3>
                        <p class="itemEffects">古朴汗灸仪通络通过电磁作用促进血液循环</p>
                        <p class="price">
                            <i>￥</i>
                            169/
                            <span>88次</span>
                            <b class="shell">已订购:
                                <span>300</span>
                            </b>
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<footer id="id">
    <a href=""><p><i class="iconfontHome icon-home" style=""></i>　<!--　←这里有个空格不能删除，占位用　--></p></a>
    <a href=""><p>分类</p></a>
    <a href=""><p>我的订单</p></a>
    <a href="<%=request.getContextPath()%>/home/user/userRegist?openId=${openId}&&format=html"><p>个人中心</p></a>
</footer>
<div class="footerBlock"></div>
<script>
    var openId="${openId}";
    var path="<%=request.getContextPath()%>";
/*    // 绑定footer的touchstart事件
    var obj= {
        dom :document.getElementById('id'),
        fn: function (ev){
                if(ev.targetTouches.length == 1){
                    ev.preventDefault();
                    var touch = event.targetTouches[0];
                    alert(touch.pageX + '----' + touch.pageY);
                }
            },
        addEvent:function (obj, event, fn){
                    if(obj.attachEvent){
                        obj.attachEvent('on'+ event);
                    }
                    else{
                        obj.addEventListener(event,fn,false);
                    }
                }

    };
    obj.addEvent(obj.dom,'touchstart',obj.fn);*/
</script>
</body>
</html>