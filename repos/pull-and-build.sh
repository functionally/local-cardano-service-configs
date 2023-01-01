#!/usr/bin/env bash

set -ev

cd marlowe-cardano

git fetch
git rebase origin/main

nix build .#chainseekd -o ../../build/chainseekd
nix build .#marlowe-chain-indexer -o ../../build/marlowe-chain-indexer
nix build .#marlowe-history -o ../../build/marlowe-history
nix build .#marlowe-discovery -o ../../build/marlowe-discovery
nix build .#marlowe-tx -o ../../build/marlowe-tx
nix build .#marlowe-rt -o ../../build/marlowe

nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-scaling -o ../../build/marlowe-scaling
nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-oracle -o ../../build/marlowe-oracle
nix build .#marlowe.haskell.packages.marlowe-apps.components.exes.marlowe-finder -o ../../build/marlowe-finder

