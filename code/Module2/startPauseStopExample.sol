// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract{
    address owner;
    uint public balance;
    bool public paused = false;

    constructor() public {
        owner = msg.sender;
    }

    function setPause() public {
        require(msg.sender == owner, "You aere not the owner!");
        paused = !paused;
    }

    function sendMoney() public payable {
        require(!paused, "Contract is paused");
        balance += msg.value;
    }

    function withdrawAll(address payable _to) public {
        require(!paused, "Contact is paused!");
        require(_to == owner, "You are not the owner!");
        _to.transfer(address(this).balance);
        balance = 0;
    }

    function destroy (address payable _to) public {
        require(!paused, "Contract is paused!");
        require(msg.sender == owner);
        selfdestruct(_to);
    }
}