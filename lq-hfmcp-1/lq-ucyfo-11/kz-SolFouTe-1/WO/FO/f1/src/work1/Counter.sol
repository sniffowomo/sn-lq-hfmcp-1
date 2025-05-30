// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {SucknFuck} from "../ban1.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function decrement() public {
        number--;
    }
}
