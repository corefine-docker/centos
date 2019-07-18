FROM centos:7
MAINTAINER Fe
WORKDIR /data
RUN yum install -y wget
RUN rm -rf /etc/yum.repos.d/* 
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum install -y openssh-server sudo wget vi vim lrzsz zip unzip git net-tools python-setuptools
RUN yum clean all
RUN easy_install pip && pip install supervisor
RUN \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd
COPY supervisord.conf /etc/supervisord.conf
COPY ssh_init.sh /root/ssh_init.sh
EXPOSE 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
