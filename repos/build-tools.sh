#!/usr/bin/env bash

set -evo pipefail

declare -A PKG

PKG['marlowe-cli']=marlowe-cli

PKG['marlowe-runtime-cli']=marlowe-runtime-cli
PKG['marlowe-web-server']=marlowe-runtime-web

PKG['marlowe-pipe']=marlowe-apps
PKG['marlowe-finder']=marlowe-apps
PKG['marlowe-scaling']=marlowe-apps
PKG['marlowe-oracle']=marlowe-apps
PKG['marlowe-streamer']=marlowe-apps
PKG['signing-service']=marlowe-apps

PKG['marlowe-chain-indexer']=marlowe-chain-sync
PKG['marlowe-chain-sync']=marlowe-chain-sync
PKG['marlowe-indexer']=marlowe-runtime
PKG['marlowe-sync']=marlowe-runtime
PKG['marlowe-contract']=marlowe-runtime
PKG['marlowe-tx']=marlowe-runtime
PKG['marlowe-proxy']=marlowe-runtime

cd marlowe-cardano

for exe in ${!PKG[@]}
do
  pkg=${PKG[$exe]}
  nix build .#$pkg-exe-$exe -o ../../build/$exe
done
