//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract Piggybank {
    event Deposit(uint amount);
    event Withdrawal(uint amount);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdrawal(address(this).balance);
        selfdestruct (payable(msg.sender));
    }
} 
