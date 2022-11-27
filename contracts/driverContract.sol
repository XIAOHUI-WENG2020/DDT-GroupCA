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


        // uint public balanceReceived;

  uint public kilometer;
         uint public payment;
         uint public nightRate = 5;
         uint public price_per_KLM = 20;
         string  public timeShift = "night";

         
     function setKilometer(uint x) public  {
       kilometer = x;
    }

  function setTimeShift(string memory  y) public  {
           
      // once you set the kilometers traveled by the drivers it will calculate the (number of kilometer * price_per_KLM)
  
          


    //if it is night shift so it will be  (kilometer * nightRate) adding more 5$ per kilometer as you see bellow
       if(keccak256(bytes(y)) == keccak256(bytes(timeShift))) {

         payment = kilometer * price_per_KLM + kilometer * nightRate;

        }
           else{
               // if isnot night shift, than the price will be just (kilometer * price_per_KLM)
               payment = payment = kilometer * price_per_KLM;
           }

  }
    

    function getPayment() public view returns(uint) {
        return payment;
    }        
     


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    
     /*  function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
        
    }
*/
    
        
    }

