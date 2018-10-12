pragma solidity ^0.4.22;


contract MultiNumberBettingV3 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName;
  uint lastWinnerAt;
  address winner;
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
        winnerCount++;
        lastWinnerName=nameguess;
        lastWinnerAt=now;
        winner=msg.sender;
        return true;

      }
     
    }
      loserCount++;
      return false;
  }
  function totalGuesses() public view  returns(uint){
    return loserCount+winnerCount;
  }
  function getLastWinner() public view returns(string){
    bytes  memory nameBytes=bytes(lastWinnerName);
    if(nameBytes.length ==0){
    return "***";
    }
    else{
    string memory s=new string(3);
    bytes memory bytess=bytes(s);

    for(uint i=0;(i<3) && (i<nameBytes.length);i++)
    {
         bytess[i]=nameBytes[i];
    }
    return string(bytess);
    }
    
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
}
