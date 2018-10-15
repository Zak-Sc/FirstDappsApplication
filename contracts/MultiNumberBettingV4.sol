pragma solidity ^0.4.22;


contract MultiNumberBettingV4 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  address winner;
  struct Winner {
    address winnerAddress;
    uint8 num;
    string guess;
    uint guessedAt;}
  mapping(address => Winner) ListWinner;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    array=[number1,number2,number3];
  }
  function guess(uint8 num,string nameguess )public  returns (bool)
  {
    require(num<10);
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        ListWinner[msg.sender]= Winner(msg.sender,num,nameguess,now);
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
  function getLastWinnerInfo() returns (address winnerAddress, string name, uint guess, uint guessedAt){
    //ListWinner[winnerAddress];
    
  }

}
