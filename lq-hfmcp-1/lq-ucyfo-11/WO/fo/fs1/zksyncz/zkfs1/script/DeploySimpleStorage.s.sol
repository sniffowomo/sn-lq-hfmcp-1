// Solidity for deploying a script
// SPDX-License-Identifier: SmellPanty

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // Foundry CheatCode - https://book.getfoundry.sh/cheatcodes/
        vm.startBroadcast();

        // Storing the deployed contract address in a variable
        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast(); // Foundry Cheat Code

        return simpleStorage;
    }
}
