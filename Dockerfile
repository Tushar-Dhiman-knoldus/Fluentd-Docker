# Use a base image with the necessary environment for Scala applications
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Install sbt
RUN curl -L "https://github.com/sbt/sbt/releases/download/v1.5.5/sbt-1.5.5.tgz" -o sbt-1.5.5.tgz && \
    tar -xvf sbt-1.5.5.tgz && \
    rm sbt-1.5.5.tgz && \
    mv sbt /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt

# Copy the necessary files to the container
COPY . /app

# Add Log4j dependencies
RUN sbt "set libraryDependencies += \"com.typesafe.akka\" %% \"akka-actor\" % \"2.8.0\""
RUN sbt "set libraryDependencies += \"io.opentelemetry\" % \"opentelemetry-api\" % \"1.24.0\""
RUN sbt "set libraryDependencies += \"io.opentelemetry\" % \"opentelemetry-sdk\" % \"1.24.0\""
RUN sbt "set libraryDependencies += \"org.fluentd\" % \"fluent-logger\" % \"0.3.4\""
RUN sbt "set libraryDependencies += \"ch.qos.logback\" % \"logback-classic\" % \"1.4.7\""

# Build the Scala application
RUN sbt compile

# Specify the logging driver and options
CMD ["sbt","-Dakka.coordinated-shutdown.exit-jvm=off", "run"]
