#!/bin/bash
set -e

echo "🔧 Configuring Rowboat with environment variables..."

# Valeurs par défaut si non définies
OPENAI_PROVIDER_NAME=${OPENAI_PROVIDER_NAME:-openai}
OPENAI_BASE_URL=${OPENAI_BASE_URL:-https://api.openai.com/v1}
OPENAI_MODEL=${OPENAI_MODEL:-gpt-4}

# Vérifier que la clé API est présente
if [ -z "$OPENAI_API_KEY" ]; then
    echo "❌ ERROR: OPENAI_API_KEY is not set!"
    exit 1
fi

echo "✅ OPENAI_API_KEY is set"
echo "📝 Provider: $OPENAI_PROVIDER_NAME"
echo "🌐 Base URL: $OPENAI_BASE_URL"
echo "🤖 Model: $OPENAI_MODEL"

# Exécuter le launcher avec les variables d'environnement
/app/launcher.sh 6 "$OPENAI_PROVIDER_NAME" "$OPENAI_BASE_URL" "$OPENAI_API_KEY" "$OPENAI_MODEL"

echo "✅ Rowboat configured successfully!"

# Lancer Supergateway
echo "🚀 Starting Supergateway..."
exec supergateway \
    --stdio "rowboatx" \
    --outputTransport sse \
    --port 3000 \
    --ssePath /sse \
    --messagePath /message \
    --logLevel info \
    --cors \
    --healthEndpoint /health
