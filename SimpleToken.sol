// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleToken {
    mapping (address => uint256) balanceOf;

    constructor(uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 value) public {
        if (balanceOf[msg.sender] >= value && 
            balanceOf[msg.sender] + value > balanceOf[to]) { 
        balanceOf[msg.sender] -= value; //Subtract the value from the sender
        balanceOf[msg.sender] += value; //Add the same value to the recipient
        }
    }

    function balance() public view returns (uint256) {
        return balanceOf[msg.sender];
    }
}