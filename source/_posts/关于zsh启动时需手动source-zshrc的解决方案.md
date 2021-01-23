---
title: 关于zsh启动时需手动source ~/.zshrc的解决方案
date: 2020-05-06 19:53:46
categories:
- Linux
tags: Linux
copyright: true
---
## 前置知识：/etc/zsh/zprofile
这是一个全局的配置文件，在用户登录的时候加载。一般是用来在登录的时候执行一些命令。
## 解决方案

```shell
sudo gedit ~/.zprofile
```

添加脚本

```shell
source ~/.zshrc
```
# 大功告成
## 当然，类似问题也可以这样解决

[参考博客地址](https://blog.csdn.net/Faiz5z/article/details/80986460)

