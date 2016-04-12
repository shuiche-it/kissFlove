var headerBack = function (a) {
    a = a ||{};
    var obj = {
        backUrl: a.backUrl || window.history.go(-1), // 返回按钮要跳转的链接
        leftTxt : a.leftTxt || '返回', // 导航栏左侧的文字
        rightTxt : a.rightTxt || null, // 导航栏右侧的文字
        centerTxt : a.centerTxt || null, //导航栏中间的文字
        color: a.color || '#000000',  // 字体颜色
        backgroundColor : a.backgroundColor || 'rgba(0,0,0,0)' // 必须用rgba写法写
    };
    // 创建html样式层
    var wrap = function(){
        // 创建标签
        var header = document.createElement('header');
        header.id = 'zzx-header';
        var spanLeft = document.createElement('span');
        spanLeft.id = 'zzx-leftSpan';
        var spanCenter = document.createElement('span');
        spanCenter.id = 'zzx-centerSpan';
        var spanRight = document.createElement('span');
        spanRight.id = 'zzx-rightSpan';

        //开始添加层级布局
        spanLeft.innerHTML = obj.leftTxt;
        header.appendChild(spanLeft);
        if(obj.centerTxt){
            spanCenter.innerHTML = obj.centerTxt;
            header.appendChild(spanCenter);
        }
        if(obj.rightTxt){
            spanRight.innerHTML = obj.rightTxt;
            header.appendChild(spanRight);
        }
        return header;
    };

    // 把创建好的样式添加到页面
    var body = document.querySelector('body');
    body.appendChild(wrap());
    // 设置添加dom的样式
    (function setStyle (){
        var oHeader = document.getElementById('zzx-header');
        oHeader.style.color = obj.color;
        oHeader.style.backgroundColor = obj.backgroundColor;
    })();

    // 添加返回按钮点击事件
    (function backClick (){
        var oLeftSpan = document.getElementById('zzx-leftSpan');
        oLeftSpan.addEventListener('touchstart', function () {
            console.log('aaa');
            window.location.href = obj.backUrl;
        })
    })();
};
/* 弹出提示框，替代alert */
var getHtml = (function () {
    // 创建html样式
    var wrap = function () {
        var bodyDiv = document.createElement('div');
        bodyDiv.id = 'zzx-wrap-div';
        var div = document.createElement('div');
        div.id='public-layer';
        div.className = 'zzx-public-layer';
        bodyDiv.appendChild(div);
        return bodyDiv
    };
    return wrap()
})();
var getHtmlAdd = (function () {
    // 创建html样式
    var wrap = function () {
        var bodyDiv = document.createElement('div');
        bodyDiv.id = 'zzx-wrap-div2';
        var div = document.createElement('div');
        div.id='public-layer2';
        div.className = 'zzx-public-layer';
        var p = document.createElement('p');
        p.id = 'layer-text';
        var img = new Image();
        img.className = 'loding';
        img.src = 'loding.gif';
        div.appendChild(img);
        div.appendChild(p);
        bodyDiv.appendChild(div);
        return bodyDiv
    };
    return wrap()
})();
var display = 'open'; // 不为close时开启，为close时关闭
var selfAlert = function (str){
    var layer = null;
    var layerWarp = null;
    var body = null;
    var timer = null;
    str = str || {};
    var obj = {
        alert : str.alert || '错误的操作',
        color : str.color || '#000',
        backgroundColor : str.backgroundColor || '#fff',
        choose:str.choose || 1,
        key:true
    };
    if(obj.choose == 1){
        if(obj.key){
            body = document.querySelector('body');
            body.appendChild(getHtml); // 把创建出来的dom插入到页面中
            obj.key = false;
        }
        layerWarp = document.querySelector('#zzx-wrap-div');
        layer = document.querySelector('#public-layer');
        layer.innerHTML = obj.alert;
        // 设置弹出层的样式
        layer.style.backgroundColor = str.backgroundColor;
        layer.style.color = str.color;

        layerWarp.style.display = 'block';
        layerWarp.style.opacity = '1';
        setTimeout(function () {
            layerWarp.style.opacity = '0';
        },1000);
        setTimeout(function () {
            layerWarp.style.display = 'none';

        },1600);
    }
    else {
        if(obj.key){
            body = document.querySelector('body');
            body.appendChild(getHtmlAdd); // 把创建出来的dom插入到页面中
            obj.key = false;
        }
        layerWarp = document.querySelector('#zzx-wrap-div2');
        layer = document.querySelector('#public-layer2');
        var layerP = document.getElementById('layer-text');
        layerP.innerHTML = obj.alert;
        // 设置弹出层的样式
        layer.style.backgroundColor = str.backgroundColor;
        layer.style.color = str.color;

        layerWarp.style.display = 'block';
        layerWarp.style.opacity = '1';
        clearInterval(timer);
        timer = setInterval(function () {
            // 判断什么时候停止
            if(display == 'close'){
                layerWarp.style.opacity = '0';
                setTimeout(function () {
                    layerWarp.style.display = 'none';
                    clearInterval(timer);
                },600);
            }
        },300)
    }
};
/*
*
* footer add*/
function addFooterNav(a){
    a = a || {};
    var href = {
        url1: a.url1 || 'javascript:;',
        url2: a.url2 || 'javascript:;',
        url3: a.url3 || 'javascript:;',
        url4: a.url4 || 'javascript:;'
    };
    var footer = document.createElement('footer');
    var str = '<a href="'+ href.url1 +'"><p><i class="iconfontHome icon-home"></i>&nbsp;</p>' +
        '<a href="'+ href.url2 +'"><p>预约服务</p></a>' +
        '<a href="'+ href.url3 +'"><p>服务评价</p></a>' +
        '<a href="'+ href.url4 +'"><p>个人中心</p></a>';
    footer.innerHTML = str;
    var footerBlock = document.createElement('div');
    footerBlock.className = 'footerBlock';
    var body = document.getElementsByTagName('body')[0];
    body.appendChild(footer);
    body.appendChild(footerBlock);
}
