pragma solidity ^0.4.22;


contract Calculator {
  uint stateNumber;
  constructor(uint number) public {
    stateNumber=number;
  }
  function getNumber() public view returns (uint)
  {
    return stateNumber;
  }
  function AddToStateNumber(uint number) public returns (uint) 
  {
       stateNumber+=number;
       return stateNumber;
  }
  function substractFromStateNumber(uint number) public returns (uint)
  {
    stateNumber -= number;
    return stateNumber;
  }
  function multiplyWithNumber(uint number) public returns (uint)
  {  
     stateNumber *= number;
      return stateNumber;
  }
   function divideNumberBy(uint number) public returns (uint)
  {  
     stateNumber *= number;
      return stateNumber;
  }

}
