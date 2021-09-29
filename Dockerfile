FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV CATALINA_BASE /var/lib/tomcat9
ENV PATH $CATALINA_BASE/bin:$PATH
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
RUN apt update && apt install tomcat9 -y
RUN apt update && apt install default-jdk git maven -y \
&& git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/hello \
&& mvn -q -f /tmp/hello package \
&& mv /tmp/hello/target/hello-1.0.war /var/lib/tomcat9/webapps/ \
&& rm -r /tmp/hello \
&& apt purge git maven default-jdk -y \
&& apt autoremove -y
EXPOSE 8080
CMD ["catalina.sh", "run"]