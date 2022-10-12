# An EC2 Instance for Marlowe Runtime


## Using the instance by logging into it

```console
$ ssh 54.202.238.5
Last login: Tue Oct 11 21:40:02 2022 from 97.118.209.114

$ source /data/networks/preview/configure.env 

$ $MARLOWE_BIN/cardano-cli query tip ${MAGIC[@]}
{
    "block": 256060,
    "epoch": 63,
    "era": "Babbage",
    "hash": "6544dc61e61122c79eb082c6731db0e63fccf2445f9d077db65de240f7a5e5c2",
    "slot": 5522201,
    "syncProgress": "100.00"
}

$ $MARLOWE_BIN/marlowe ls --all | head
02811e36c6cdac4721b53f718c4a1406e09ef0d985f9ad6b7fd676769e2f866c#1
045d4ac6f50c57cade58fd697b907ff0418637ba1eadb36392e04d1c5d489b21#1
0552fc00860d35d45c09b4b43740193579adbeea5097cf33b62201332e3095ee#1
05574d9d1935d2a5d2e3cb15e79d46b076e4c81d85bd2e12940ed47b628001be#1
05990678496287262051fc831ff35903e383ffc564b943de76e78394a8ceb4cd#1
061d29872aae0580496aecc8bed3a7a11d743c55d24f6d2c5c03c630cf89e899#1
066727dc5d40a6df33bb88dea3d29a9c1bb9b68493870ef9a04d6cbffe11e21b#1
06718671646f66d1818fce1d2532a3bb2050a42df164c71c3306f9c67ba6f1ab#1
06ddf0488df24a26882abf9546a8d314994b768465246172f8b4492e8a820162#1
072b7513bfae663c993d21977e6b1c2231a6fb389d09595a1e3d4ee517b5a6ed#1
```


## Using the instance remotely

Here is an example for the `preview` network.

```console
$ rm /tmp/preview.socket
$ ssh -NT -L/tmp/preview.socket:/data/networks/preview/node.socket \
         -L 3717:127.0.0.1:23717 \
         -L 3718:127.0.0.1:23718 \
         -L 3719:127.0.0.1:23719 \
         -L 3721:127.0.0.1:23721 \
         -L 3723:127.0.0.1:23723 \
         54.202.238.5

$ CARDANO_NODE_SOCKET_PATH=/tmp/preview.socket cardano-cli query tip --testnet-magic 2
{
    "block": 256438,
    "epoch": 64,
    "era": "Babbage",
    "hash": "d009d2674e8fe76b762d2b55c13b8602d62e96a8ecea1207ae42bf483cdb2e90",
    "slot": 5533288,
    "syncProgress": "100.00"
}

$ marlowe ls --all | head
02811e36c6cdac4721b53f718c4a1406e09ef0d985f9ad6b7fd676769e2f866c#1
045d4ac6f50c57cade58fd697b907ff0418637ba1eadb36392e04d1c5d489b21#1
0552fc00860d35d45c09b4b43740193579adbeea5097cf33b62201332e3095ee#1
05574d9d1935d2a5d2e3cb15e79d46b076e4c81d85bd2e12940ed47b628001be#1
05990678496287262051fc831ff35903e383ffc564b943de76e78394a8ceb4cd#1
061d29872aae0580496aecc8bed3a7a11d743c55d24f6d2c5c03c630cf89e899#1
066727dc5d40a6df33bb88dea3d29a9c1bb9b68493870ef9a04d6cbffe11e21b#1
06718671646f66d1818fce1d2532a3bb2050a42df164c71c3306f9c67ba6f1ab#1
06ddf0488df24a26882abf9546a8d314994b768465246172f8b4492e8a820162#1
072b7513bfae663c993d21977e6b1c2231a6fb389d09595a1e3d4ee517b5a6ed#1
```
