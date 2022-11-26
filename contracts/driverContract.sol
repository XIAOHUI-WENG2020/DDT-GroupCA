// SPDX-License-Identifier: GPL-30

pragma solidity ^0.6.9;
import "./fareCalc.sol";
contract taxiContract {

 
     //define mapping to store key-value pairs.
    mapping(string => userRecord) userRecordMapping;
    
     //organize user records using struct
struct userRecord
    {
        string id;
        string name;
        int km;
        int fare;
        bool extra;
        int total;
  }

   
    
    function saveUserDetails(string memory id, string memory name, int fare, int km, bool extra, int total) public  {
        userRecordMapping[id] = userRecord(id, name, fare, km, extra, total);
    }

    function getUserDetails(string memory id) public  view returns(string memory name, int total){
        return (userRecordMapping[id].name, userRecordMapping[id].total);
    }


    int constant base_amount = 100;
    
        // function responsible to perfom the calculation of the total amount
  //  function TaxiCalculator(int km) public view  { 
  //       int variable_amount = 10;
  //       int base_amount = 20
  //          return ((base_amount + variable_amount + km));   
 //        }


         uint public balanceReceived;

 
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
        
    }

    

