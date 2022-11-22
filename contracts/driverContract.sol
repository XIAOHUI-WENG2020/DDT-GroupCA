// SPDX-License-Identifier: GPL-30

pragma solidity ^0.6.9;

contract taxiContract {

struct userRecord
    {
        string name;
        int fare;
        bool time;
  }
    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
}