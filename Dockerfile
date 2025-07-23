FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk17
COPY --from=build /app/target/Streaming-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
