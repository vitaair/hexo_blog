---
title: 使用gitee搭建自个人博客
date: 2020-03-31 18:29:45
tags: blog
categories: blog
---
## gitee pages介绍

​       码云 Pages 是一个免费的静态网页托管服务，我们可以使用 码云 Pages 托管博客、项目官网等静态网页。

## 搭建步骤

### 步骤1、新建仓库

```java
点击右上角图像旁边 + 号，选择“新建仓库”
是否开源：私有
（私有：别人无法查看你创建的私有仓库；公开：所有人都能够查看你创建的仓库并且能够下载源码）
仓库名称：vitaair（即gitee的用户名）
路径：vitaair（即gitee的用户名）
使用readme文件初始化这个仓库，画勾
之后，点”创建“，仓库新建成功
注意：之后在步骤3后会生成响应博客地址 vitaair.gitee.io
```

### 步骤2、在配置文件**_config.yml** 中配置

```yaml
deploy:
  type: git
  repo:
    github: git@github.com:vitaair/vitaair.github.io.git
    gitee: git@gitee.com:vitaair/vitaair.git
  branch: master

```

### 步骤3、hexo更新代码到Gitee

本地执行如下命令：（前提，已经安装好hexo，参考博客使用 github.io 搭建了属于自己的个人博客）

```java
hexo clean && hexo g && hexo d
```

### 步骤4、启动 Gitee Pages 服务

```Java
点击gitee页面右上方 service（服务）-> Gitee Pages页面，
进入后点击左下角 “更新” 按钮
更新成功后，页面中间会出现一行橙色字体 “ 已开启Gitee 服务，网站地址是 http://vitaair.gitee.io ”
```
