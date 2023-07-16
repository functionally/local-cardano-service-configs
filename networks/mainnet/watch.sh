#!/usr/bin/env bash

. configure.env

export PATH=$MARLOWE_BIN:$PATH

watch -n 60 'psql '$CARDANO_NETWORK' -c "select '"'"'chain'"'"' :: varchar as schema, max(blockno) as blockno, max(slotno) as slotno from chain.block union all select '"'"'marlowe'"'"', max(blockno), max(slotno) from marlowe.block union all select '"'"'public'"'"', max(block_no), max(slot_no) from public.block"; echo; cardano-cli query tip '${MAGIC[@]}' | json2yaml'
