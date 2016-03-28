#!/bin/bash
set -e

if [ "$1" = 'litecoin-cli' -o "$1" = 'litecoin-tx' -o "$1" = 'litecoind' -o "$1" = 'test_litecoin' ]; then
	mkdir -p "$LITECOIN_DATA"

	if [ ! -s "$LITECOIN_DATA/litecoin.conf" ]; then
		cat <<-EOF > "$LITECOIN_DATA/litecoin.conf"
		printtoconsole=1
		rpcpassword=${LITECOIN_RPC_PASSWORD:-password}
		rpcuser=${LITECOIN_RPC_USER:-litecoin}
		EOF
	fi

	# chown -R litecoin "$LITECOIN_DATA"
	# exec gosu litecoin "$@"
	exec "$@"
fi

exec "$@"
