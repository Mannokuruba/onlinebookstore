FROM tomcat
COPY /home/manoj/workspace/dockerjob/target/*.war .
ADD mannojob.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
