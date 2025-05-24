// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/work1/Counter.sol";
import {ICounter} from "../src/work1/IContract.sol";

// Global Variables

address constant COUNTER_ADDRESS = 0x32A22D4FE5d4ee9F9045F6ebc7834574b720FA78;

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new Counter();

        vm.stopBroadcast();
    }
}

// Counter interaction script

contract CounterInteractor is Script {
    function run() public {
        // Start broadcasting transactions from the signer
        vm.startBroadcast();

        Counter counter = Counter(COUNTER_ADDRESS);

        // Read current number
        console.log("Current number:", counter.number());

        // Set number
        counter.setNumber(100);
        console.log("Set number to 69");

        // Increment
        counter.increment();
        console.log("Incremented. New number:", counter.number());

        // Decrement
        counter.decrement();
        console.log("Decremented. New number:", counter.number());

        vm.stopBroadcast();
    }
}

// Counter Intractor with Interface

contract CoInInt is Script {
    function run() public {
        // Start broadcasting transactions from the default signer
        vm.startBroadcast();

        // Cast the address to the interface
        ICounter counter = ICounter(COUNTER_ADDRESS);

        // 🔍 Read current value (view function - no transaction)
        uint256 current = counter.number();
        console.log("Current number:", current);

        // ➕ Set number
        uint256 newValue = 100;
        counter.setNumber(newValue);
        console.log("Set number to:", newValue);

        // ➚ Increment
        counter.increment();
        console.log("Incremented. New number:", counter.number());

        // ➘ Decrement
        counter.decrement();
        console.log("Decremented. New number:", counter.number());

        vm.stopBroadcast();
    }
}
