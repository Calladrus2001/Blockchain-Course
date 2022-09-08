pragma solidity ^0.5.13;

contract MyContract{

    event tokenSent(address _from, address _to, uint amount);
    mapping (address => uint) public tokenBalance;

    constructor() public {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough balance");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit tokenSent(msg.sender, _to, _amount);
        return true;
    }
}