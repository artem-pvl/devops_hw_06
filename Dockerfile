FROM tomcat:latest
RUN apt update
RUN apt install git maven -y
RUN mkdir /tmp/git
RUN cd /tmp/git
RUN git pull https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package -q
RUN tomcat_dir=`find /var/lib -maxdepth 1 -name "tomcat*" -type d`
RUN mv ./target/hello-1.0.war $tomcat_dir/webapps/
RUN cd /tmp
RUN rm -r git
RUN apt purge git maven -y
RUN apt autoremove -y