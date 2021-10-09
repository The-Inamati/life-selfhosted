#!/usr/bin/env bash

function generatePassword() {
    openssl rand -hex 16
}

echo "# If this script fails, it's likely because you don't have the openssl tool installed."
echo "# Install it before using this script, or simply create your own passwords manually."

echo ""

JICOFO_COMPONENT_SECRET=$(generatePassword)
JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
SHARED_SECRET=$(generatePassword)
TURN_SECRET=$(generatePassword)
REGISTRATION_SECRET=$(generatePassword)
MACAROON_SECRET=$(generatePassword)
FORM_SECRET=$(generatePassword)
LOCALDB_PEPPER=$(generatePassword)
ADMIN_SECRET=$(generatePassword)

echo "# Save these secrets to use later:"
echo ""
echo "JICOFO_COMPONENT_SECRET: "$JICOFO_COMPONENT_SECRET
echo "JICOFO_AUTH_PASSWORD: "$JICOFO_AUTH_PASSWORD
echo "JVB_AUTH_PASSWORD: "$JVB_AUTH_PASSWORD
echo "SHARED_SECRET: "$SHARED_SECRET
echo "TURN_SECRET: "$TURN_SECRET
echo "REGISTRATION_SECRET: "$REGISTRATION_SECRET
echo "MACAROON_SECRET: "$MACAROON_SECRET
echo "FORM_SECRET: "$FORM_SECRET
echo "LOCALDB_PEPPER: "$LOCALDB_PEPPER
echo "ADMIN_SECRET: "$ADMIN_SECRET