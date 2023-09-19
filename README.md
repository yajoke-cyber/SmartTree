# 智慧树在线教育系统

使用环境如下
* jdk-8u221-windows-x64.exe<br>
* ideaIU-2019.2.3.exe<br>
* Git-2.23.0-64-bit.exe<br>
* mysql-installer-community-5.7.27.0.msi<br>
* node-v12.10.0-x64.msi<br>
* zTree-zTree_v3-master.zip<br>
* nacos-server-1.2.1.zip<br>
* jdk-8u261-linux-x64.tar.gz<br>

## 源码下载
使用下面的命令将源码从远程仓库拉取到本地，需要本地提前安装好git

```
git clone https://github.com/yajoke-cyber/SmartTree.git
```

## 项目模块说明
* **admin**<br>
控台管理，vue cli项目
* **business**<br>
核心业务模块，spring boot项目
* **doc**<br>
项目相关的文档，包含项目数据库初始化脚本和所有资源文件
* **eureka**<br>
注册中心，spring boot项目
* **file**<br>
文件模块，spring boot项目
* **gateway**<br>
路由模块，spring boot项目
* **generator**<br>
代码生成器
* **server**<br>
公共jar模块，被business, file, system依赖
* **system**<br>
系统模块，spring boot项目
* **web**<br>
网站模块，vue cli项目


## 项目初始化
* 需要本地安装好idea, nodejs，jdk1.8, mysql5.7, navicat（数据库可视化工具）
* 将下载好的源码，用idea打开
* 刷新maven依赖
* 安装vue cli
```
npm install -g @vue/cli
```
* 下载node模块
```
初始化web模块
cd web
npm install

初始化admin模块
cd admin
npm install
```
* 新建数据库course，并设置密码为密码123456
* 数据库初始脚本在/doc/db/all.sql

## 项目启动
* 启动注册中心：EurekaApplication
* 启动路由模块：GatewayApplication
* 启动系统模块：SystemApplication
* 启动业务模块：BusinessApplication
* 启动文件模块：FileApplication
* 启动控台管理：admin\package.json
* 启动前端网站：web\package.json

## 页面访问
* 控台地址: http://localhost:8080/login<br>
初始用户名密码：test/test
* 控台地址: http://localhost:8081<br>
可以自己注册用户，短信验证码从后台日志看，或看sms表
## 线上地址
前台地址：http://1.15.110.96/web/ <br>
账号：18725871531 <br>
密码：a123456 <br>
后台地址：http://1.15.110.96/admin/ <br>
账号：test <br>
密码：123456 <br>

## 资源配置
所有资源都在/doc/db/resource.json<br>
需要在控台上将所有的资源配置进去，并在角色管理中配置权限
权限配置好后，需要重新登录
