FROM openjdk:8-jre-slim
MAINTAINER shanika

ARG JMETER_VERSION=4.0

RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
    wget \
    telnet \
    iputils-ping \
    curl \
    gnupg2 \
    unzip

RUN   mkdir /jmeter \
&& cd /jmeter/ \
&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
&& rm apache-jmeter-$JMETER_VERSION.tgz

ADD plugins /jmeter/apache-jmeter-$JMETER_VERSION/lib

RUN java -cp /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext/jmeter-plugins-manager-1.1.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

RUN bash /jmeter/apache-jmeter-$JMETER_VERSION/bin/PluginsManagerCMD.sh install jpgc-webdriver=2.3

COPY jmeter-plugins-webdriver-2.3.jar /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext/

# Install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && \
	apt-get install -yq google-chrome-stable

# Install Chrome WebDriver
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    mkdir -p /opt/chromedriver-2.40 && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-2.40 && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod +x /opt/chromedriver-2.40/chromedriver && \
    ln -fs /opt/chromedriver-2.40/chromedriver /usr/local/bin/chromedriver

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION

ENV PATH $JMETER_HOME/bin:$PATH