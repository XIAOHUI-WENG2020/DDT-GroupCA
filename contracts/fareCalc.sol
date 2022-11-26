// SPDX-License-Identifier: GPL-30

pragma solidity ^0.6.9;
contract fareCalc {

    //fare calculator.
    int constant base_amount = 100;
    function TaxiCalculator(int km, bool extra) internal pure returns (int total) { 
         int variable_amount = 0;
         if(extra){
             variable_amount = variable_amount + 10;
         }
         return ((base_amount + variable_amount + km)); //randon logic to calculate insurance amount based on age,time_period,alcohol state and smoke state.
    }

        
}