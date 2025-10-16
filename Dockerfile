# ---- Étape 1 : Build (avec JDK) ----
FROM eclipse-temurin:17 AS builder
WORKDIR /app
COPY . .
RUN chmod +x mvnw
# Build en mode batch (silencieux) + skip tests
RUN ./mvnw -q -DskipTests package

# ---- Étape 2 : Run (JRE seulement) ----
FROM eclipse-temurin:17
WORKDIR /app
# Copier le JAR produit depuis l'étape 1
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

# Port exposé par l'app
EXPOSE 8080

# Lancement de l'appli
ENTRYPOINT ["java","-jar","/app/app.jar"]
