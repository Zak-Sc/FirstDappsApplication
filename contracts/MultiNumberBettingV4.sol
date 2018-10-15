pragma solidity ^0.4.22;


contract MultiNumberBettingV4 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  uint lastWinnerAt;
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
  function daysSinceLastWinning() returns (uint){
   return (now- lastWinnerAt*1 days);
  }
  function hoursSinceLastWinning()returns (uint){
   return ((now- lastWinnerAt)*1 hours);
    
  }
  function minuteSinceLastWinning()returns (uint){
   return (now- lastWinnerAt*1 minutes);
    
  }
  function Ethdays()returns (uint){
    uint time=now;
   return (time/60/60/24);
    
  }
  function getLastWinnerInf() returns (winner adr, winner name, uint guess, timeGuessed){
    
  }
}
