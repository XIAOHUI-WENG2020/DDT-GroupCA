// SPDX-License-Identifier: GPL-30

// author: Yuri Ribeiro 2020347

pragma solidity ^0.6.9;

contract PassangerContract {

    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }


// Function to pay to the taxidriver using his/her address
    function payToTaxi(address payable _to) public {
        _to.transfer(getBalance());
    }    
}