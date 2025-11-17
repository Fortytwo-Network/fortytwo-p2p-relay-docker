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
## Utilities
### Get a drop for an existing wallet
```bash
make get-drop WALLET=... CODE=... 
```
### Create a wallet and get a drop
```bash
make get-drop PRIVATE_KEY_PATH=... CODE=... 
```
### View logs
```bash
docker compose logs -f -t --tail 100
```
### Export logs
```bash
docker compose logs -t > "ft_relay_logs_$(date +'%Y%m%d_%H%M%S').txt"
```
