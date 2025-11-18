# fortytwo-relay-setup

## Run instructions
1. Copy and update environment variables:
```bash
cp .env.example .env
```
2. Ensure that FT_NODE_LISTENER_PORT is publicly accessible over both TCP and UDP.
3. Build the Docker Compose services:
```bash
docker compose build
```
4. Run the services in the background:
```bash
docker compose up -d
```
---
## FAQ
# Can I run my node with relay node? - Yes
- You need to change default FT_NODE_LISTENER_PORT and FT_RPC_SERVICE_PORT 
- Use another FT_ACCOUNT_PRIVATE_KEY
