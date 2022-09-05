// SPDX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract MyContract {
    mapping (address => uint) public balance;

    function sendMoney() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdrawTo(address payable _to, uint amount) public {
        require(balance[msg.sender] >= amount, "Not enough funds");
        balance[msg.sender] -= amount;
        _to.transfer(amount);
    } 

    function withdrawToAll(address payable _to) public {
        require(balance[msg.sender] != 0);
        _to.transfer(balance[msg.sender]);
        balance[msg.sender] = 0;
    }
}