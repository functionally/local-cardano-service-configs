#!/usr/bin/env bash

set -ev

cd marlowe-cardano

git fetch
git rebase origin/main

nix build .#marlowe-chain-indexer -o ../../build/marlowe-chain-indexer
nix build .#marlowe-chain-sync -o ../../build/marlowe-chain-sync
nix build .#marlowe-indexer -o ../../build/marlowe-indexer
nix build .#marlowe-sync -o ../../build/marlowe-sync
nix build .#marlowe-tx -o ../../build/marlowe-tx
nix build .#marlowe-proxy -o ../../build/marlowe-proxy
nix build .#marlowe-rt -o ../../build/marlowe

nix build .#marlowe-web-server -o ../../build/marlowe-web-server

nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-pipe -o ../../build/marlowe-pipe
nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-finder -o ../../build/marlowe-finder
nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-scaling -o ../../build/marlowe-scaling
nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-oracle -o ../../build/marlowe-oracle
