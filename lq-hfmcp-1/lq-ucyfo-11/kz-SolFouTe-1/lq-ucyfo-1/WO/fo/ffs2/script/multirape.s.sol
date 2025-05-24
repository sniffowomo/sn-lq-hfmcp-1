// Script ot deploy multiple contracts
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/FundMe.sol";

/**
 * The script below is deploying multipl contracts
 * - Since you dont need t use the variable for each contract
 * - Using `new` keyword , The names of the contract are accroding to what is in the actual file
 */
contract RapeAll is Script {
    address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    function run() public {
        vm.startBroadcast();

        new FundMe(priceFeedAddress);
        new BootySmell();

        vm.stopBroadcast();
    }
}
