---
title: Git常用命令
date: 2020-04-01 02:13:55
tags: terminal
categories: terminal
---
### 本地git获得github的提交权限

设置用户名和邮箱

- `git config --global user.name 'your_name'`
- `git config --global user.email 'your_email'`

生成SSH密匙 `ssh-keygen -t rsa -C 'your_email'`

> 指令执行后会让你确定密钥保存地址和设置密码，这些不用管，全部回车就好

添加生成的id_rsa.pub文件中的公钥（打开复制）到github的**setting / SSH AND GPG KEY / SSH keys** 

最后测试是否关联成功,git bash输入`ssh git@github.com`, 如果提示successfully authenticated则成功

### 创建本地仓库

- cd到项目目录
- `git init` 初始化git仓库
- `git add .` 把所有项目文件添加到提交暂存区
- `git commit -m 'commit first'` 把暂存区中的内容提交到仓库

### 创建远程仓库

> 登录github，创建仓库，之后复制仓库地址，如：git@github.com:vitaair/hexo_blog.git

### 同步本地仓库到远程仓库

-  `git remote add origin git@github.com:[githubUerName]/[resName]` 关联本地仓库和远程仓库

  比如：git remote add origin git@github.com:vitaair/hexo_blog.git

- ```
  git push -u origin master
  ```

   把本地仓库内容push到远程仓库的master分支 

  > `push`的`-u`参数是设置本地仓库默认的`upstream`,这里就是把本地仓库同远程仓库的master分支进行关联，之后你在这个仓库pull时不带参数也默认从master分支拉取

### 常见问题解决

**1.push时报错不能覆盖远程仓库代码**

事实上远程仓库是新建的，里边或许有个README.md，就再没有其他，故直接强制覆盖;`-f`:强制覆盖。

```bash
git push -uf origin master
```

**2.git remote add origin git remote add origin git@github.com:vitaair/hexo_blog.git 时报错remote origin already existsorigin别名已经存在**

删除origin，然后重试。

```bash
git remote rm origin
```