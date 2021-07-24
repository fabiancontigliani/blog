#De la imagen que partimos
FROM openjdk:11

RUN apk add --no-cache tzdata
ENV TZ='America/Argentina/Mendoza'
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk --update add fontconfig ttf-dejavu

#Directorio de trabajo
WORKDIR /

RUN mkdir app && chmod 777 app
COPY target/blog-0.0.1-SNAPSHOT.jar /app
WORKDIR /app

#Exponemos el puerto 8080
EXPOSE 8080

#Comando que se ejecutarÃ¡ una vez ejecutemos el contendor
CMD ["java","-jar","blog-0.0.1-SNAPSHOT.jar"]
