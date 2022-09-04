pragma solidity ^0.5.11;

contract MyContract{
    string public myString = "Hello World";
    uint256 public myUint; // will be equal to 0
    bool public myBool;
    address public myAddr;
    // variables are init by default

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function setMyAddress(address _Addr) public {
        myAddr = _Addr;
    }

    function getBalance() public view returns(uint){
        return myAddr.balance;
    }
    // in uint8, suppose we have value 0 and we reduce it by 1
    // then the result would be 255 i.e 2^8, as 'u' means unsigned.
}