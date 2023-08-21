#!/usr/bin/env bash

set -veo pipefail

cd marlowe-cardano

TAG=$(git rev-parse HEAD)
echo "TAG = $TAG"

sed -e 's/inherit name;/name = "bwbush\/" + name;/' \
    -e 's/tag = ".*";/tag = "'"$TAG"'";/' \
    -i nix/marlowe-cardano/deploy/oci-images.nix

for img in marlowe-chain-indexer marlowe-chain-sync marlowe-indexer marlowe-sync marlowe-contract marlowe-tx marlowe-proxy marlowe-web-server
do
  nix build .#oci-images.x86_64-linux.$img
  sed -e 's/0108ad4d4fe2e41705eb8a27292d5bbc350419f3121297582583eb209c10799c/247aed5894d312df05ab7d6bf00da3e7f350a6379cecd7ee523c442e5ea74cae/' \
      -e 's/2824de88f9cb5eb6f2bc799cf7d42f60407e40f3ac76e10c684762edc11d0bf6/d1c0cc333cac999bb92cf1130cf4b5c869ca7bb5f572f3f879feac26acc53b9a/' \
      -e 's/3ca5eed860108b71fd3c44e04f89cfe426abf403ed0923c5d18217b1bfded0dd/400a04101de3e7393d2a61383e5142d57a54cf0beca5668852cf4a610d57b2a5/' \
      -e 's/46d6a0780271378747d21ba67469963ec921077f647d7d10f2e56cc13633cd66/b388321ed796d84d12db17c8e45fd4008205b8f9b1f06bfdd66b9f77e1b9096c/' \
      -e 's/4f2fc4931f1cf735af0afe8bb5fbe68f55915836d5d1fb8e639d2089e56e720b/815657abb9b03d0aa1cddcd1a0285d2bfa50da01069acb2d5cc935c7d3043639/' \
      -e 's/be3b00f41937f2bd2607b4d2c81ae50a1828d016c733b61bc731ce5e77304b62/25cc62446fe150f2f9c29c939cf0d56fd29b8fe9c290876b04beb19ae951c932/' \
      result > image.json
  /nix/store/scrk5w110g4djnb4fd44w6msvxhq18p7-skopeo-1.11.1/bin/skopeo --insecure-policy \
    copy nix:image.json docker://docker.io/bwbush/$img:$TAG
done
rm image.json

echo "TAG = $TAG"
