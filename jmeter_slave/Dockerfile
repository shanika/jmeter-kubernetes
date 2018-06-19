FROM shanika/jmeter-base
MAINTAINER Kubernauts-lab

EXPOSE 1099 50000

ENTRYPOINT $JMETER_HOME/bin/jmeter-server \
-Dserver.rmi.ssl.disable=true \
-Dserver.rmi.localport=50000 \
-Dserver_port=1099