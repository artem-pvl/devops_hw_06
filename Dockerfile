FROM ubuntu:latest
RUN apt update \
&& apt install git maven tomcat9 -y \
&& git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/hello \
&& mvn -q -f /tmp/hello package \
&& mv /tmp/hello/target/hello-1.0.war /usr/local/tomcat/webapps/ \
&& rm -r /tmp/hello \
&& apt purge git maven -y \
&& apt autoremove -y