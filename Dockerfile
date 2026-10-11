FROM ubuntu:22.04
WORKDIR /app
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*
COPY app/app.sh .
RUN chmod +x app.sh
EXPOSE 8080
ENV STUDENT_NAME=Almas
ENV STUDENT_SURNAME=Kaisbayev
ENV STUDENT_GROUP=IT2-2306
ENV STUDENT_ID=37388

CMD ["./app.sh"]
