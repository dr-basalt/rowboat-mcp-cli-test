FROM node:20-slim

# Installer curl pour health checks
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installer Supergateway et Rowboat en permanent
RUN apt update && apt-get install expect -y

RUN npm install -g supergateway @rowboatlabs/rowboatx@latest
RUN apt update && apt-get install expect -y && apt-get install nano
RUN launcher.sh 6 openai https://api.openai.com/v1 api_key

# Exposer le port 3000 (attendu par Coolify)
EXPOSE 3000

# Démarrer Supergateway en mode SSE avec Rowboat
CMD supergateway \
    --stdio "rowboatx" \
    --outputTransport sse \
    --port 3000 \
    --ssePath /sse \
    --messagePath /message \
    --logLevel info \
    --cors \
    --healthEndpoint /health
