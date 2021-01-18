---
title: Nginx搭建简单文件服务器
reward: true
copyright: true
date: 2021-01-11 17:31:43
categories:
- Nginx
tags:
- Nginx
- Linux
---


### 1. Nginx安装
  * Ubuntu: ```sudo apt-get install nginx```
  * Fedora、Centos: ```sudo yum install nginx```
  * Manjaro: ```sudo pacman -S nginx```
  
### 2. 配置文件
  * 查找Nginx配置文件: ```sudo find / -name nginx.conf```
  * 一般存放在 /etc/nginx/nginx.conf

### 3. 修改配置文件
  * 在 http 节点中添加以下代码
    ```
      autoindex on;             #开启索引功能
      autoindex_exact_size off; # 关闭计算文件确切大小（单位bytes），只显示大概大小（单位kb、mb、gb）
      autoindex_localtime on;   # 显示本机时间而非 GMT 时间
      charset utf-8; # 避免中文乱码

      server {
        listen       9999; #监听端口号
        server_name  localhost;
        #root         /usr/share/nginx/html;
        root         /home/evil/share; # 共享的文件目录
        error_log /home/evil/share/log/error.log ; # 报错的文件目录

        location / {
        }

        error_page 404 /404.html;
          location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
          location = /50x.html {
        }
      }
    ```
    保存文件并重启Nginx

### 4. 效果图
  * ![](/images/Nginx搭建简单文件服务器/img1.webp)

### 5. 坑
  * 403 Forbidden 
  
    403 forbidden错误是禁止读取访问。也就是说服务器理解了请求，但是不允许访问

  * 解决方案：
    
    > ```cd``` 进入文件夹，确认文件夹存在，文件夹存在即为访问权限问题

    > 修改文件夹访问权限 ```chmod 755 文件夹路径```

    > 重启 nginx 后还是 ```403``` 

    > 查看日志文件内容，显示：
    
    > ```2021/01/11 18:07:11 [error] 98226#98226: *1 "/home/evil/share/index.html" is forbidden (13: Permission denied), client: 127.0.0.1, server: localhost, request: "GET / HTTP/1.1", host: "localhost:9999"```

    > 是 nginx 运行用户的问题，```ps -aux | grep nginx``` 查看 nginx worker 用户

    > ![](/images/Nginx搭建简单文件服务器/img2.webp)
    > 运行用户为 http ，修改 nginx 运行用户（如果nginx配置的用户和静态文件的用户不匹配，那怕权限是777也会出现权限问题）

    > 在 nginx.conf 开头加入 ```user 用户名 用户组; # 这里的用户名和组就是文件夹的```

    # Over




