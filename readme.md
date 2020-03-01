# 基于docker的linux C++开发环境
1. 基于alphine镜像构建，添加了开发linux常用的功能
2. 后续如果需要添加什么库，在这个基础镜像之上构建
3. 新增编译库参考ffmpeg的dockerfile
4. 执行容器：sudo docker run -it hhp/alpine_cxx:v1 /bin/sh 

# 相关命令
1. 删除所有关闭的容器：sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo  docker rm
2. 查看docker相关空间：sudo docker system df
