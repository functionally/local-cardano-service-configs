#!/usr/bin/env bash

nix-build '<nixpkgs>' -A sqitchPg -o sqitch

nix-build -o ./cardano-node    ../repos/cardano-node      -A cardano-node
nix-build -o ./cardano-cli     ../repos/cardano-node      -A cardano-cli
nix build -o ./cardano-address ../repos/cardano-addresses
nix build -o ./cardano-wallet  ../repos/cardano-wallet
nix build -o ./cardano-db-sync ../repos/cardano-db-sync

nix-build -o ./uplc ../repos/plutus -A plutus.haskell.projectPackages.plutus-core.components.exes.uplc
nix-build -o ./plc  ../repos/plutus -A plutus.haskell.projectPackages.plutus-core.components.exes.plc
nix-build -o ./pir  ../repos/plutus -A plutus.haskell.projectPackages.plutus-core.components.exes.pir
