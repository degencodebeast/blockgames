// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Objectives
//Implement an ERC20 token with fixed supply of 1,000,000 tokens
//Add a payable function "buyToken", which receives an ethereum address "receiver" as a parameter
//This function increments the token balance of the receiver with bought tokens
//The cost of buying tokens is 1000 tokens per ETH
//Increment the total supply

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MagicToken is ERC20, Ownable {
    uint256 public tokenPrice = 1 * 10 ** 15;//You can only mint 1000 tokens with one ETH
    uint256 public amountPurchased;
    
    address public ownerAcc;

    mapping (address => uint256) public balances;

    constructor() ERC20("Magic Token", "MGT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());

    }     
    

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    //This contract needs some ETH to be able to mint more tokens at 
    //a certain price of 1000 tokens per ETH
    //The minted tokens will be sent to the address that minted
    //when these tokens are minted, it increments the total supply
    // of the total tokens

    //cost to mint one MGT token is 1/1000 ETH
    function buyToken(address receiver) public payable {
        
        //msg.value is the amount of ETH sent to the contract   
        //msg.value = 1 * 10 ** 18; //amount supposed to be sent for one token
        require(msg.value >= 1 * 10 ** 18, "Not enough ETH to mint");
        amountPurchased = msg.value / tokenPrice;

        mint(receiver, amountPurchased);

        //This updates the account of the receiver with the amount of tokens bought
        balances[receiver] += amountPurchased;
        
    }

}


    
