#!/usr/bin/env bash

set -e

declare -A DERIV
declare -A REPO

DERIV['uplc']='uplc'
DERIV['plc']='plc'
DERIV['pir']='pir'
DERIV['traceToStacks']='traceToStacks'
DERIV['debugger']='debugger'
DERIV['cardano-node']='cardano-node'
DERIV['cardano-cli']='cardano-cli'
DERIV['cardano-wallet']='cardano-wallet'
DERIV['cardano-address']='cardano-addresses-cli:exe:cardano-address'

REPO['uplc']='github:input-output-hk/plutus?ref=1.17.0.0'
REPO['plc']='github:input-output-hk/plutus?ref=1.17.0.0'
REPO['pir']='github:input-output-hk/plutus?ref=1.17.0.0'
REPO['traceToStacks']='github:input-output-hk/plutus?ref=1.17.0.0'
REPO['debugger']='github:input-output-hk/plutus?ref=1.17.0.0'
REPO['cardano-node']='github:input-output-hk/cardano-node?ref=8.1.2'
REPO['cardano-cli']='github:input-output-hk/cardano-node?ref=8.1.2'
REPO['cardano-wallet']='github:input-output-hk/cardano-wallet/v2023-07-18'
REPO['cardano-address']='github:input-output-hk/cardano-addresses/3.12.0'

for exe in ${!DERIV[@]}
do
  repo=${REPO[$exe]}
  deriv=${DERIV[$exe]}
  nix build "$repo#$deriv" -o "../build/$exe"
done
