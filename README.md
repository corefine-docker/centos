# centos

### 默认密码:changeme
docker run --name my-centos -p 10022:22 -p 10080:8080 -d fine/centos

> ssh 127.0.0.1 -p 10022

The authenticity of host '[127.0.0.1]:10022 ([127.0.0.1]:10022)' can't be established.

RSA key fingerprint is SHA256:kj/4FCulv0DCm4zuP+040uQRCTashUA3j7kkIij4Ha4.

RSA key fingerprint is MD5:6d:5d:70:87:1b:0f:02:cd:18:5b:8f:b6:d3:ea:ed:f3.

Are you sure you want to continue connecting (yes/no)? **yes**

Warning: Permanently added '[127.0.0.1]:10022' (RSA) to the list of known hosts.

root@127.0.0.1's password: **changeme**

Last login: ...

[root@f48b1859b017 ~]# 

     

### 设置root密码为123456
docker run --name my-centos -p 10022:22 -p 10080:8080 -e ROOTPASSWORD=123456 -d fine/centos

### 挂载目录
docker run --name my-centos -p 10022:22 -p 10080:8080 -v /home/docker_volume/centos:/data -d fine/centos


     
     
