FROM node:20-slim

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    curl \
    expect \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installer Supergateway et Rowboat
RUN npm install -g supergateway @rowboatlabs/rowboatx@latest

# Copier le script launcher
COPY launcher.sh /app/launcher.sh
RUN chmod +x /app/launcher.sh

# Copier le script d'entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Exposer le port
EXPOSE 3000

# Utiliser l'entrypoint qui configure puis lance supergateway
ENTRYPOINT ["/app/entrypoint.sh"]
