---
title: fcitx5在vscode中的BUG
reward: true
copyright: true
date: 2021-01-25 01:35:54
categories:
- Linux
tags:
- fcitx5
- vscode
keywords: 
- fcitx5
- vscode

---

## 关于fcitx5在vscode命令行中输入重复的问题  
### 问题发现
- 最近fcitx4版本的输入法用腻了，听说fcitx5不错，于是尝尝鲜，结果bug吸引体质又发挥作用了，在vscode的命令行里打字的时候就出现bug了（不要问我为什么要在终端里敲中文= =），bug效果如下：  
<!--more-->
![bug图1](https://blog-1257162717.cos.ap-shanghai.myqcloud.com/fcitx5%E5%9C%A8vscode%E4%B8%AD%E7%9A%84BUG/1.png)  
![bug图2](https://blog-1257162717.cos.ap-shanghai.myqcloud.com/fcitx5%E5%9C%A8vscode%E4%B8%AD%E7%9A%84BUG/2.png)  
- 简单来说就是打出来的字实际上是上一次输入的最后两个字  
- 经过排除之后，是 `fcitx5-chinese-addons` 这个包里面的输入法引起的问题，至于原因本菜鸡就不知道了  

### 解决方案  
- 很简单，不使用 `fcitx5-chinese-addons` ，改用 `fcitx5-rime`，问题解决
![解决图1](https://blog-1257162717.cos.ap-shanghai.myqcloud.com/fcitx5%E5%9C%A8vscode%E4%B8%AD%E7%9A%84BUG/3.png)
- `fcitx5-rime` 默认设置是繁体，使用 `F4` 可以进行切换，效果如下：  
![解决图2](https://blog-1257162717.cos.ap-shanghai.myqcloud.com/fcitx5%E5%9C%A8vscode%E4%B8%AD%E7%9A%84BUG/4.png)