ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.11"

lazy val root = (project in file("."))
  .settings(
    name := "FluentdDocker"
  )

libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-actor" % "2.8.0",
  "io.opentelemetry" % "opentelemetry-api" % "1.24.0",
  "io.opentelemetry" % "opentelemetry-sdk" % "1.24.0",
  "org.fluentd" % "fluent-logger" % "0.3.4",
  "ch.qos.logback" % "logback-classic" % "1.4.7",
  "org.apache.logging.log4j" % "log4j-api" % "2.20.0",
  "org.apache.logging.log4j" % "log4j-core" % "2.20.0",
  "org.apache.logging.log4j" % "log4j-slf4j-impl" % "2.20.0"
)