# Use Java 8 slim JRE
FROM openjdk:8-jre-slim
MAINTAINER DawsonJmeterTest

# JMeter version
ARG JMETER_VERSION=3.3

# Install few utilities
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
                wget \
                telnet \
                iputils-ping \
                unzip

# Install JMeter
RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
      && tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
      && rm apache-jmeter-$JMETER_VERSION.tgz \
      && cd /jmeter/apache-jmeter-$JMETER_VERSION/lib/ \
      && wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar \
      && tar -xzf jython-standalone-2.7.2.jar \
      && rm jython-standalone-2.7.2.jar \
      && cd /jmeter/ \
      && mkdir /jmeter-plugins \
      && cd /jmeter-plugins/ \
      && wget https://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.4.0.zip \
      && unzip -o JMeterPlugins-ExtrasLibs-1.4.0.zip -d /jmeter/apache-jmeter-$JMETER_VERSION/ \
      && wget https://jmeter-plugins.org/files/packages/jpgc-perfmon-2.0.zip \
      && unzip -o jpgc-perfmon-2.0.zip -d /jmeter/apache-jmeter-$JMETER_VERSION/

# Set JMeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

# Add JMeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH