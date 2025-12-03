FROM node:20-slim

# Installer curl pour health checks
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installer Supergateway et Rowboat en permanent
RUN npm install -g supergateway @rowboatlabs/rowboatx@latest

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
