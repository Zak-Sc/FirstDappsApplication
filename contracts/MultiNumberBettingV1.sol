pragma solidity ^0.4.22;


contract MultiNumberBettingV1 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    /*array.push(number1);
    array.push(number2);
    array.push(number3);*/
    array=[number1,number2,number3];
  }
  function guess(uint8 num )public  returns (bool)
  {
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        winnerCount++;
        return true;

      }
     
    }
      loserCount++;
      return false;
  }
  function totalGuesses() public view  returns(uint){
    return loserCount+winnerCount;
  }
}
