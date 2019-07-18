FROM centos:7
MAINTAINER Fe
WORKDIR /data
RUN yum install -y wget
RUN rm -rf /etc/yum.repos.d/* 
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum install -y openssh-server sudo wget vi vim lrzsz zip unzip git net-tools
RUN yum clean all
RUN \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN useradd admin 
RUN echo "root:root" | chpasswd 
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
