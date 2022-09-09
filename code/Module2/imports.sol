pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

contract MyContract{
    using SafeMath for uint;

    mapping(address=> uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function send(address _to, uint amount) public {
        balance[msg.sender] = balance[msg.sender].sub(amount);
        balance[_to] = balance[_to].add(amount);
    }
}