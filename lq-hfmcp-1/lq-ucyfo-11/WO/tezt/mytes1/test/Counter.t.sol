// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BootySniff} from "../src/Counter.sol";

contract CounterTest is Test {
    BootySniff public bootysniff;

    function setUp() public {
        bootysniff = new BootySniff();
        bootysniff.setNumber(0);
    }

    function test_Increment() public {
        bootysniff.increment();
        assertEq(bootysniff.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        bootysniff.setNumber(x);
        assertEq(bootysniff.number(), x);
    }
}
