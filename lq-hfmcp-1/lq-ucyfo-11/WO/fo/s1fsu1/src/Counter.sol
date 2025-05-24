// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Booty} from "./Booty.sol";

contract PantyPiss {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    // Function that just shows a message not even related
    function viewMessage() public pure returns (string memory) {
        return "Drink Woman Piss";
    }
}
