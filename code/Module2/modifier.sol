pragma solidity ^0.5.13;

contract Owned {
    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner");
        _;
    }
}

contract MyContract is Owned{
    mapping(address => uint) public TokenBalances;

    constructor() public {
        TokenBalances[owner] = 100;
    }

    function createToken() public onlyOwner{
        TokenBalances[owner] ++;
    }
    function burnToken() public onlyOwner {
        TokenBalances[owner] --;
    }


}