FROM maven:3.8.3-jdk-11 AS maven_build
WORKDIR /tmp
COPY pom.xml .
COPY src/ ./src/
RUN mvn package -Dmaven.test.skip=true

FROM  openjdk:11
COPY --from=maven_build /tmp/target/easy-notes-1.0.0.jar /data/easy-notes-1.0.0.jar
EXPOSE 8080
CMD java -jar /data/easy-notes-1.0.0.jar