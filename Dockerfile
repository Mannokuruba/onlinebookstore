FROM tomcat
COPY /home/manoj/workspace/completeproject/target/*.war .
ADD mannojob.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
