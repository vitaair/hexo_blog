---
title: JS中实现页面跳转和刷新方法总结
date: 2020-04-13 02:14:46
tags: 前端
categories: 前端
---
# 

```
转载自：https://juejin.im/post/5d6520796fb9a06ad5472d96
```

window.location(.href)="URL"

其实 `.href` 可以省略

`window.location` 和 `window.location.href` 实现的效果是一样的

例如：

```
window.location = "http://www.baidu.com"
window.location.href = "http://www.baidu.com"

```

上面两种方法都可以从当前页面跳转到目标页面
不同之处在于 `window.location` 返回的是对象，如果没有`.href`，它的默认参数就是`href`

## winodw.location.assign("URL")

这个方法和上面的方法差不多
用法：

```
winodw.location.assign("http://www.baidu.com")

```

## window.location.replace("URL")

如果用`window.location.replace("http://www.baidu.com")` 实现跳转页面, 它和上面方法的区别在于它**跳转后不会保存跳出页面的信息.**

所以如果使用 `history` 历史返回按钮是无效的

它的效果类似于在网页上点击右键, 在新窗口打开或新标签页打开.
而 `window.location.href` 实现的效果是在页面上点击目标链接, 然后可以点击历史返回按钮, 返回到之前页面。

## 历史页跳转

下面的两种方法都可以实现返回历史页，相当于点了页面左上角的返回按钮

```
window.history.back();
window.history.go(-1);

```

`back`和`go`里面都可以放数值

例如：里面放上 `-1` 意思就是返回上一级，里面放上 `-2` 就是返回上上级，以此类推
而且里面还可以放上指定的路由路径，比如 `window.history.go('../routes/admin/');` 这样可以跳转到指定的路由模块

## meta refresh

如果用户浏览器禁用了`javascript`, 那么可以用`meta refresh`来实现自动跳转:果要实现 JS 自动跳转，可以加个定时器：

```
<noscript>
	<meta http-equiv="refresh" content="0;URL=http://www.baidu.com/">
</noscript>

```

如果要实现 JS 自动跳转，可以加个定时器：

```
setTimeout(function(){ ... }, 1000);

```

## 重新加载本页

如果你的代码逻辑执行完了，想要重新加载页面的话，可以用这两种方法：

```
window.location.reload()
window.location.replace()

```

这两种方法都可以重新加载本页，但是`replace()`可以导向另外一个`URL`
例如：`window.location.replace("http://www.baidu.com")`

## window.navigate('URL')

`window.navigate('URL')` 这个方法是只针对`IE`的，不适用于火狐等其他浏览器，在HTML DOM Window Object中，根本没有列出`window.navigate`这个方法，所以这个方法尽量少用，遗忘最好。

## self、parent、this、top

```
top.location.href=”url”         在顶层页面打开url（跳出框架）  
self.location.href=”url”        仅在本页面打开url地址  
parent.location.href=”url”      在父窗口打开Url地址  
this.location.href=”url”        用法和self的用法一致

```

`if (top.location == self.location)` 判断当前`location`是否为顶层 来禁止`frame`引用，如果页面当中有自定义的`frame`的话，也可以将`parent self top`换为自定义`frame`的名称 ，效果就是在自定义`frame`窗口打开`url`。

示例：

```
if(top != self){
	top.location.href = location.href;
}	//禁止frame引用

```

以下是从网上找到的一个例子，不是很直观， 你可以加上上面那三行代码， 可以先去掉， 再加上， 看一下效果，应该就清楚了

top.html代码

```
<script language=javascript>
    function rs(){
        if(top !== self){
            top.location.href = location.href;
        }
        parent.left.location.href="top.htm" ;
        parent.bot.location.href="top.htm";
    }
< /script>
< input type=button name=name value="ksdj" onclick=rs();>

```

test.html代码

```
<FRAMESET COLS="150,*">
	< FRAME SRC="left.htm" name=left>
	< FRAMESET ROWS="150,*">
		 < FRAME SRC="top.htm" name=top>
		 < FRAME SRC="bot.htm" name=bot>
	< /FRAMESET>
< /FRAMESET>

```

尝试一下,可能是这样的效果!

`top`表示主窗口，`location`表示当前窗口，如果你的文件只有一个框架，没有`iframe`和`frame`，那么是完全一致的，没有区别。

`top.location`是在顶层`frame`中打开新页
`window.location`是在当前`frame`中打开新页
`parent.location`在当前窗口的父窗口打开Url地址

## JS页面跳转和刷新的常用方式

### 页面跳转

```
window.location.href="index.php";  
window.history.back(-1);//类似于按钮，参数是负几，就后退几次。  
window.navigate("index.jsp"); //navigate对象包含有关浏览器的信息，也可以作为页面跳转，后面直接加要跳转的地方。  

self.location.href=index.htm;  
//self指代当前窗口对象,属于window最上层的对象;  
//location.href 指的是某window对象的URL地址.  
//self.location.href指当前窗口的URL地址,去掉self默认为当前窗口的URL地址.  

top.location=index.php;  
//top 属性返回最顶层的先辈窗口。  
//该属性返回队一个顶级窗口的只读引用。  
//如果窗口本身就是一个顶级窗口，top 属性存放对窗口自身的引用。  
//如果窗口是一个框架，那么 top 属性引用包含框架的顶层窗口。

location.replace(document.referrer);  
document.referrer   
history.go(-1);//不刷新页面  
history.back();//不刷新页面  

```

### Javascript页面刷新

```
1    history.go(0)   
2    location.reload()   
3    location=location   
4    location.assign(location)   
5    document.execCommand('Refresh')   
6    window.navigate(location)   
7    location.replace(location)   
8    document.URL=location.href 

```

### 自动刷新

> 页面自动刷新：把如下代码加入`<head>`区域中
> `<meta http-equiv="refresh" content="2">`
> 其中2指每隔2秒刷新一次页面.

> 页面自动跳转：把如下代码加入`<head>`区域中
> `<meta http-equiv="refresh" content="2;url=http://www.baidu.com">`
> 其中2指隔2秒后跳转到`http://www.baidu.com`页面

> JS实现页面自动刷新

```
<script language="JavaScript">  
    setTimeout('window.location.reload()',1000) //指定1秒刷新一次  
</script>  

JS刷新框架的脚本语句

//如何刷新包含该框架的页面用   
[javascript] view plain copy print?
<script language=JavaScript>  
   parent.location.reload();  
</script>    

//子窗口刷新父窗口
[javascript] view plain copy print?
<script language=JavaScript>  
    self.opener.location.reload();  
</script>  
(或<a href="javascript:opener.location.reload()">刷新</a>   )  

//如何刷新另一个框架的页面用   
[javascript] view plain copy print?
<script language=JavaScript>  
   parent.另一FrameID.location.reload();  
</script>  

如果想关闭窗口时刷新或者想开窗时刷新的话，在<body>中调用以下语句即可。

```

### jquery方法

```javascript
$(location).attr('href', 'http://www.jb51.net');

$(window).attr('location','http://www.jb51.net');

$(location).prop('href', 'http://www.jb51.net')

```

