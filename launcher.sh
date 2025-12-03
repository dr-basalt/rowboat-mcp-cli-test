#!/usr/bin/expect -f

set timeout 20
set version [lindex $argv 0]
set provider_name [lindex $argv 1]
set url_provider [lindex $argv 2]
set api_key [lindex $argv 3]
set ai_model_name [lindex $argv 4]

# Lancer rowboatx
spawn rowboatx

expect "Enter number or name:"
send "$version\r"

expect "Enter a name/alias for this provider*"
send "$provider_name\r"

expect "Enter baseURL for*"
send "$url_provider\r"

expect "Enter API key for*"
send "$api_key\r"

expect "Specify model for*"
send "$ai_model_name\r"

# Attendre que la configuration soit terminée
expect eof
```

---

## 📁 Structure du repo GitHub
```
rowboat-mcp-cli-test/
├── Dockerfile
├── entrypoint.sh
├── launcher.sh
└── .gitignore
```

### `.gitignore`
```
.env
*.log
node_modules/
