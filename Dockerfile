FROM openjdk:8
ADD target/myPatient-0.0.1-SNAPSHOT.jar myPatient.jar
ENTRYPOINT ["java","-jar","myPatient.jar"]
EXPOSE 8090