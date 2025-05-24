// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SmellPanty} from "../src/Myco.sol";

contract GaandSmells is Script {
    SmellPanty public smellpanty;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        smellpanty = new SmellPanty();

        vm.stopBroadcast();
    }
}
