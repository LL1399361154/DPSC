#!/bin/bash
export RTE_SDK=/home/C402/liqiang/src/dpdk-stable-19.11.8
export RTE_TARGET=x86_64-native-linuxapp-gcc
#export PATH=/home/C402/liqiang/dev_dpdk/include:$PATH    
autoconf
aclocal
automake
./configure -with-libhs-includes=/usr/local/include/hs/ -with-libhs-libraries=/home/C402/liqiang/hyperscan/lib --enable-dpdk --prefix=/home/C402/liqiang/dev_suricata
# 这样编译好后还是会报无法找到动态链接文件，因为大部分第三方组件都是采用的单独编译然后配置路径，没有在系统需要的路径李里面
# 所有需要 https://blog.csdn.net/deeplan_1994/article/details/83927832 加入搜索路径
# vim /etc/ld.so.conf.d/hyperscan.conf
# /usr/local/lib
# sudo ldconfig
#./configure --enable-dpdk --prefix=/home/C402/liqiang/dev_suricata
make -j 80
make install-full
#make clean
