// SPDX-License-Identifier: GPL-30

// author: Yuri Ribeiro 2020347

pragma solidity ^0.8.7;

contract PassangerContract {

    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function payTo(address payable _to) public {
        _to.transfer(getBalance());
    }    
}