# Use Alpine Linux as base image
FROM alpine:latest

RUN apk --no-cache add openjdk17-jre

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV SPRING_PROFILES_ACTIVE web


# Copy Apache Tomcat directory into the container
COPY apache-tomcat-9.0.88 /opt/apache-tomcat-9.0.88

RUN chmod +x /opt/apache-tomcat-9.0.88/bin/catalina.sh

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/apache-tomcat-9.0.88/bin/catalina.sh", "run"]
