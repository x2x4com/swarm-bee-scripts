#!/bin/bash

DEBUG_API=http://localhost:1635

function getBalances() {
    curl -s ${DEBUG_API}/chequebook/balance | jq
}

function withdraw() {
    local amount=$1

    [[ "x${amount}" == "x" ]] && echo "amount not defined" && exit 1
    [[ $(echo "${amount}" | grep '^[[:digit:]]*$' -c) -eq 0 ]] && echo "amount not digit" && exit 1
    curl -s -XPOST ${DEBUG_API}/chequebook/withdraw?amount=${amount} | jq
}

case $1 in
withdraw)
  echo "Balance before"
  getBalances
  withdraw $2
  echo "Wait for trans finish"
  sleep 10
  echo "Balance after"
  getBalances
  ;;
balances|*)
  getBalances
  ;;
esac
