pragma solidity ^0.4.22;


contract CalculatorV2 {
  uint stateNumber;
  event numberAdded(address owner,uint n);
  event numberSubstracted(address owner,uint n);
  event numberMultiplied(address owner,uint n);
  event numberDivided(address owner,uint n);
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
       emit numberAdded(msg.sender,number);
       return stateNumber;
  }
  function substractFromStateNumber(uint number) public returns (uint)
  {
    stateNumber -= number;
    emit numberSubstracted(msg.sender,number);
    return stateNumber;
  }
  function multiplyWithNumber(uint number) public returns (uint)
  {  
     stateNumber *= number;
     emit numberMultiplied(msg.sender,number);
      return stateNumber;
  }
   function divideNumberBy(uint number) public returns (uint)
  {  
     stateNumber /= number;
     emit numberDivided(msg.sender,number);
      return stateNumber;
  }

}
