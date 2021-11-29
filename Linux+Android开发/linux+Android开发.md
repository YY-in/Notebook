# Samba

## 1. 什么是Samba服务器

samba是一种linux和windows之间进行文件共享的协议。安装该协议后，可以理解为在linux是插在windows上的一个U盘。

### 2. 为什么要使用Samba服务器

- 痛点1：在使用经典的FTP服务器时，你如果要修改服务器上的文件，你必须先下载下来，然后在本地机上进行修改后，然后上传到服务器。为了解决这个痛点（让档案在两部主机之间直接修改），在unix like系统中采用的是NFS协议，只要在客户端将 Server 所提供分享的目录挂载进来， 那么在客户端的机器上面就可以直接取用 Server 上的档案资料，在嵌入式开发中经常使用这个协议进行调试。在windows系统中，使用的『网上邻居』所使用的文件系统则称为 Common Internet File System, CIFS。但是怎么让unix like和window进行文件共享呢？
- 痛点2：我的源代码是放在linux下的，编译也需要在linux下完成，但是呢，我的代码编译器，如sourceinsight是在windows下的（linux貌似没有sourceinsight相应的版本），所以我需要在windows上能够修改linux下的源代码，然后在linux进行编译。

### 3. 如何安装Samba服务器

- 1). sudo apt-get install samba安装
- 2). 修改samba配置文件/etc/samba/smb.conf,在最后面加上一组设置即可，如下（可直接拷贝，如果不行请将注释去掉）

```text
[SambaShare]  #这个是后续再windows上共享的文件夹
        comment = ubuntu_samba_share
        path = /home/lion/SambaShare   #这个表示你linux共享的路径
        writable = yes #可读可写
        browseable = yes #可浏览
```

- 3). 设置登录密码 sudo smbpasswd -a USER 为什么samba需要设置自己进行密码管理呢？上面这个USER是已经在linux上存在的用户了，也就是说samba只对存在的用户进行密码管理，因为如果我直接使用用户的登录密码作为samba服务的密码的话，那么就可以直接那这个用户密码去登录linux，可以对其他服务或者文件进行操作，这个是不合理的，我们只想授权samba服务
- 4). 创建共享目录mkdir /home/lion/SambaShare
- 5). 激活samba服务

```text
/etc/init.d/smbd restart
/etc/init.d/nmbd restart
```

### 4. 如何使用Samba服务器

打开windows文件管理器，输入\ip地址或主机名\SambaShare

# NFS

NFS 文件共享的方式极大的方便了嵌入式软件开发，在嵌入式开发板设备存储资源有限的条件下，极 大扩展了对存储容量要求大的软件程序。使用 NFS 共享即将宿主机 Ubuntu 系统内的文件目录共享，指定特 定 IP 地址的机器(一般为开发板设备)访问该文件夹  安装 NFS 服务器端及客户端：

 #sudo apt-get install nfs-kernel-server nfs-common   配置挂载目录和权限：

 #sudo gedit /etc/exports 在 exports 

文件末尾添加若干目录项，我的配置如下：

 /nfsroot *(rw,sync,no_root_squash) 

允许所有用户访问共享目录根据自已的 IP 地址进行相应的修改  在根目录下建立 nfs 服务的共享目录 

#sudo mkdir /nfsroot #sudo chmod 777 /nfsroot  

重新启动 NFS 服务：

 #sudo /etc/init.d/nfs-kernel-server restart 

 测试,假设主机 Linux 的 IP 地址为：192.168.12.158，

 #sudo mount -o nolock 192.168.12.158:/nfsroot /mnt/

  比较主机/mnt 目录和主机的共享目录 /nfsroot

# 交叉编译器



## **(一)交叉编译器简介**

在一种计算机环境中运行的编译程序，能编译出在另外一种环境下运行的代码，这个编译过程就叫交叉编译.简单地说，就是在一个平台上生成另一个平台上的可执行代码.

##  **(二)体系结构与操作系统**

(1)常见的体系结构有ARM结构、x86结构等.

(2)常见的操作系统有linux,windows等.

(3)同一个体系结构可以运行不同操作系统，如x86上可以运行Linux、Windows等，在ARM上可以运行Linux、WinCE.

(4)同一个操作系统可以在不同的体系结构上运行，比如Linux可以运行在x86上，也可以运行在ARM上.

(5)同样的程序不可能运行在多个平台上，比如Windows下应用程序不能在Linux下运行.如果一个应用程序想在另一个平台上运行，必须使用针对该平台的编译器，来重新编译该应用程序的二进制代码.比如在Linux系统下运行Windows平台的QQ软件，必须按照以下几个步骤:
1.QQ程序源代码
2.使用Linux下的编译器来编译QQ软件的源代码
这样编译出来的可执行程序就可以在Linux下运行了.所以，如何使ARM来运行用户的应用程序呢，就需要用到针对ARM的编译器来编译程序.

## **(三)使用交叉编译器的原因**

ARM上可以运行操作系统，所以用户完全可以将ARM当做计算机来使用，理论上也可以在ARM上使用本地的编译器来编译程序.但是，编译器在编译程序时，会产生大量的中间文件，这会占用很大的内存和磁盘空间，且对CPU处理速度要求较高，比如S3C2440A内存、磁盘空间只有几十到100多兆，CPU只有400-500MHz，完全达不到编译程序的要求.所以，在进行ARM-linux嵌入式开发时必须在PC机(x86结构)上编译出能够运行在ARM上的程序，然后再将程序下载到ARM中来运行.这就用到了交叉编译器.

要进行交叉编译，用户需要在主机平台上安装对应的交叉编译工具链(cross compilation tool chain)，然后用这个交叉编译工具链编译用户的源代码，最终生成可在目标平台上运行的代码.交叉编译工具链可以从网上下载，也可以自己制作.但编译器不是万能的，受版本限制，编译某些程序时会报错.常见的交叉编译工具链有:

(1)Cross -2.95.3 tar: 该版本较早，除了编译vivi外一般不使用.

(2)arm920t-eabi.tgz: 4.1.2版本的编译器，支持eabi，可以编译TX2440A开发板上的所有程序.

(3)arm-linux-gcc: 4.3.2版本的编译器，支持eabi，是最常见的交叉工具链.

Attention!!!

什么是EABI
EABI，Embeded application binary interface,即嵌入式应用二进制接口，是描述可连接目标代码、库目标代码、可执行文件影像、如何连接、执行和调试以及目标代码生成过程，和c, c++语言接口的规范，是编译连接工具的基础规范，也是研究它们工作原理的基础.简而言之，EABI就是一种编译规范，交叉编译器在编译时，对于浮点运算会使用硬浮点运算，而对于没有硬浮点运算的处理器，比如S3C2440，会使用软浮点，但这样会在速度上受到很大的限制，而EABI则对浮点运算进行了优化，提高了浮点运算的性能，节省了编译时间.


## **(四)安装交叉工具链arm-linux-gcc 4.3.2**

安装交叉编译器arm-linux-gcc就是在主机平台(pc机的Linux操作系统)上安装对应的交叉编译工具链，换句话说，是将交叉编译器arm-linux-gcc 4.3.2在Linux操作系统下安装.安装步骤:

(1)启动Samba服务器，打开共享目录/home/lishuai，将压缩文件arm-linux-gcc-4.3.2.tgz复制到/home/lishuai下.

(2)解压软件包arm-linux-gcc-4.3.2.tgz.

[root@localhost lishuai]#tar xzvf arm-linux-gcc4.3.2.tgz

1.目录4.3.2就是该交叉编译器的目录.从arm-linux-gcc-4.3.2.tgz解压信息来看，该软件包需要解压在usr/local/arm下，而实际却解压到了共享目录/home/lishuai下

2.进入目录usr/local/内，并没有找到arm文件夹，所以需要新建一arm文件夹，再将目录4.3.2移动到新建目录usr/local/arm下.其中，4.3.2/bin就是arm-linux-gcc的可执行文件.
[root@localhost local]#mv /home/lishuai/usr/local/arm/4.3.2 ./

3.进入目录/usr/local/arm/4.3.2/bin，可以看到不同类型的编译器.但在ARM下经常用到是arm-linux-gcc.其实它也是一个gcc编译器，与gcc使用方法一致，不过该编译器是针对arm体系结构、Linux操作系统的编译器.利用该编译器就可以编译出运行在ARM上的Linux操作系统下的应用程序.

4.进入目录/usr/local/arm/4.3.2/arm-none-linux-gnueabi.其中，lib目录下存放的是库文件，用户编写的应用程序在运行时就依赖于这些库文件.

5.此时还不能编译源码，系统一般会提示找不到命令arm-linux-gcc.这是环境变量在作祟.所以必须修改环境变量PATH.
[root@localhost lishuai]#vi /etc/profile

在"export PATH USER LOGNAME MAIL HOSTNAME HISTSIZE INPUTRC"这一行的下面添加环境变量,
输入:export PATH=/usr/local/arm/4.3.2/bin:$PATH
指定变量PATH为交叉编译器的路径，目的是告诉操作系统可以到目录/usr/local/arm/4.3.2/bin下查找可执行文件
6.[root@localhost lishuai#:source /etc/profile

//使已修改的配置文件/etc/profile生效

7.查看arm-linux-gcc编译器的版本

[root@localhost lishuai]#arm-linux-gcc -v

#**(五)arm-linu-gcc应用实例**

实例:如何使用交叉编译器编译源码包boa-0.94.13.tar.tar
\1. 启动SMB服务器，将源码包放在共享文件夹/home/lishuai下
\2. 输入命令: tar xzvf boa-0.94.13.tar.tar

//解压该源码包

//一般的源码包内有Makefile文件，执行make就可以编译，但该源码包内没有，此时执行make是无效的

//仍然没有Makefile，但找到了configure文件，通过执行configure文件可以生成Makefile
[root@localhost lishuai]# ./configure

//运行configure文件，生成了Makefile文件
//由于要编译出在ARM平台上的程序，就需要使用交叉编译器.在Makefile文件内的绿色大写字母都是Makefile变量，可以看到变量CFLAGS = -g -o2 -pipe -Wall -l，该变量是设置编译选项；变量CC = gcc，该变量是设置需要使用的编译器.由于要使用交叉编译器arm-linux-gcc，所以该变量应设置为CC = arm-linux-gcc，CPP = arm-linux-gcc -E，保存并退出.
[root@localhost lishuai]#make

//执行make进行编译
//生成名为boa的可执行程序，该程序可下载到ARM内来执行

其实，这个过程也叫做移植.移植就是将一个源码包经过修改、配置、交叉编译，然后下载到一个平台上运行.比如经常移植的有Bootloader、内核、QT等.****