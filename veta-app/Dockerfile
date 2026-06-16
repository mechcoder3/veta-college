# =============================================
# VETA College Tanzania - Dockerfile for Render
# Spring Boot 2.7.15 + JSP (JAR) + Java 11
# =============================================

# Stage 1: Build the application
FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app

# Copy pom.xml first (for dependency caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build JAR (skip tests for faster build)
RUN mvn clean package -DskipTests

# =============================================
# Stage 2: Run the application
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy built JAR from build stage
COPY --from=build /app/target/veta-college.jar app.jar

# Expose port 8080
EXPOSE 8080

# JVM tuning for low memory (Render free tier = 512MB)
ENV JAVA_OPTS="-Xms128m -Xmx400m -XX:+UseSerialGC -XX:MaxMetaspaceSize=100m"

# Run the application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
