// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PantyPiss} from "../src/Counter.sol";

contract PantyScript is Script {
    PantyPiss public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new PantyPiss();

        vm.stopBroadcast();
    }
}
