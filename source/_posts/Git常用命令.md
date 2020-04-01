---
title: Git常用命令
date: 2020-04-01 02:13:55
tags: terminal
categories: terminal
---
### 本地git获得github的提交权限



```bash
# 设置用户名和邮箱
git config --global user.name 'your_name'
git config --global user.email 'your_email'
# 生成SSH密匙,之后按三次回车
ssh-keygen -t rsa -C 'your_email'
# 之后再/c/user/用户名/.ssh文件下，找到id_rsa.pub文件，打开复制
```

### 添加公钥到github

```bash
添加生成的id_rsa.pub文件中的公钥到github的**setting / SSH AND GPG KEY / SSH keys 
```

### 测试是否关联成功

```bash
git bash输入ssh git@github.com, 如果提示successfully authenticated则成功
```

### 创建本地仓库

```bash
# cd到项目目录,初始化git仓库
git init
# 把所有项目文件添加到提交暂存区
git add .
# 把暂存区中的内容提交到仓库
git commit -m 'commit first'
```

### 创建远程仓库

```bash
# 登录github，创建仓库，之后复制仓库地址
git@github.com:vitaair/hexo_blog.git
```

### 同步本地仓库到远程仓库

```bash
# 关联本地仓库和远程仓库
git remote add origin git@github.com:vitaair/hexo_blog.git
# 把本地仓库内容push到远程仓库的master分支 
git push -u origin master
```

> `push`的`-u`参数是设置本地仓库默认的`upstream`,这里就是把本地仓库同远程仓库的master分支进行关联，之后在这个仓库pull时不带参数也默认从master分支拉取。

### 删除.idea 文件夹

```bash
git rm -r --cached .idea  #--cached不会把本地的.idea删除
git commit -m 'delete .idea dir'
git push -u origin mastergit remote add origin git@github.com:vitaair/hexo_blog.git
# 把本地仓库内容push到远程仓库的master分支 
git push -u origin master
```

### 删除.iml文件(先手动删除iml文件,再操作如下指令即可)

```bash
git status                       # 查看当前状态，确认是否已经删除了iml文件
git pull                         # 不是必要步骤，只要能保证项目是最新的即可
git add .                        # add后面有一个空格然后是 . 号，添加改变的文件
git commit -m 'delete iml file'  # 提交到本地仓库
git push                         # 提交到远程仓库
```