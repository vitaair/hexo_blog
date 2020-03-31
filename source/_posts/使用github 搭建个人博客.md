---
title: 使用github搭建个人博客
date: 2020-03-31 18:34:53
tags: blog
categories: blog
---
##### 步骤一：创建一个自己的github账号

##### 步骤二：创建一个自己的项目

```java
注意： 我自己的 github 账号是 vitaair，然后我的github.io的前缀也是vitaair【必须是你的用户名，其它名称无效】
```

所以我的博客地址就是：

```java
vitaair.github.io
```

##### 步骤三：创建好之后，拉取到本地

```
git clone git@github.com:vitaair/vitaair.github.io.git
```

##### 步骤四：然后采用下面的命令进行添加

```java
echo "# vitaair.github.io" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/vitaair/vitaair.github.io.git
git push -u origin master
```

仓库地址：

```java
https://github.com/vitaair/vitaair.github.io
```

然后就可以访问了：

```java
ping vitaair.github.io
```

##### 步骤五：SSH 授权

本地生成 SSH 秘钥

```
ssh-keygen -t rsa -C "vitaair@outlook.com"
```

生成密钥目录

```
私钥：id_rsa
公钥：id_rsa.pub
```

现在用记事本打开 id_rsa.pub，复制文件中的所有内容

```java
ssh-rsa nTZ34Fj3YtEhct8oEHPk3wshYNCsSj4UdeFNcK26QzpWDv+91nx9uZio62vo/4fLI45yEIq50fRn5chLyin463NtimcN8B+N2k= vitaair@outlook.com
```

访问：

```
https://github.com/settings/ssh
```

添加新秘钥

```
Title：自己随便取
Key：  把刚刚复制的都粘贴进来
```

##### 步骤六：采用hexo搭建自己博客

安装cnpm，输入以下命令：

```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

新建一个空白的文件夹，比如hexo_blog, 然后采用命令行窗口进入：

```java
cnpm install -g hexo-cli
```

检查是否安装成功：

```java
hexo -version
```

然后运行初始化命令：

```java
hexo init
```

运行成功会得到如下提示：

```java
INFO  Start blogging with Hexo!
```

运行下面来启动服务：

```java
hexo server
```

在浏览器输入地址，可以看到博客已经生成

```
http://localhost:4000/
```

下载yelee主题：

```java
git clone https://github.com/MOxFIVE/hexo-theme-yelee.git themes/yelee
```

下载好主题文件之后，我们现在要修改目录下的项目配置文件：**_config.yml**，该成对应主题目录名，如下:

```java
theme: yelee
```

更改主题目录名后，需要重新生成主题静态内容：

```java
hexo generate
```

重启 hexo 本地服务

```java
hexo server
```

重新访问

```java
http://localhost:4000/
```

要把本地的静态博客同步到 Github，我们还需要先安装两个跟部署相关的 hexo 插件：

```java
cnpm install hexo -server --save
cnpm install hexo-deployer-git --save
```

在配置文件**_config.yml** 中配置

```yaml
deploy:
  type: git
  repo: git@github.com:vitaair/vitaair.github.io.git
  branch: master

```

先清除掉已经生成的旧文件：

```java
hexo clean
```

再生成一次静态文件

```java
hexo generate
```

重启 hexo 本地服务

```java
hexo server
```

本地没问题之后， 停掉本地预览

```java
Ctrl + C
```

部署到 Github 上,有弹出下面提示框，请输入：yes

```java
hexo deploy
```

访问服务器地址进行检查

```java
http://vitaair.github.io
```