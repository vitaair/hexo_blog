---
title: JS实现页面超时后自动跳转到登陆页面
date: 2020-04-13 02:20:59
tags: 前端
categories: 前端
---
**

```
转载自：https://blog.csdn.net/jfkidear/article/details/48132819
```

js代码如下：

```javascript
<script; language="javascript">;     
var myTime = setTimeout("Timeout()", 60000);     
function resetTime() {     
    clearTimeout(myTime);     
    myTime = setTimeout('Timeout()', 60000);     
}    
  
function Timeout() {     
    alert("您的登录已超时, 请点确定后重新登录!");     
    document.location.href='login.jsp';     
}     
  
document.documentElement.οnkeydοwn=resetTime;    
document.doocumentElement.οnclick=resetTime;    
</script> 
```

http页面测试效果:

```javascript
<html>
<head>
    <meta; http-equiv="Content-Type"; content="text/html; charset=gb2312">
    <title>gotoing, please; waiting; .............................</title>
</head>
<body>
<script; language="JavaScript">
    document.location.href="http://www.bing.com";
    var myTime = setTimeout("Timeout()", 600);
    function resetTime() {
        clearTimeout(myTime);
        var myTime = setTimeout("Timeout",600);
    }
    function Timeout() {
        alert("已超时，准备跳转到备用地址");
        document.location.href="http://www.baidu.com"
    }
    document.documentElement.onkeydown=resetTime();
    document.doocumentElement.οnclick=resetTime;
</script>
</body>
</html>
```

