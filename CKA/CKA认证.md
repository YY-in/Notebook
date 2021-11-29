[TOC]

# CKA认证

## 第1章 引言

开发架构的演变

1. 单体架构<img src="C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113160422874.png" alt="image-20211113160422874" style="zoom:;" />

2. 面向服务架构(SOA,引入了中间件和消息队列 )

![image-20211113160833371](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113160833371.png)



3.前端—后端架构

![image-20211113161112613](C:\Users\13980\AppData\Roaming\Typora\typora-user-images\image-20211113161112613.png)

4.微服务架构

![image-20211113161503830](C:\Users\13980\AppData\Roaming\Typora\typora-user-images\image-20211113161503830.png)

### 1.1 云原生

​	云原生计算基金会（CNCF）是许多增长最快的开源项目的供应商中立之家。

​	云原生技术使组织能够在现代动态环境（例如共有云、私有云和混合云）中构架和运行可扩展的应用程序。容器、服务网络、微服务、不可变基础设施和声明式API是这种方法的例证。

​	这些技术使松散耦合的系统具有弹性、可管理性和可观性。与强大的自动化相结合，它们使工程师能够以最少的工作量频繁且可预测地进行高影响力的更改。

​	Cloud Native Computing Foundation 旨在通过培育和维护一个由供应商中立的开源项目生态系统来推动这种范式的采用。我们将最先进的模式民主化，使每个人都可以使用这些创新。 

​	

![image-20211113165842511](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113165842511.png)

![image-20211113165919529](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113165919529.png)

### 1.2 Kubernetes简介

​	Kubernetes是一个可移植的、可扩展的开源平台，用于管理容器化的工作负载和服务，可促进声明式配置和自动化。Kubernetes拥有一个庞大且迅速增长的生态系统。Kubernetes的服务、支持和工具泛化可用。

​	Kubernetes是用于自动部署，扩展和管理容器化应用程序的开源系统。

#### 1.2.1 Kubernetes组件

![image-20211113171737225](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113171737225.png)

![image-20211113170959936](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113170959936.png)

API Server（运行在master）暴露端口

6443 加密端口 （暴露给网络）

8080 明文端口 （暴露给master）

30000号 以上NodePort DashBoard 

#### 1.2.2 发布业务的应用

1. 接受外部访问请求（kubectl命令），API Server 完成认证、授权和准入，开始对其他组件的协调

![image-20211113173019616](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113173019616.png)



2. API Server通知Control Manager，并ETCD建立上层控制器，Control Manager利用ETCD记录外部请求需要的Pod

![image-20211113174001535](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113174001535.png)

3. ETCD记录完成后通知API Server，API Server通知Scheduler进行资源调度，Scheduler找到符合条件的Worker节点通知API Server，修改ETCD的Pod状态

![image-20211113174141932](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113174141932.png)

![image-20211113174657813](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113174657813.png)

4. API Server 通知Worker节点的Kubelet发布容器，Kubelet工作通知容器运行池发布我们需要的容器

![image-20211113174949405](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113174949405.png)

![image-20211113175005868](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113175005868.png)

#### 1.2.3 容器运行池的演变

![image-20211113180011944](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113180011944.png)

![image-20211113180023662](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113180023662.png)

![image-20211113180041923](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113180041923.png)

#### 1.2.4 集群的创建工具

![image-20211113180607844](C:\Users\13980\OneDrive - iweii\桌面\笔记\CKA\img\image-20211113180607844.png)

## 第2章 基础配置

 [1、在Ubuntu18.04使用kubeadm部署k8s集群v.1.22（Docker runtime）.pdf](res\1、在Ubuntu18.04使用kubeadm部署k8s集群v.1.22（Docker runtime）.pdf) 

### 2.1 集群初始化

### 2.2 使用kubeadm 安装 kubernetes

### 2.3 Calico CNI 安装

### 2.4 Dashboard 安装

### 2.5 metric-server安装   

Metrics Server 是一个可扩展的、高效的容器资源度量源，用于 Kubernetes 内置的自动伸缩管道。
Metrics Server 从 Kubelets 收集资源指标，并通过 Metrics API 在 Kubernetes apiserver 中公开它们，供 Horizontal Pod Autoscaler 和 Vertical Pod
Autoscaler 使用。kubectl top 还可以访问 Metrics API，从而更容易调试自动伸缩管道。
Metrics Server 并非用于非自动伸缩目的。例如，不要使用它将指标转发到监视解决方案，或者作为监视解决方案指标的来源。
Metrics Server 提供：
● 适用于大多数集群的单一部署。
● 快速自动缩放，每 15 秒收集一次指标。
● 资源效率，集群中的每个节点使用 1m CPU 和 2 MB 内存。
● 可扩展支持多达 5,000 个节点集群  

### 2.6 Nginx ingress controller 安装

### 2.7 Rancher Local Path Provisioner安装

Local Path Provisioner 为 Kubernetes 用户提供了一种利用每个节点中的本地存储的方法。根据用户配置，Local Path Provisioner 将自动在节点
上创建基于 hostPath 类型持久卷。它利用了 Kubernetes Local Persistent Volume feature 引入的特性，但使其成为比 Kubernetes 中内置的本地卷特性更
简单的解决方案  

### 2.8 Krew安装

Krew是kubectl插件的包管理工具。借助Krew，可以轻松地使用kubectl plugin：发现插件、安装和管理插件。使用类似apt、dnf或者brew。

- 对于kubectl用户：krew能帮助用户搜索、安装和管理kubectl插件；
- 对于插件开发者：krew可以帮助你在多种平台上打包和发布插件。





## 第3章 集群的排除\维护\管理

删除token不会影响，已加入的节点状态，token只是一个节点加入集群的凭证

### 3.1 增加节点node---忘记了token信息和CA证书hash值

1. 后续需要添加节点时，忘记token，使用以下命令：

```shell
student@client:~$
kubeadm token list
输出：
TOKEN                       TTL
8fgyt8.feuw3kpt93vunz3j     21h
```

2. 获取master ca根证书hash值(在master节点上使用)：

```shell
 openssl x509 -pubkey -in ~/.kube/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
 
输出：获取到的hash值
```

3. 在worker节点上使用token和ca hash 加入集群

```shell
student@k8s-nodeX:~$ 
sudo kubeadm join 192.168.126.100:6443 --token 8fgyt8.feuw3kpt93vunz3j --discovery-token-ca-cert-hash
sha256:3a35a161a49bd31a844c348befe5da62334b215cb290ba79aecc4088ad77e31c
```

在worker节点上使用token忽略CA证书hash加入集群

```shell
student@k8s-nodeX:~$ 
sudo kubeadm join 192.168.126.100:6443 --token 8fgyt8.feuw3kpt93vunz3j --discovery-token-unsafe-skip-ca-verification
```

### 3.2 添加node--token证书过期：token默认TTL（Time to Life 生命周期）为24小时 

1. 生成随机token

```shell
student@client:~$ 
kubectl token generate
输出：
vg2xee.3z4u7w8ft97v386d
```

2.查看token计算后的hash

```shell
student@client:~$ 
kubeadm token create oyxkj6.t4xtcfep6wb1kbfq --print-join-command --ttl=0
输出：
W0616 11:55:20.294249 6745 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
kubeadm join 192.168.126.100:6443 --token oyxkj6.t4xtcfep6wb1kbfq --discovery-token-ca-cert-hash
sha256:9089b80500b0b4ce449d456238c2322ec118b4badff36f0ec1b41570daab53dd
```

3. **以上两步可以进行命令的合并**

```shell
student@client:~$ 
kubeadm token create --print-join-command --ttl=0(代表永不过期)
输出：（加入master节点语句）
kubeadm join 192.168.126.100:6443 --token yt8wio.29jlbvhj89rrma1c --discovery-token-ca-cert-hashsha256:3a35a161a49bd31a844c348befe5da62334b215cb290ba79aecc4088ad77e31c
```

4. 在node3节点上执行以上打印的命令

```shell
student@k8s-node3:~$
sudo kubeadm join 192.168.126.100:6443 --token oyxkj6.t4xtcfep6wb1kbfq --discovery-token-ca-cert-hash
sha256:3a35a161a49bd31a844c348befe5da62334b215cb290ba79aecc4088ad77e31c
```

5. 删除token

```shell
student@k8s-node3:~$
kubeadm token delete 7i8m5i.217s3ru14dog71kl(token)
输出:
bootstrap token "7i8m5i" deleted
```

6.8080报错

```shell
student@k8s-node3:~$
kubectl get nodes
输出：
The connection to the server localhost:8080 was refused - did you specify the right host or port?
没有配置凭证
```

### 3.3 删除集群中node

1. 给节点打上SchedulingDisabled标签  （cordon警戒线、包围隔离）

   ```
   student@client:~$
   kubectl cordon k8s-node3.lab.example.com 
   输出：
   node/k8s-node3.lab.example.com cordoned
   ```

2. 使用kubectl drain(排干,驱逐),将指定删除的节点上的资源迁移至集群中的其他节点上

   ```shell
   kubectl drain k8s-node3.lab.example.com --ignore-daemonsets [--delete-emptydir-data]
   （忽略daemonset控制器管理的pods）
   ```

   drain：这个节点上通知台账。尝试迁移pods。如果迁移不了就删除节点上的pods，然后在其他节点上进行重建。

3. 在要删除的node上，执行重置reset系统状态

   ```shell
   student@k8s-node3:~$ 
   sudo kubeadm reset -f
   
   student@k8s-node3:~$
   sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X（手动删除转发表）
   
   student@k8s-node3:~$ 
   sudo ipvsadm -C //如果安装了
   ```

   reset -f： 尽量将节点上，在加入节点后作出的变更抹除掉，尽量恢复在加入集群之前的状态。

4. 从etcd中删除节点信息（数据库中删除）

   ```shell
   student@client:~$
   kubectl delete node k8s-node3.lab.example.com
   ```

   

### 3.4 升级整个集群

所谓的升级降级是将核心组件pod进行升级和降级

集群的升级需要回到master节点进行操作

1. 在master节点检查集群可用的最基础的稳定版本

   ```shell
   student@k8s-master:~$ 
    sudo kubeadm upgrade plan
   ```

2. 在master节点升级配置的软件包到集群的新版本

   ```shell
   student@k8s-master:~$ （查看可升级版本号）
   sudo apt-cache madison kubelet | head
   
   student@k8s-master:~$ （升级配套的软件包）
   sudo apt-get install kubeadm=1.22.4-00 kubectl=1.22.4-00 kubelet=1.22.4-00 -y
   
   student@k8s-master:~$ 
   sudo systemctl restart kubelet
   
   student@k8s-master:~$ 
   kubectl get nodes
   
   ```

   kubelet是以软件包的形式运行的，所以还需要升级kubelet软件包

3. 在master节点上升级集群控制平面

   ```shell
   student@k8s-master:~$ 
   sudo kubeadm upgrade apply v1.22.4
   ```

4. 升级worker节点上的kubelet

   ```shell
   student@k8s-master:~$ 
   for x in {1..2};do ssh k8s-node$x sudo apt-get install kubelet=1.22.3-00 -y;done
   
   student@k8s-master:~$ 
   for x in {1..2};do ssh k8s-node$x sudo systemctl restart kubelet;done
   
   student@k8s-master:~$ 
   kubectl get nodes
   ```

### 3.5 降级集群：范例从v1.22.4再次降级到v1.22.0

1. 降级control-plane

   ```shell
   student@k8s-master:~$ （cordon）
   kubectl cordon k8s-master.lab.example.com
   
   student@k8s-master:~$
   kubectl drain k8s-master.lab.example.com --ignore-daemonsets
   
   student@k8s-master:~$ 
   sudo apt-get install kubectl=1.22.0-00 kubeadm=1.22.0-00 kubelet=1.22.0-00 --allow-downgrades -y
   
   student@k8s-master:~$ 
   sudo systemctl restart kubelet
   
   student@k8s-master:~$
   sudo kubeadm upgrade apply v1.22.0 -y
   
   student@k8s-master:~$ （uncordon）
   kubectl uncordon k8s-master.lab.example.com
   ```

2. 降级node节点kubelet

   ```shell
   student@k8s-master:~$ （升级）
   for x in {1..2};do ssh k8s-node$x sudo apt-get install kubelet=1.22.0-00 --allow-downgrades -y;done
   
   student@k8s-master:~$ （重启）
   for x in {1..2};do ssh k8s-node$x sudo systemctl restart kubelet;done
   
   student@k8s-master:~$ 
   kubectl get nodes
   ```

### 3.6 添加kubernetes客户端

1. Ubuntu客户端 

















