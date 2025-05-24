## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# External Resources 

1. List of external resources referenced in the course 

Repo | Description
:--: | :--:
[`Chainlink-Brownie-Contracts`](https://github.com/smartcontractkit/chainlink-brownie-contracts) | Imports referenced

Command to install 

```sh 
forge install smartcontractkit/chainlink-brownie-contracts --no-commit
```

- Regarding mappings for some reason the remappings.txt works and not remappings in foundry.toml

1. For `AggregatorV3Interface.sol` - you need the contract which aggregates the price [`0x694AA1769357215DE4FAC081bf1f309aDC325306`](https://docs.chain.link/data-feeds/price-feeds/addresses?page=1&network=ethereum&search=#sepolia-testnet)