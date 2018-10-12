pragma solidity ^0.4.22;


contract MultiNumberBettingV2 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    array=[number1,number2,number3];
  }
  function guess(uint8 num,string name )public  returns (bool)
  {
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        winnerCount++;
        lastWinnerName=name;
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
