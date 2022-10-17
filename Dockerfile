FROM maven as build

WORKDIR /spring-app
COPY . .
RUN mvn clean install

CMD mvn spring-boot:run

FROM openjdk:11.0
WORKDIR /spring-app
COPY --from=build /app/target/tpAchatProject.jar /spring-app/
EXPOSE 9090
CMD ["java","jar","tpAchatProject.jar"]

