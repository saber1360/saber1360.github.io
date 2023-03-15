---
title: git学习笔记
date: 2022-06-21 20:24:35
tags: git
categories: note
---

> ### Sammary
>
> 学习git的使用
>
> 先上链接：
>
> git简明上手教程：[git 简明指南 (runoob.com)](https://www.runoob.com/manual/git-guide/)
>
> git全指令手册：[Git - Reference (git-scm.com)](http://git-scm.com/docs)

<!--more-->

### 创建远程仓库

1. 导航到目的文件夹下，then执行

```git
git init
```

正常会出现Initialized empty Git repository in .......

2. 向仓库添加文件后并提交到本地,执行

```git
git add .
git commit -a -m "first commit"
```

3. 在本地仓库添加一个远程仓库，并把本地仓库master分支跟踪到远程分支

   先上gitee或者github等去新建一个仓库，远程仓库地址使用http://git.XXXX.com/XXX/XXX.git/也可以

```
git remote add origin git@github.com:saber1360/JudgeSystem.git
git push origin master
```

查看远程仓库地址

```git
git remote -v
```

修改远程仓库地址

```git
git remote set-url origin http://git.XXXX.com/XXX/XXX.git/
```

### 基本使用

1. 添加文件

```git
git add .
```

2. 提交到本地仓库

```git
git commit -m "注释"
```

3. 上传到远程仓库

   git push <远程主机名> <远程分支名>:<本地分支名>

```git
# 将本地master分支上传到远程
git push origin master
```

4. 分支管理

- 列出分支

```git
git branch
```

- 创建分支

```git
git branch (branchname)
```

- 切换分支

```git
git checkout (branchname)
```

- 合并分支

```git
# 将branchname合并到当前所在分支
git merge (branchname)
```

- 删除分支

```git
git branch -d (branchname)
```

5. 回溯

查看提交记录

```git
# 加上--oneline，查看简洁版本的记录
git log --oneline
```

得到对应版本号后

```git
git reset --hard 版本号
```

