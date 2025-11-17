.PHONY: get-drop create-wallet

UTILS_EXEC := utils/FortytwoUtils
LATEST_URL := https://fortytwo-network-public.s3.us-east-2.amazonaws.com/utilities/latest
BASE_URL   := https://fortytwo-network-public.s3.us-east-2.amazonaws.com/utilities

install-or-update-utils:
	@UTILS_VERSION=$$(curl -s "$(LATEST_URL)"); \
	echo "Utils — version $$UTILS_VERSION"; \
	DOWNLOAD_UTILS_URL="$(BASE_URL)/v$$UTILS_VERSION/FortytwoUtilsLinux"; \
	if [ -f "$(UTILS_EXEC)" ]; then \
		CURRENT_VER_OUTPUT=$$("$(UTILS_EXEC)" --version 2>/dev/null || true); \
		echo "$$CURRENT_VER_OUTPUT" | grep -q "$$UTILS_VERSION"; \
		if [ $$? -eq 0 ]; then \
			echo "Up to date"; \
		else \
			echo "Updating..."; \
			curl -fsSL -o "$(UTILS_EXEC)" "$$DOWNLOAD_UTILS_URL"; \
			chmod +x "$(UTILS_EXEC)"; \
			echo "Successfully updated"; \
		fi; \
	else \
		echo "Downloading..."; \
		mkdir -p $$(dirname "$(UTILS_EXEC)"); \
		curl -fsSL -o "$(UTILS_EXEC)" "$$DOWNLOAD_UTILS_URL"; \
		chmod +x "$(UTILS_EXEC)"; \
		echo "Installed to: $(UTILS_EXEC)"; \
	fi


get-drop: install-or-update-utils
	@if [ -z "$(WALLET)" ]; then echo "No WALLET provided. Use: make get-drop WALLET=... CODE=..."; exit 1; fi
	@if [ -z "$(CODE)" ]; then echo "No CODE provided. Use: make get-drop WALLET=... CODE=..."; exit 1; fi
	@echo "⨳ Requesting drop..."
	@"$(UTILS_EXEC)" --drop-wallet "$(WALLET)" --drop-code "$(CODE)"

create-wallet: install-or-update-utils
	@if [ -z "$(PRIVATE_KEY_PATH)" ]; then echo "No PRIVATE_KEY_PATH provided. Use: make create-wallet PRIVATE_KEY_PATH=... CODE=..."; exit 1; fi
	@if [ -z "$(CODE)" ]; then echo "No CODE provided. Use: make create-wallet PRIVATE_KEY_PATH=... CODE=..."; exit 1; fi
	@"$(UTILS_EXEC)" --create-wallet "$(PRIVATE_KEY_PATH)" --drop-code "$(CODE)"
