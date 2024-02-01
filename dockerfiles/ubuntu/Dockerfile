# 设置基础镜像为Ubuntu 18.04
FROM ubuntu:18.04

# 设置作者信息
MAINTAINER lckfb "service@lckfb.com"

# 设置环境变量，用于非交互式安装
ENV DEBIAN_FRONTEND=noninteractive

# 备份源列表文件
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.bak

# 将源列表中的 http://.*ubuntu.com 替换为 http://repo.huaweicloud.com
RUN sed -i 's@http://.*ubuntu.com@http://repo.huaweicloud.com@g' /etc/apt/sources.list

# 更新包列表
RUN apt update

# 安装基本的编译工具和依赖
RUN apt install -y build-essential crossbuild-essential-arm64 \
        bash-completion vim sudo locales time rsync bc python

# 安装其他依赖包，这里编译android11sdk需要的环境
RUN apt install -y repo git ssh libssl-dev liblz4-tool lib32stdc++6 \
        expect patchelf chrpath gawk texinfo diffstat binfmt-support \
        qemu-user-static live-build bison flex fakeroot cmake \
        unzip device-tree-compiler python-pip ncurses-dev python-pyelftools \
        subversion asciidoc w3m dblatex graphviz python-matplotlib cpio \
        libparse-yapp-perl default-jre patchutils swig expect-dev u-boot-tools

RUN apt install -y bear

# 配置电源菜单时需要
RUN apt install -y whiptail

# 再次更新包列表并安装任何未安装的依赖
RUN apt update && apt install -y -f

# 生成本地化语言支持
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# 创建开发板用户
RUN useradd -c 'lckfb user' -m -d /home/lckfb -s /bin/bash lckfb

# sudo免密登录
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
RUN usermod -a -G sudo lckfb

USER lckfb
#设置docker工作目录为/home/lckfb
WORKDIR /home/lckfb

#容器使用这个内核方法
#docker run --privileged --mount type=bind,source=/home/LCKFB_RK3566/ROCKCHIP_ANDROID11.0_SDK_RELEASE/ROCKCHIP_ANDROID11.0_SDK_RELEASE,target=/home/lckfb/android11 --name="lckfb_android11_sdk" -h lckfb -it lckfb_android11_sdk_cmp
