// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {BootySniff} from "../src/BootySniff.sol";

contract BootyDeploy is Script {
    function run() public {
        vm.startBroadcast();

        BootySniff booty = new BootySniff();

        vm.stopBroadcast();
    }
}
