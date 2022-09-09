// SPDX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract Wallet {

    function withdrawMoney(address payable _to, uint amount) public {
        _to.transfer(amount);
    }

    function() external payable {

    }
}