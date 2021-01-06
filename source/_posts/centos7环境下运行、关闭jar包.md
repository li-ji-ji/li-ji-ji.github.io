---
title: centos7环境下运行、关闭jar包
date: 2020-02-12 21:53:32
tags:
---
 - 启动

	执行  `cd 文件夹路径`  命令进入jar包所在文件夹

	后台运行jar包：执行 `nohup java -jar ***.jar &`   
	
	nohub 表示后台不挂断运行
	如需将日志输出到指定文件，在&前面加上>***.log ，如下：
	(使用>为覆盖源文件，使用 >> 则为续写文件)
	``
	nohup java -jar ***.jar >***.log &
	``

 - 关闭
     - 方法一：
      执行 `ps -ef|grep java` 命令查看当前正在运行的java进程，结果如下，第二列为进程PID
 	
	
	```powershell
	root     20032     1  0 Jan01 ?        00:00:00 sudo nohup java -jar myblog.jar
	root     20033 20032  0 Jan01 ?        00:55:54 java -jar myblog.jar
	root     26038     1  0  2019 ?        00:00:00 sudo nohup java -jar IctExam.jar
	root     26039 26038  0  2019 ?        06:51:08 java -jar IctExam.jar
	root     28443  9171  0 21:47 pts/3    00:00:00 grep --color=auto java
	```
	  - 方法二：
 	   执行pidof java 查看现有jar包进程PID
 	    
	执行 `kill -9 PID` 结束该PID对应的进程
