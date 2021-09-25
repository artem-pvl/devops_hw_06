FROM tomcat:latest
RUN apt update
RUN apt install git maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/hello
RUN mvn -q -f /tmp/hello package
RUN mkdir /usr/local/tomcat/webapps
RUN mv /tmp/hello/target/hello-1.0.war /usr/local/tomcat/webapps/
RUN rm -r /tmp/hello
RUN apt purge git maven -y
RUN apt autoremove -y