---
title: Idea 插件下载超时解决方法 
date: 2020-04-01 01:11:55
tags: IDE工具
categories: IDE工具
---
找到：

```java
settings->system settings->updata
```

去掉：

```java
Use secure Connetion
或者
Ignored Updates里的ip:192.7.142.36
```

原因：

```java
是使用了https协议下载导致的问题
```

