#!/bin/bash

eth_grpc_api="https://goerli.infura.io/v3/3e88bb0189ea44c0904699e0dfff5641"

curl -XPOST -s -d '{"jsonrpc":"2.0","id":1,"method":"eth_call","params":[{"data":"0xc4dbf622000000000000000000000000000000000000000000000000002386f26fc10000","to":"0x49e3cfe28ca3cd0eaf48ad53aa69481f3adc6ec9"},"latest"]}' ${eth_grpc_api} | jq .result

