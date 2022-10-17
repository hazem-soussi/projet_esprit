FROM maven as build

WORKDIR /spring-app
COPY . .
RUN mvn clean install

CMD mvn spring-boot:run


FROM openjdk:8-jdk-alpine
EXPOSE 8081
ADD target/*.war /
ENTRYPOINT ["java", "-jar", "TpAchatProject-1.0.war "]


