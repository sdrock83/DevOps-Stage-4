#!/bin/bash

# Create directories
mkdir -p traefik/certificates

# Create traefik.yml
cat > traefik/traefik.yml << 'EOF'
api:
  dashboard: true
  insecure: true

providers:
  docker:
    exposedByDefault: false
  file:
    filename: /etc/traefik/dynamic_conf.yaml

entryPoints:
  web:
    address: ":80"
  websecure:
    address: ":443"

certificatesResolvers:
  myresolver:
    acme:
      email: onasanwolasubomi1@gmail.com
      storage: /certificates/acme.json
      tlsChallenge: {}
EOF

# Create dynamic_conf.yaml
cat > traefik/dynamic_conf.yaml << 'EOF'
http:
  middlewares:
    secureHeaders:
      headers:
        sslRedirect: true
        forceSTSHeader: true
        stsIncludeSubdomains: true
        stsPreload: true
        stsSeconds: 31536000
EOF

# Create docker network
docker network create todo-network

echo "Setup completed successfully!"
