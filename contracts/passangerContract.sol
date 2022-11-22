// SPDX-License-Identifier: GPL-30

pragma solidity ^0.6.9;

contract {

    
     uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}