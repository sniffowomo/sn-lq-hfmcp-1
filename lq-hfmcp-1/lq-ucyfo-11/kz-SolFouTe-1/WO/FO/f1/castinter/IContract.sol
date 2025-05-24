// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface Counter {
    function decrement() external;
    function increment() external;
    function number() external view returns (uint256);
    function setNumber(uint256 newNumber) external;
}
