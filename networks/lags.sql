\set tip `/scratch/iohk/bin/cardano-cli query tip --mainnet | jq -r .slot`
select
    'node - chain' as "Measurment"
  , :tip - max(slotno) as "Lag"
  from chain.block
union all
select
    'chain - marlowe'
  , max(slotno) - (select max(slotno) from marlowe.block)
  from (
    select max(slotno) as slotno
    from chain.txout
      where addresspaymentcredential in (
        '\xd85fa9bc2bdfd97d5ebdbc5e3fc66f7476213c40c21b73b41257f09d'
      , '\x10ec7e02d25f5836b3e1098e0d4d8389e71d7a97a57aa737adc1d1fa'
      , '\x2ed2631dbb277c84334453c5c437b86325d371f0835a28b910a91a6e'
      , '\xe165610232235bbbbeff5b998b233daae42979dec92a6722d9cda989'
      , '\x6a9391d6aa51af28dd876ebb5565b69d1e83e5ac7861506bd29b56b0'
      , '\x49076eab20243dc9462511fb98a9cfb719f86e9692288139b7c91df3'
      )
    union all
    select max(txin.slotno)
      from chain.txin
      inner join chain.txout
        on (txoutid, txoutix) = (txid, txix)
      where txout.addresspaymentcredential in (
        '\xd85fa9bc2bdfd97d5ebdbc5e3fc66f7476213c40c21b73b41257f09d'
      , '\x10ec7e02d25f5836b3e1098e0d4d8389e71d7a97a57aa737adc1d1fa'
      , '\x2ed2631dbb277c84334453c5c437b86325d371f0835a28b910a91a6e'
      , '\xe165610232235bbbbeff5b998b233daae42979dec92a6722d9cda989'
      , '\x6a9391d6aa51af28dd876ebb5565b69d1e83e5ac7861506bd29b56b0'
      , '\x49076eab20243dc9462511fb98a9cfb719f86e9692288139b7c91df3'
      )
  ) maxs
;
