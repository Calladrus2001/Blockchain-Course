pragma solidity ^0.5.13;

contract SendMoney {
    uint256 public balanceRecieved;
    uint256 public lockedUntil;

    function recieveMoney() public payable {
        balanceRecieved += msg.value;
        // setting the lock
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        // checking if 1 minute has passed
        if (lockedUntil < block.timestamp) {
            address payable to = msg.sender;
            to.transfer(this.getBalance());
        }
    }

    function withdrawMoneyTo(address payable _to) public {
        // checking if 1 minute has passed
        if (lockedUntil < block.timestamp) {
            _to.transfer(this.getBalance());
        }
    }
}
