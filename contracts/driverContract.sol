// SPDX-License-Identifier: GPL-30

pragma solidity ^0.6.9;
contract taxiContract {

 
     //define mapping to store key-value pairs.
    mapping(string => userRecord) userRecordMapping;
    
     //organize user records using struct
struct userRecord
    {
        string id; // passanger id
        string name; // passanger name
        uint km; // KM journey
        uint total; // total cost
  }

   
    // save the passanger ride details
    function savePassangerDetails(string memory id, string memory name, uint km, uint total) public  {
        userRecordMapping[id] = userRecord(id, name, km, total);
    }

   // get the passanger name and the total paid.

    function getPassangerDetails(string memory id) public  view returns(string memory name, uint total){
        return (userRecordMapping[id].name, userRecordMapping[id].total);
    }


    int constant base_amount = 100;
    
   
  uint private kilometer;
         uint public payment;
         uint private nightRate = 5;
         uint private price_per_KLM = 20;
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
    

  
     // Receive cryptocoins from its account
     uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

   // display the balance available
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

// Function to pay to the taxidriver using his/her address

    function payToTaxi(address payable _to) public {
       _to.transfer(getBalance());
    }

    
      

    
        
    }

