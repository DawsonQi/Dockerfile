#use dawsoncai base image
# 使用dawsoncai基本映像
FROM dawsoncai/jmeter-base:latest
MAINTAINER DawsonJmeterTest

# Ports to be exposed from the container for JMeter Slaves/Server
# 从JMeter Slaves/Server的容器中要公开的端口
EXPOSE 1099 50000

# Application to run on starting the container
# 启动容器 运行应用程序
ENTRYPOINT $JMETER_HOME/bin/jmeter-server \
                        -Dserver.rmi.localport=50000 \
                        -Dserver_port=1099