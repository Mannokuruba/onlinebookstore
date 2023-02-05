FROM tomcat
ADD target/mannojob.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8081
