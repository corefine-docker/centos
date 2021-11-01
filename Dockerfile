FROM centos:7
MAINTAINER Fe
WORKDIR /data
RUN rm -rf /etc/yum.repos.d/* 
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo 
RUN yum install -y openssh-server telnet sudo wget vi vim lrzsz zip \
    unzip git net-tools java-1.8.0-openjdk-devel python3-setuptools --skip-broken && \
    yum update -y && \
    yum clean all && \
    pip3 install supervisor -i https://mirrors.aliyun.com/pypi/simple/ && \
    \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd
COPY supervisord.conf /etc/supervisord.conf
COPY ssh_init.sh  /root/ssh_init.sh
ENV TZ=Asia/Shanghai
EXPOSE 22
CMD ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
