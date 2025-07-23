# Use Maven to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# Use Tomcat base image
FROM tomcat:10.1-jdk17-temurin

ENV WAR_NAME=Streaming-0.0.1-SNAPSHOT.war

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR file
COPY --from=build /app/target/${WAR_NAME} /usr/local/tomcat/webapps/${WAR_NAME}

# Expose Tomcat port
EXPOSE 7070

CMD ["catalina.sh", "run"]
