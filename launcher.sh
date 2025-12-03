#!/usr/bin/expect

set timeout 20
set version [lindex $argv 0]
set provider_name [lindex $argv 1]
set url_provider [lindex $argv 2]
set api_key [lindex $argv 3]
set ai_model_name [lindex $argv 4]


spawn telnet $name
expect "Enter number or name:"
send "$version\r"
expect "Enter a name/alias for this provider [openai]:"
send "$provider_name\r"
expect "Enter baseURL for openai [https://api.openai.com/v1]:"
send "$url_provider\r"
expect "Enter API key for openai (leave blank to pick from environment variable OPENAI_API_KEY):"
send "$api_key\r"
expect "Specify model for openai [gpt-5.1]:"
send "$ai_model_name\r"
