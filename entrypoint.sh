#!/bin/sh
set -e

DATA_DIR="${BOTTLE_APP_DATA_DIR:-/data/app_data/escritalivre}"
mkdir -p "$DATA_DIR"
mkdir -p "$DATA_DIR/keys"

CONFIG_FILE="$DATA_DIR/config.ini"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Creating WriteFreely config.ini..."
    cat <<CFG > "$CONFIG_FILE"
[server]
hidden_host          = 
port                 = 8080
bind                 = 0.0.0.0
tls_cert_path        = 
tls_key_path         = 
autocert             = false
templates_parent_dir = /app
static_parent_dir    = /app
pages_parent_dir     = /app
keys_parent_dir      = $DATA_DIR

[database]
type     = sqlite3
filename = $DATA_DIR/writefreely.db
username = 
password = 
database = 
host     = 
port     = 0

[app]
site_name             = Escrita Livre
site_description      = Espaço de reflexão, filosofia e literatura
host                  = https://escrita.zonaeducacional.org
theme                 = write
editor                = 
disable_registration  = false
open_registration     = true
min_username_len      = 3
max_blogs             = 5
federation            = true
public_stats          = true
monetization          = false
CFG

    echo "Generating keys..."
    /app/writefreely -c "$CONFIG_FILE" keys generate

    echo "Initializing database..."
    /app/writefreely -c "$CONFIG_FILE" db init
fi

echo "Starting WriteFreely..."
exec /app/writefreely -c "$CONFIG_FILE"
