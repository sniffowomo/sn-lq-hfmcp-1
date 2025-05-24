// Source - https://github.com/Cyfrin/foundry-simple-storage-cu/blob/main/src/SimpleStorage.sol

// SPDX-License-Identifier: SmellPanty
pragma solidity ^0.8.19;

import "./booty.sol";

// Initial Contract
contract SimpleStorage {
    // Storage for the favNum
    uint256 myFavNum;

    // Person Struct which will be reused
    struct Person {
        uint256 favNum;
        string name;
    }

    // Init person struct
    Person[] public listofPeople;

    // Maps the name to the favNum
    mapping(string => uint256) public nameToFavNum;

    // Storage Function of favnum
    function store(uint256 _myFavNum) public {
        myFavNum = _myFavNum;
    }

    // Retrieveal function
    function retrieve() public view returns (uint256) {
        return myFavNum;
    }

    // Function for adding person
    function addPerson(string memory _name, uint256 _favNum) public {
        listofPeople.push(Person(_favNum, _name));
        nameToFavNum[_name] = _favNum;
    }
}
