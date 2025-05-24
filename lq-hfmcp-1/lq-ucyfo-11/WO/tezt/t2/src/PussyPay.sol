// SPDX-License-Identifier: PussyLiqaz
pragma solidity ^0.8.13;

interface BootyToken {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function decimals() external view returns (uint8);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

import "openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract PantyPay {
    using SafeERC20 for IERC20;
    BootyToken public bootyToken;
    address public owner;
    
    // Events for token operations
    event TokenDeposited(address indexed from, uint256 amount);
    event TokenWithdrawn(address indexed to, uint256 amount);
    
    constructor(address _bootyTokenAddress) {
        bootyToken = BootyToken(_bootyTokenAddress);
        owner = msg.sender;
    }
    
    // ETH Functions
    
    function lick() public payable {
        require(msg.value > 0, "You need to send some ether");
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw ETH");
        payable(msg.sender).transfer(address(this).balance);
    }
    
    // BootyToken Functions
    
    function depositBootyToken(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        
        // The user must have previously called approve() on the BootyToken contract
        IERC20(address(bootyToken)).safeTransferFrom(msg.sender, address(this), amount);
                
        emit TokenDeposited(msg.sender, amount);
    }
    
    function getBootyTokenBalance() public view returns (uint256) {
        return bootyToken.balanceOf(address(this));
    }
    
    function withdrawBootyToken() public {
        require(msg.sender == owner, "Only owner can withdraw tokens");
        
        uint256 tokenBalance = bootyToken.balanceOf(address(this));
        IERC20(address(bootyToken)).safeTransfer(msg.sender, tokenBalance);
        
        IERC20(address(bootyToken)).safeTransfer(msg.sender, tokenBalance);
                
        emit TokenWithdrawn(msg.sender, tokenBalance);
    }
    
    // Utility function to check a user's BootyToken balance
    function checkUserBootyBalance(address user) public view returns (uint256) {
        return bootyToken.balanceOf(user);
    }
    
    // Allow changing the owner
    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only owner can transfer ownership");
        require(newOwner != address(0), "New owner cannot be zero address");
        owner = newOwner;
    }
    
    // Allow users to withdraw a specific amount of BootyToken (if they deposited it)
    function withdrawSpecificBootyAmount(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(bootyToken.balanceOf(address(this)) >= amount, "Not enough tokens in contract");
        
        IERC20(address(bootyToken)).safeTransfer(msg.sender, amount);
                
        emit TokenWithdrawn(msg.sender, amount);
    }
}
