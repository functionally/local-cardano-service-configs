#!/usr/bin/env bash

set -ev

cd marlowe-cardano

nix build .#marlowe-cli-exe-marlowe-cli-ghc8107 -o ../../build/marlowe-cli

nix build .#marlowe-chain-sync-exe-marlowe-chain-indexer-ghc8107 -o ../../build/marlowe-chain-indexer
nix build .#marlowe-chain-sync-exe-marlowe-chain-sync-ghc8107 -o ../../build/marlowe-chain-sync
nix build .#marlowe-runtime-exe-marlowe-indexer-ghc8107 -o ../../build/marlowe-indexer
nix build .#marlowe-runtime-exe-marlowe-sync-ghc8107 -o ../../build/marlowe-sync
nix build .#marlowe-runtime-exe-marlowe-contract-ghc8107 -o ../../build/marlowe-contract
nix build .#marlowe-runtime-exe-marlowe-tx-ghc8107 -o ../../build/marlowe-tx
nix build .#marlowe-runtime-exe-marlowe-proxy-ghc8107 -o ../../build/marlowe-proxy

nix build .#marlowe-runtime-cli-exe-marlowe-runtime-cli-ghc8107 -o ../../build/marlowe-runtime-cli
nix build .#marlowe-runtime-web-exe-marlowe-web-server-ghc8107 -o ../../build/marlowe-web-server

nix build .#marlowe-apps-exe-marlowe-pipe-ghc8107 -o ../../build/marlowe-pipe
nix build .#marlowe-apps-exe-marlowe-finder-ghc8107 -o ../../build/marlowe-finder
nix build .#marlowe-apps-exe-marlowe-scaling-ghc8107 -o ../../build/marlowe-scaling
nix build .#marlowe-apps-exe-marlowe-oracle-ghc8107 -o ../../build/marlowe-oracle
nix build .#marlowe-apps-exe-marlowe-streamer-ghc8107 -o ../../build/marlowe-streamer
nix build .#marlowe-apps-exe-signing-service-ghc8107 -o ../../build/signing-service
