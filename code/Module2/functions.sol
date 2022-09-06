pragma solidity ^0.5.13;

contract Mycontract {
    address payable owner;
    mapping (address => uint) balances;

    constructor() public {
        owner = msg.sender;
    }
    function getOwner() public view returns (address) {
        return owner;
    }
    function destroy() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
    function recieve() public payable {
        balances[msg.sender] += msg.value;
    }

    // a pure function does not interact with internal storage variables
    // a view function can access variables, but only in a READ-ONLY manner

    function withdrawTo(address payable _to, uint amount) public payable {
        require(amount <= balances[msg.sender]);
        _to.transfer(amount);
    }

    function WeiToEther(uint _amount) public pure returns (uint) {
        return _amount/ 1 ether;
    }
}