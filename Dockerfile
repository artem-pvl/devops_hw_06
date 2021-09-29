FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install tomcat9 -y
RUN apt update && apt install default-jdk -y
RUN apt update && apt install git maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/hello
RUN mvn -q -f /tmp/hello package && ls -al /tmp/hello/target/
RUN mv /tmp/hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
RUN rm -r /tmp/hello
RUN apt purge git maven -y
RUN apt autoremove -y
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]