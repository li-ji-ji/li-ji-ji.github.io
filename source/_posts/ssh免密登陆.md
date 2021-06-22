---
title: ssh免密登陆
reward: true
copyright: true
date: 2021-06-22 09:42:41
categories:
- Linux
tags:
- Linux
keywords:
- Linux
copyright: true
---

## 1. 在客户端生成公私钥  
  ```bash
  ssh-keygen # 在当前服务器生成公私钥,选项全为默认即可
  cd ~/.ssh  # 进入公私钥存放文件夹
  ls         # 查看所有文件
  ```
  ```id_rsa``` 私钥文件  
  ```id_rsa.pub``` 公钥文件  

## 2. 把公钥上传到服务器
  ```bash
  ssh-copy-id -i ~/.ssh/id_rsa evil@192.168.1.155 # 复制公钥到服务器上
  ```  
  192.168.1.155为服务器地址  
  evil为服务器登陆用户名  
  此时可登陆到服务器确认.ssh目录中是否以写入客户端公钥
  ```bash
  cd ~/.ssh # 进入用户目录下.ssh文件夹
  cat authorized_keys #查看文件中是否已写入客户端公钥
  ```  

## 3. 免密登陆
  ```bash
  ssh evil@192.168.1.155 # 通过ssh免密登陆服务器
  ```
  