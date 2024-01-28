#!/usr/bin/env bash

set -evo pipefail

TAG=latest

declare -A PKG

PKG['marlowe-cli']=marlowe-cli

PKG['marlowe-chain-indexer']=marlowe-chain-sync
PKG['marlowe-chain-sync']=marlowe-chain-sync
PKG['marlowe-indexer']=marlowe-runtime
PKG['marlowe-sync']=marlowe-runtime
PKG['marlowe-contract']=marlowe-runtime
PKG['marlowe-tx']=marlowe-runtime
PKG['marlowe-proxy']=marlowe-runtime

PKG['marlowe-web-server']=marlowe-runtime-web

PKG['marlowe-pipe']=marlowe-apps
PKG['marlowe-oracle']=marlowe-apps
PKG['marlowe-benchmark']=marlowe-benchmark

cd marlowe-cardano

for exe in ${!PKG[@]}
do
  pkg=${PKG[$exe]}
  nix build .#$exe.project.projectCross.musl64.hsPkgs.$pkg.components.exes.$exe
  cp -p result/bin/$exe ../../static/
done
