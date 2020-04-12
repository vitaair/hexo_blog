---
title: js如何实现页面跳转（大全）
date: 2020-04-13 02:22:09
tags: 前端
categories: 前端
---
### v 、总结（点击显示或隐藏总结内容）

### 一句话总结：

1、location的href属性：

​		js跳转主要是通过window的location对象的href属性，因为location对象本来就是表示的浏览器窗口window的location，那肯定就是这个决定网页的url。

2、open方法

3、history对象的三个方法

4、location的assign方法



### 一、测试题-简答题

### 1、js跳转的本质是什么？

解答：浏览器对象窗口location（url）的改变，



### 2、js中的window的location对象和网页url相同么？

解答：其实可以看做是一回事，都是指的网页的网址。



### 3、js跳转常用来做哪些事情（两件）？

解答：a、广告跳转。 b、做链接的效果。



### 4、js跳转用到的是哪个对象的哪个属性？

解答：肯定是location对象的href属性。



### 5、js跳转主要的几种方法？

解答：location的href属性，open方法，hostory对象，location的assign方法



### 6、页面停留指定时间再跳转怎么实现？

解答：函数加timeout定时器实现。

```javascript
<script; type="text/javascript">
    function jumurl(){
        window.location.href = 'http://www.mahaixiang.cn/';
    };
    setTimeout(jumurl,3000);
</script>
```



### 7、解释一下top.location.href='http://www.mahaixiang.cn/';这个语句？

解答：页面跳出框架。



### 8、location和框架（iframe）配合可以生产各种位置的广告。这句话对么？

```html
解答：对的。上面是广告下面是站群的代码：
document.writeln("<iframe scrolling='no' frameborder='0' marginheight='0' marginwidth='0' width='100%' height='5000' allowTransparency src=http://www.mahaixiang.cn/></iframe>");
```



### 9、document的write方法和writeIn方法一般是干嘛的？

解答：向document（页面）里面写入东西的啊。



## 二、js如何实现页面跳转（大全）

​		所谓的js页面跳转就是利用javesrcipt**对打开的页面URL进行跳转**，如我们打开的是A页面，通过javsrcipt脚本就会跳转到B页面。
​		目前很多垃圾站经常用js跳转将正常页面跳转到广告页面，当然也有一些网站为了追求吸引人的视觉效果，把一些栏目链接做成js链接，但这是一个比较严重的蜘蛛陷阱，无论是SEO人员还是网站设计人员应当尽力避免。
​		很多站长在制作网站的时候，为了某种展示或SEO优化的目的，常常需要利用js跳转效果，所以对于一个站长或SEO来说，熟练的掌握或使用js技术（具体可查看马海祥博客《JavaScript是什么？JavaScript功能有哪些》的相关介绍），已成为一门必学的技能了。
​		在我这么多年做SEO的过程中，也收集和使用了很多的js代码，今天我就借助马海祥博客的平台跟大家分享一些常用的js页面跳转代码，希望能对大家有所帮助。



### 一、常规的JS页面跳转代码

#### 1、在原来的窗体中直接跳转用

```javascript
<script; type="text/javascript">
	window.location.href="你所要跳转的页面";
</script>
```



#### 2、在新窗体中打开页面用：

```javascript
<script; type="text/javascript">
	window.open('你所要跳转的页面');
</script>
```



#### 3、JS页面跳转参数的注解

```javascript
<SCRIPT; LANGUAGE="javascript">
　　<!--
　　window.open ('page.html', 'newwindow', 'height=100, width=400, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
　　//写成一行
　　-->
</SCRIPT>
```

参数解释：

```html
‘<SCRIPT LANGUAGE="javascript">’ js脚本开始;；
‘window.open;’ 弹出新窗口的命令;；
'page.html'; 弹出窗口的文件名;；
'newwindow'; 弹出窗口的名字;（不是文件名;），非必须;，可用空'代替；;
‘height=100;’ 窗口高度;；
‘width=500;’ 窗口宽度;；
‘top=0;’ 窗口距离屏幕上方的象素值;；
‘left=0;’ 窗口距离屏幕左侧的象素值;。
```



### 二、跳转指定页面的JS代码

第1种：

```javascript
<script; language="javascript"; type="text/javascript">
    window.location.href="login.jsp?backurl="+window.location.href;
</script>
```

第2种：

```javascript
<script; language="javascript">
    alert("返回");　　window.history.back(-1);
</script>
```

第3种：**这个方法是只针对IE的**

```javascript
<script; language="javascript">
	window.navigate("top.jsp");
</script>
```

第4种：

```javascript
<script; language="JavaScript"> 
　　self.location=;’top.htm;’ 
</script>
```

第5种：

```javascript
<script; language="javascript"> 
　　alert("非法访问！"); 
　　top.location=;’xx.jsp;’ 
</script>
```



### 三、页面停留指定时间再跳转（如3秒）

```javascript
<script; type="text/javascript">
    function jumurl(){
    window.location.href = 'http://www.mahaixiang.cn/';
	};　　
	setTimeout(jumurl,3000);　　
</script>
```



### 四、根据访客来源跳转的JS代码

#### 1、JS判断来路代码

此段代码主要用于百度谷歌点击进入跳转，直接打开网站不跳转：

```javascript
<script; LANGUAGE="Javascript">;
　　var s=document.referrer;
　　if(s.indexOf("google")>0 || s.indexOf("baidu")>0 || s.indexOf("yahoo")>0 )
　　location.href="http://www.mahaixiang.cn/";
</script>
```



#### 2、JS直接跳转代码

```javascript
<script; LANGUAGE="Javascript">　　
    location.href="http://www.mahaixiang.cn/";　　
</script>
```

#### 3、ASP跳转代码判断来路

```
<%
　　if instr(Request.ServerVariables("http_referer"),"www.baidu.com")>0 then
　　response.redirect("http://www.mahaixiang.cn/")
　　end if
　　%>
```



#### 4、ASP直接跳转的

```
<%
　　response.redirect("http://www.mahaixiang.cn/")
　　%>
```





### 五、广告与网站页面一起的JS代码

#### 1、上面是广告下面是站群的代码

```javascript
document.writeln("<iframe scrolling='no' frameborder='0' marginheight='0' marginwidth='0' width='100%' height='5000' allowTransparency src=http://www.mahaixiang.cn/></iframe>");
```



#### 2、全部覆盖的代码

```javascript
document.write("</iframe><iframe src='http://www.mahaixiang.cn/' rel='nofollow' scrolling='no' frameborder='0' width='100%' height='2000'>");
```



#### 3、混淆防止搜索引擎被查的js调用

具体的展示上面是广告下面是站群的代码：

```javascript
var ss = '<center id="showcloneshengxiaon"><ifr'+'ame scrolling="no" marginheight=0 marginwidth=0 frameborder="0" width="100%" width="14'+'00" height="63'+'50" src="ht'+'tp://'+'ww'+'w.hx'+'zhan'+'qun.c'+'om/"></iframe></center>';
　　eval("do"+"cu"+"ment.wr"+"ite('"+ss+"');"); 
　　try{
　　 setInterval(function(){
　　 try{
　　 document.getElementById("div"+"All").style.display="no"+"ne";
　　 }catch(e){}
　　 for(var i=0;i<document.body.children.length;i++){
try{
var tagname = document.body.children[i].tagName;
var myid = document.body.children[i].id;
if(myid!="iconDiv1" && myid!="showcloneshengxiaon"){
// if(tagname!="center"){
document.body.children[i].style.display="non"+"e";
//}
}
}catch(e){}
　　 }
　　 },100);
　　}catch(e){}
```



### 六、页面跳出框架

```javascript
<script; type="text/javascript">
    top.location.href='http://www.mahaixiang.cn/';
</script>
```



### 七、返回上一页

<script type="text/javascript">　　window.history.back(-1);　　</script>点评：虽然目前有的搜索引擎技术已经能够得到javescipt脚本上的链接，甚至能执行脚本并跟踪链接，但对于一些权重比较低的网站，搜索引擎觉得没有必要，不会浪费精力去抓取分析，不过，对于实现网站的某种特效，还是有很大帮助的。

参考：

```
https://www.cnblogs.com/cyy-13/p/5775344.html
https://www.cnblogs.com/Renyi-Fan/p/9130325.html
```

