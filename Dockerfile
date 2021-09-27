# FROM maven:3.5.2-jdk-8-alpine 
# COPY wait-for-it.sh /usr/bin
# RUN chmod +x /usr/bin/wait-for-it.sh
# COPY pom.xml /tmp/
# COPY src /tmp/src/
# WORKDIR /tmp/


FROM maven
COPY . /usr/src/
RUN mvn -f /usr/src/pom.xml clean package


FROM tomcat
COPY /usr/src/target/petclinic.war /usr/local/tomcat/webapps
