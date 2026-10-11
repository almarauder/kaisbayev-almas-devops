FROM ubuntu:22.04

WORKDIR /app

# Install bash (already present, but good practice)
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*

# Copy the application
COPY app/app.sh .

# Make it executable
RUN chmod +x app.sh

# Expose a port (even if we don't use it)
EXPOSE 8080

ENV STUDENT_NAME=Almas
ENV STUDENT_SURNAME=Kaisbayev
ENV STUDENT_GROUP=IT2-2306
ENV STUDENT_ID=37388

CMD ["./app.sh"]
